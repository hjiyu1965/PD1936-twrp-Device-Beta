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

# Touchscreen settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.touchscreen.size.category=normal \
    ro.input.maxpoints=10 \
    persist.vendor.touch.enable_1touch=1 \
    persist.vendor.touch.idle_timeout_ms=60000

# Input device configuration
PRODUCT_PACKAGES += \
    recovery.fstab \
    init.recovery.qcom.rc

# Enable USB OTG
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# System properties for hardware support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.touch=bbk \
    ro.vendor.hardware.touch=bbk
