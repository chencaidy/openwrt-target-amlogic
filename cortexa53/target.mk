#
# Copyright (C) 2021 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARDNAME:=Meson GX/AXG/G12A boards
CPU_TYPE:=cortex-a53

define Target/Description
	Build firmware image for Amlogic Meson GX/AXG/G12A devices.
	This firmware features a 64 bit kernel.
endef
