# 
# Copyright (C) 2020 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Device/x96-air
  DEVICE_VENDOR := Amediatech
  DEVICE_MODEL := X96 Air
  SOC := meson-sm1
  UBOOT_DEVICE_NAME := amedia-x96
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | boot-img | gzip | append-metadata
  IMAGE/factory.img.gz := boot-common | boot-script | boot-img | gzip
  DEVICE_PACKAGES := \
    kmod-brcmfmac wpad-basic-wolfssl cypress-firmware-43455-sdio \
    triggerhappy
endef
TARGET_DEVICES += x96-air
