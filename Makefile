#
# Copyright (C) 2021 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

BOARD:=amlogic
BOARDNAME:=Amlogic Meson
FEATURES:=ext4 squashfs usb display gpio fpu rootfs-part boot-part
SUBTARGETS:=gx sm1

KERNEL_PATCHVER=5.10
KERNELNAME:=Image dtbs

define Target/Description
	Build firmware image for Amlogic SoC devices.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools partx-utils mkf2fs e2fsprogs cfdisk \
					iperf3 htop lm-sensors autocore-arm automount autosamba \
					kmod-hid kmod-hid-generic kmod-usb-net kmod-usb-net-asix kmod-usb-net-asix-ax88179 \
					kmod-usb-net-rtl8150 kmod-usb-net-rtl8152-vendor kmod-usb-net-rndis

$(eval $(call BuildTarget))
