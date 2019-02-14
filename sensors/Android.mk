#
# Copyright (C) 2013 The Android Open-Source Project
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
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := sensors.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_VENDOR_MODULE := true

LOCAL_CFLAGS := -DLOG_TAG=\"MultiHal\"

LOCAL_SRC_FILES := \
    multihal.cpp \
    SensorEventQueue.cpp \

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libdl \
    liblog \
    libutils \

LOCAL_STRIP_MODULE := false

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE := android.hardware.sensors@1.0-service.mobee01a
LOCAL_INIT_RC := android.hardware.sensors@1.0-service.mobee01a.rc
LOCAL_SRC_FILES := \
        service.cpp \

LOCAL_SHARED_LIBRARIES := \
        liblog \
        libcutils \
        libdl \
        libbase \
        libutils \

LOCAL_SHARED_LIBRARIES += \
        libhidlbase \
        libhidltransport \
        android.hardware.sensors@1.0 \

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE       := hals.conf
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := hals.conf
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/sensors
include $(BUILD_PREBUILT)

include $(call all-makefiles-under, $(LOCAL_PATH))
