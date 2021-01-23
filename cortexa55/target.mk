#
# Copyright (C) 2021 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARDNAME:=Meson SM1 boards
CPU_TYPE:=cortex-a55

define Target/Description
	Build firmware image for Amlogic Meson SM1 devices.
	This firmware features a 64 bit kernel.
endef
