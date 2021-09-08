# 
# Copyright (C) 2020 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Device/amediatech_x96-air
  DEVICE_VENDOR := Amediatech
  DEVICE_MODEL := X96 Air
  SOC := meson-sm1
  UBOOT_DEVICE_NAME := amedia-x96
  IMAGE/sdcard.img.gz := boot-common | boot-script | boot-img | boot-sm1 | gzip | append-metadata
  DEVICE_PACKAGES := triggerhappy
endef
TARGET_DEVICES += amediatech_x96-air
