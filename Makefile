#
# Copyright (C) 2021 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

BOARD:=amlogic
BOARDNAME:=Amlogic Meson
FEATURES:=ext4 squashfs audio usb display gpio fpu rootfs-part boot-part
SUBTARGETS:=mesongx mesonsm1

KERNEL_PATCHVER=5.10
KERNELNAME:=Image dtbs

define Target/Description
	Build firmware image for Amlogic SoC devices.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools partx-utils e2fsprogs mkf2fs fdisk \
					autocore-arm automount autosamba ipv6helper \
					ethtool iperf3 curl haveged htop lm-sensors \
					luci-app-zerotier

# Kernel packages
DEFAULT_PACKAGES += kmod-hid kmod-hid-generic \
					kmod-usb-net kmod-usb-net-rtl8152 kmod-usb-net-rndis

# Application packages
DEFAULT_PACKAGES += coreutils coreutils-nohup ruby ruby-yaml libcap libcap-bin \
					luci-app-adbyby-plus luci-app-aria2 luci-app-diskman luci-app-docker \
					luci-app-frpc luci-app-hd-idle luci-app-jd-dailybonus luci-app-minidlna \
					luci-app-netdata luci-app-transmission luci-app-ttyd luci-app-usb-printer \
					luci-app-vssr luci-app-xlnetacc luci-theme-argon

$(eval $(call BuildTarget))
