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
  IMAGE/sysupgrade.img.gz := boot-common | boot-script mmc | boot-img | gzip | append-metadata
  IMAGE/factory.img.gz := boot-common | boot-script mmc | boot-img | gzip
  DEVICE_PACKAGES := \
    kmod-usb-net kmod-usb-net-rtl8152 \
    kmod-brcmfmac wpad-basic-wolfssl cypress-firmware-43455-sdio \
    kmod-hid kmod-hid-generic triggerhappy
endef
TARGET_DEVICES += amediatech_x96-air

define Device/phicomm-n1
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := N1
  SOC := meson-gxl-s905d
  UBOOT_DEVICE_NAME := phicomm-n1
  IMAGE/sysupgrade.img.gz := boot-common | boot-script mmc | boot-img | gzip | append-metadata
  IMAGE/factory.img.gz := boot-common | boot-script mmc | boot-img | gzip
  DEVICE_PACKAGES := \
    kmod-usb-net kmod-usb-net-rtl8152 \
    kmod-brcmfmac wpad-basic-wolfssl cypress-firmware-43455-sdio
endef
TARGET_DEVICES += phicomm-n1
