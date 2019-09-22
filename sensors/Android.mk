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

# import st480 algorithm library
include $(CLEAR_VARS)
LOCAL_MULTILIB := 64
LOCAL_PREBUILT_LIBS := algo/common/st480_compass/libst480.a
include $(BUILD_MULTI_PREBUILT)

# HAL module implemenation stored in
include $(CLEAR_VARS)

LOCAL_MODULE := sensors.native
LOCAL_MODULE_RELATIVE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_RELATIVE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -DLOG_TAG=\"Sensors\"
ifeq ($(call is-board-platform,msm8960),true)
  LOCAL_CFLAGS += -DTARGET_8930
endif

LOCAL_C_INCLUDES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_SRC_FILES :=		\
	sensors.cpp 		\
	SensorBase.cpp		\
	LightSensor.cpp		\
	ProximitySensor.cpp	\
	CompassSensor.cpp	\
	Accelerometer.cpp	\
	Gyroscope.cpp		\
	Bmp180.cpp		\
	InputEventReader.cpp	\
	CalibrationManager.cpp 	\
	NativeSensorManager.cpp \
	VirtualSensor.cpp	\
	sensors_XML.cpp

LOCAL_C_INCLUDES += external/libxml2/include	\

ifeq ($(call is-platform-sdk-version-at-least,20),true)
    LOCAL_C_INCLUDES += external/icu/icu4c/source/common
else
    LOCAL_C_INCLUDES += external/icu4c/common
endif

LOCAL_SHARED_LIBRARIES := liblog libcutils libdl libxml2 libutils

include $(BUILD_SHARED_LIBRARY)

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

LOCAL_MODULE := libcalmodule_common
LOCAL_SRC_FILES := \
		   algo/common/common_wrapper.c \
		   algo/common/compass/AKFS_AOC.c \
		   algo/common/compass/AKFS_Device.c \
		   algo/common/compass/AKFS_Direction.c \
		   algo/common/compass/AKFS_VNorm.c

LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MULTILIB := 64
LOCAL_STATIC_LIBRARIES := libst480
LOCAL_CFLAGS += -Dst480_compass
ifeq ($(TARGET_DEVICE),spirit_msm8916_64)
LOCAL_LDFLAGS += $(LOCAL_PATH)/algo/common/st480_compass/spirit_compass/libst480.a
else ifeq ($(TARGET_DEVICE),mirageplus01a_msm8916_64)
LOCAL_LDFLAGS += $(LOCAL_PATH)/algo/common/st480_compass/miragepluse_compass/libst480.a
else
LOCAL_LDFLAGS += $(LOCAL_PATH)/algo/common/st480_compass/libst480.a
endif
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true

ifdef TARGET_2ND_ARCH
LOCAL_MODULE_RELATIVE_PATH_32 := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_RELATIVE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
else
LOCAL_MODULE_RELATIVE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
endif

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := calmodule.cfg
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_SRC_FILES := calmodule.cfg

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := hals.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := hals.conf
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/sensors
include $(BUILD_PREBUILT)

include $(call all-makefiles-under, $(LOCAL_PATH))
