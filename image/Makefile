#
# Copyright (C) 2021 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

FAT32_BLOCK_SIZE = 1024
FAT32_BLOCKS = $(shell echo $$(($(CONFIG_TARGET_KERNEL_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

define Build/Compile
	$(CP) $(LINUX_DIR)/COPYING $(KDIR)/COPYING.linux
endef

### Image scripts ###
define Build/boot-common
	rm -f $@.boot
	mkfs.fat -n BOOT -C $@.boot $(FAT32_BLOCKS)
	mcopy -i $@.boot $(KDIR)/COPYING.linux ::
	mcopy -i $@.boot $(IMAGE_KERNEL) ::kernel.img
	mcopy -i $@.boot $(DTS_DIR)/$(DEVICE_DTS).dtb ::dtb.img
	mcopy -i $@.boot $(STAGING_DIR_IMAGE)/$(UBOOT_DEVICE_NAME)-u-boot.bin ::u-boot.img
endef

# Make Amlogic autoscript to load mainline U-boot
define Build/auto-script
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'auto_script' \
		-d autoscript/$(if $(1),$(1),default).autoscript \
		$(KDIR)/aml_autoscript
	mcopy -i $@.boot $(KDIR)/aml_autoscript ::
endef

# Make U-boot script and copy it to the boot partition
define Build/boot-script
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'OpenWrt bootscript' \
		-d bootscript/$(if $(1),$(1),default).bootscript \
		$(KDIR)/boot.scr
	mcopy -i $@.boot $(KDIR)/boot.scr ::
endef

# Create the final SD/eMMC images
define Build/boot-img
	./gen_aml_image.sh $@ $@.boot $(IMAGE_ROOTFS) \
		$(CONFIG_TARGET_KERNEL_PARTSIZE) $(CONFIG_TARGET_ROOTFS_PARTSIZE)
endef

# Copy the bootable u-boot to the image at sector 0x200
define Build/boot-sm1
	dd if="$(STAGING_DIR_IMAGE)"/$(UBOOT_DEVICE_NAME)-u-boot.sd.bin of="$@" bs=1 count=444 conv=notrunc
	dd if="$(STAGING_DIR_IMAGE)"/$(UBOOT_DEVICE_NAME)-u-boot.sd.bin of="$@" bs=512 skip=1 seek=1 conv=notrunc
endef

### Devices ###
define Device/Default
  PROFILES := Default
  KERNEL := kernel-bin
  IMAGES := sdcard.img.gz
  SUPPORTED_DEVICES := $(subst _,$(comma),$(1))
  DEVICE_DTS = amlogic/$$(SOC)-$(lastword $(subst _, ,$(1)))
endef

include $(SUBTARGET).mk

$(eval $(call BuildImage))
