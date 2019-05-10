# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, device/LYF/mobee01a/full_mobee01a.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/dot/config/common.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8939

PRODUCT_NAME := dot_mobee01a
BOARD_VENDOR := LYF
PRODUCT_DEVICE := mobee01a

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2019-03-01

TARGET_BOOT_ANIMATION_RES := 720

PRODUCT_GMS_CLIENTID_BASE := android-ckt

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="mobee01a_msm8916_64-user 6.0.1 MMB29M 913 release-keys" \
    PRODUCT_NAME=LS-5015 \
    TARGET_DEVICE=LS-5015

BUILD_FINGERPRINT := LYF/LS-5015/LS-5015:6.0.1/MMB29M/434:user/release-keys
