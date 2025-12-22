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

# Device path
LOCAL_PATH := device/vivo/PD1936

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 28

# VNDK version
PRODUCT_TARGET_VNDK_VERSION := 30

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
AB_OTA_UPDATER := true

# A/B partitions
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    product \
    odm \
    vbmeta \
    vbmeta_system

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-service \
    android.hardware.boot@1.1-impl \
    bootctrl.$(TARGET_BOARD_PLATFORM) \
    bootctrl.$(TARGET_BOARD_PLATFORM).recovery

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl

# TWRP specific packages for TWRP 11
PRODUCT_PACKAGES += \
    twrpdec \
    twrpapp \
    strace \
    pigz \
    libbootloader_message \
    librecovery_updater_msm

# Copy prebuilt recovery kernel and DTB
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel:kernel \
    $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

# Copy proprietary vendor binaries and libraries for TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/bin/install-recovery.sh:recovery/root/system/bin/install-recovery.sh \
    $(LOCAL_PATH)/proprietary/lib/librecovery_updater_msm.so:recovery/root/system/lib/librecovery_updater_msm.so \
    $(LOCAL_PATH)/proprietary/lib64/librecovery_updater_msm.so:recovery/root/system/lib64/librecovery_updater_msm.so \
    $(LOCAL_PATH)/proprietary/etc/init/vendor_flash_recovery.rc:recovery/root/vendor/etc/init/vendor_flash_recovery.rc \
    $(LOCAL_PATH)/proprietary/root/vendor/ueventd.rc:recovery/root/vendor/ueventd.rc

# Copy essential kernel modules for early mount and audio support
PRODUCT_COPY_FILES += \
    $(wildcard $(LOCAL_PATH)/proprietary/lib/modules/audio_platform.ko):recovery/root/system/lib/modules/audio_platform.ko \
    $(wildcard $(LOCAL_PATH)/proprietary/lib/modules/audio_q6.ko):recovery/root/system/lib/modules/audio_q6.ko \
    $(wildcard $(LOCAL_PATH)/proprietary/lib/modules/audio_machine_msmnile.ko):recovery/root/system/lib/modules/audio_machine_msmnile.ko

# Additional TWRP utilities
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe \
    grep \
    gzip \
    mkfs.f2fs \
    mkfs.ext4 \
    e2fsck \
    resize2fs

# Device-specific properties for TWRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=msm \
    ro.hardware.gatekeeper=msm \
    ro.vendor.build.security_patch=2021-07-01 \
    ro.vendor.build.fingerprint=vivo/PD1936/PD1936:11/RP1A.200720.012/compiler0714182446:user/release-keys \
    ro.build.product=PD1936 \
    ro.build.oemfingerprint=vivo/PD1936/PD1936:11/RP1A.200720.012/compiler0714182446:user/release-keys

# Recovery specific properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.recovery.vendor=true \
    ro.recovery.fstab.prefix=/dev/block/bootdevice/by-name \
    ro.twrp.boot=1 \
    ro.twrp.version=11.0 \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1 \
    ro.allow.mock.location=0
# TWRP specific build properties
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=PD1936 \
    PRODUCT_NAME=twrp_PD1936 \
    TARGET_BUILD_VARIANT=eng \
    BUILD_ID=RP1A.200720.012