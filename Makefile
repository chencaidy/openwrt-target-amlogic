#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

BOARD:=amlogic
BOARDNAME:=Amlogic Meson
FEATURES:=ext4 squashfs audio usb display gpio fpu rootfs-part boot-part
SUBTARGETS:=armv8

KERNEL_PATCHVER=5.4

define Target/Description
	Build firmware image for Amlogic SoC devices.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += kmod-gpio-button-hotplug \
			partx-utils e2fsprogs mkf2fs fdisk \
		    autocore-arm automount autosamba \
			ethtool iperf3 haveged htop lm-sensors \
		    luci-app-zerotier

KERNELNAME:=Image dtbs

$(eval $(call BuildTarget))
