# 
# Copyright (C) 2020 Chen Caidy
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Device/phicomm_n1
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := N1
  SOC := meson-gxl-s905d
  UBOOT_DEVICE_NAME := phicomm-n1
  IMAGE/sdcard.img.gz := boot-common | auto-script phicomm-n1 | boot-script | boot-img | gzip | append-metadata
  DEVICE_PACKAGES := \
    kmod-brcmfmac wpad-basic-wolfssl cypress-firmware-43455-sdio
endef
TARGET_DEVICES += phicomm_n1
