#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/vivo/PD1936

# Prebuilt touchscreen library
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/hw/bbktouchscreen.default.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib/hw/bbktouchscreen.default.so \
    $(LOCAL_PATH)/prebuilt/lib64/hw/bbktouchscreen.default.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/hw/bbktouchscreen.default.so

# Touchscreen settings - minimal configuration for TWRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.touchscreen.size.category=normal \
    ro.input.maxpoints=10 \
    ro.input.touchscreen.device_path=/dev/input/event0 \
    ro.hardware.touch=bbk \
    ro.vendor.hardware.touch=bbk \
    persist.vendor.touch.multitouch=1 \
    persist.vendor.touch.panel_type=bbk \
    persist.vendor.touch.panel_vendor=bbk \
    persist.vendor.touch.panel_model=bbk

# Input device configuration
PRODUCT_PACKAGES += \
    recovery.fstab \
    init.recovery.qcom.rc

# Enable USB OTG
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# System properties for hardware support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.display=qcom \
    ro.hardware.vibrator=qcom \
    ro.hardware.audio=qcom \
    ro.hardware.camera=qcom \
    ro.hardware.nfc=false \
    ro.hardware.sensors=qcom \
    ro.hardware.thermal=qcom \
    ro.hardware.wifi=qcom \
    ro.hardware.bluetooth=qcom \
    ro.hardware.charger=qcom \
    ro.hardware.usb=qcom \
    \
    # Device compatibility information
    ro.product.brand=vivo \
    ro.product.model=PD1936 \
    ro.product.device=PD1936 \
    ro.product.name=PD1936 \
    ro.product.board=msmnile \
    ro.product.manufacturer=vivo \
    ro.product.locale=en-US \
    ro.product.version=1.0 \
    \
    # Vendor product information
    ro.vendor.product.model=PD1936 \
    ro.vendor.product.brand=vivo \
    ro.vendor.product.device=PD1936 \
    ro.vendor.product.name=PD1936 \
    ro.vendor.product.board=msmnile \
    ro.vendor.product.manufacturer=vivo \
    \
    # Android 11 compatibility
    ro.vendor.dm.verity_ver=1.4 \
    ro.vendor.build.security_patch=2021-08-01 \
    ro.build.version.release=11 \
    ro.build.version.security_patch=2021-08-01 \
    ro.build.version.sdk=30 \
    ro.build.version.preview_sdk=0 \
    ro.build.version.codename=REL \
    ro.build.version.all_codenames=REL \
    ro.build.version.base_os= \
    ro.build.version.min_supported_target_sdk=28 \
    \
    # Android 11 security and features
    ro.vendor.product.first_api_level=30 \
    ro.control_privapp_permissions=enforce \
    ro.vendor.dm.service.slot=1 \
    ro.vendor.hardware.keystore_desede=true \
    ro.vendor.hardware.keystore_lite=true \
    ro.vendor.hardware.keystore_migration=true \
    ro.vendor.hardware.keystore_selinux=true \
    ro.vendor.hardware.keystore_state=true \
    ro.vendor.hardware.keystore_vendor=true \
    \
    # SELinux
    ro.build.selinux=1 \
    ro.adb.secure=1 \
    ro.secure=1 \
    \
    # Battery configuration
    ro.hardware.charger=qcom \
    ro.vendor.hardware.charger=qcom \
    ro.battery.capacity=4500 \
    ro.sys.fw.use_trim_settings=true \
    ro.sys.fw.trim_after_boot=1000 \
    ro.sys.fw.trim_interval=43200000 \
    ro.sys.fw.trim_empty_percent=100 \
    ro.sys.fw.trim_cache_percent=100 \
    ro.sys.fw.trim_cache_empty_percent=100 \
    ro.sys.fw.trim_settings=5 \
    persist.vendor.battery.report_all_batt=false
