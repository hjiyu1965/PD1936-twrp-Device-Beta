# Copyright (C) 2025 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo485

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo485

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := msmnile
TARGET_BOARD_PLATFORM_GPU := qcom-adreno640
BOARD_USES_QCOM_HARDWARE := true

# Kernel
BOARD_KERNEL_CMDLINE := console= earlycon= androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 androidboot.usbcontroller=a600000.dwc3 product.version=PD1936_A_9.15.14 fingerprint.abbr=11/RP1A.200720.012 region_ver=W10 buildvariant=user androidboot.securebootkeyhash=2c0a52ffbd8db687b56f6a98d8840f46597a4dde6d9dc8d00039873ce6d74f60 androidboot.securebootkeyver=4
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01f00000
BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_PREBUILT_KERNEL := device/vivo/PD1936/prebuilt/kernel
TARGET_PREBUILT_DTB := device/vivo/PD1936/prebuilt/dtb.img

# Kernel modules (for early mount)
BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard device/vivo/PD1936/proprietary/lib/modules/*.ko)

# Filesystem
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition sizes (based on actual image sizes and common partitions)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_VENDORIMAGE_PARTITION_SIZE := 1350270976
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115448725504
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 1073741824
BOARD_ODMIMAGE_PARTITION_SIZE := 268435456
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 6442450944
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6438256640
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := 0
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := device/vivo/PD1936/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_RECOVERY_AS_BOOT := false
AB_OTA_UPDATER := true

# TWRP Configuration for TWRP 11
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 2048
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_SCREEN_BLANK := true
TW_NO_FLASH_CURRENT_TWRP := true
TW_HAS_EDL_MODE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_DEVICE_VERSION := V1936A_by_User
TW_SUPPORT_INPUT_AIDL_HAPTICS := true

# Display and touch configuration for vivo devices with notch
TW_TARGET_USES_QCOM_BSP := true
TW_QCOM_ATS_OFFSET := 1621580395
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.product;ro.build.fingerprint"
TW_IGNORE_NAV_BAR := true
TW_IGNORE_SYS_SELINUX := true

# TWRP 11 specific features
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_LOGICAL := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_MAINTAINER := "User"

# Hardware buttons and input (vivo PD1936 specific)
BOARD_HAS_NO_SELECT_BUTTON := true
TW_NO_HAPTICS := false
TW_FORCE_USE_BUSYBOX := true

# Backup and restore support
TW_BACKUP_EXCLUSIONS := "/data/nvram/* /data/system/users/0/fpdata/*"
TW_RECOVERY_ADDITIONAL_RELINK_FILES := \
    proprietary/lib/librecovery_updater_msm.so \
    proprietary/lib64/librecovery_updater_msm.so

# Storage and mount options
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_HAS_DOWNLOAD_MODE := true

# Battery and power
TW_CUSTOM_BATTERY_PATH := "/sys/class/power_supply/battery"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone1/temp"

# Screen timeout (in seconds)
TW_SCREEN_TIMEOUT_SECS := 120

# Debug and logging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_RECOVERY_DEVICE_MODULES := \
    librecovery_updater_msm

# Vendor security patch
VENDOR_SECURITY_PATCH := 2021-07-01

# Android version
PLATFORM_VERSION := 11
PLATFORM_VERSION_LAST_STABLE := 11