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

# AndroidBoard.mk for vivo PD1936 (msmnile platform)
# This file is included by the build system to set up board-specific modules.

# Include the prebuilt kernel and DTB
LOCAL_PATH := device/vivo/PD1936

# Kernel and DTB targets
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(LOCAL_PATH)/prebuilt/dtb.img

# Kernel modules for early mount support
BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard $(LOCAL_PATH)/proprietary/lib/modules/*.ko)

# Board-specific recovery modules
BOARD_RECOVERY_MODULES := \
    librecovery_updater_msm

# Recovery init scripts
BOARD_RECOVERY_INITRC := \
    $(LOCAL_PATH)/recovery/root/init.recovery.rc \
    $(LOCAL_PATH)/proprietary/root/vendor/ueventd.rc

# Ensure the prebuilt kernel and DTB are copied
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel

$(PRODUCT_OUT)/dtb.img: $(TARGET_PREBUILT_DTB)
	cp $(TARGET_PREBUILT_DTB) $(PRODUCT_OUT)/dtb.img

.PHONY: kernel dtb
kernel: $(PRODUCT_OUT)/kernel
dtb: $(PRODUCT_OUT)/dtb.img