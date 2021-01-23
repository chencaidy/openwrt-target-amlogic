#
# Copyright (C) 2021 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

DEVICE_VARS += UBOOT_DEVICE_NAME

define Build/Compile
	$(CP) $(LINUX_DIR)/COPYING $(KDIR)/COPYING.linux
endef

### Image scripts ###
define Build/boot-common
	# This creates a new folder copies the dtb (as dtb.img) 
	# and the kernel image (as kernel.img)
	rm -fR $@.boot
	mkdir -p $@.boot

	$(CP) $(DTS_DIR)/$(DEVICE_DTS).dtb $@.boot/dtb.img
	$(CP) $(IMAGE_KERNEL) $@.boot/kernel.img
	# Copy the u-boot image to the boot partition
	$(CP) $(STAGING_DIR_IMAGE)/$(UBOOT_DEVICE_NAME)-u-boot.bin $@.boot/u-boot.img
endef

define Build/auto-script
	# Make amlogic autoscript to load mainline U-boot
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'auto_script' \
		-d autoscript/$(if $(1),$(1),default).autoscript \
		$@.boot/aml_autoscript
endef

define Build/boot-script
	# Make an U-boot image and copy it to the boot partition
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'OpenWrt bootscript' \
		-d bootscript/$(if $(1),$(1),default).bootscript \
		$@.boot/boot.scr
endef

define Build/boot-img
	# Creates the final SD/eMMC images, 
	# combining boot partition, root partition as well as the u-boot bootloader
	./gen_aml_image.sh \
		$@ \
		$(CONFIG_TARGET_KERNEL_PARTSIZE) $@.boot \
		$(CONFIG_TARGET_ROOTFS_PARTSIZE) $(IMAGE_ROOTFS) \
		32768

	# Copy the bootable u-boot to the image at sector 0x200
	dd if="$(STAGING_DIR_IMAGE)"/$(UBOOT_DEVICE_NAME)-u-boot.sd.bin of="$@" bs=1 count=444 conv=notrunc
	dd if="$(STAGING_DIR_IMAGE)"/$(UBOOT_DEVICE_NAME)-u-boot.sd.bin of="$@" bs=512 skip=1 seek=1 conv=notrunc
endef

### Devices ###
define Device/Default
  PROFILES := Default
  KERNEL := kernel-bin
  IMAGES := factory.img.gz sysupgrade.img.gz
  SUPPORTED_DEVICES := $(subst _,$(comma),$(1))
  DEVICE_DTS = amlogic/$$(SOC)-$(lastword $(subst _, ,$(1)))
endef

include $(SUBTARGET).mk

$(eval $(call BuildImage))
