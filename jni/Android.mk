# Copyright (C) 2011 The Android Open Source Project
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

LOCAL_CFLAGS += -DWEBRTC_ANDROID -DWEBRTC_CLOCK_TYPE_REALTIME

LOCAL_CPP_EXTENSION := .cc

LOCAL_MODULE    := netrtc-jni
LOCAL_SRC_FILES := \
    cpu_features_android.c \
    sort.cc \
    clock.cc \
    aligned_malloc.cc \
    atomic32_posix.cc \
    condition_variable.cc \
    cpu_features.cc \
    cpu_info.cc \
    critical_section.cc \
    event.cc \
    event_tracer.cc \
    file_impl.cc \
    rw_lock.cc \
    thread.cc \
    trace_impl.cc \
    condition_variable_posix.cc \
    critical_section_posix.cc \
    event_posix.cc \
    rtp_to_ntp.cc \
    sleep.cc \
    thread_posix.cc \
    tick_util.cc \
    timestamp_extrapolator.cc \
    trace_posix.cc \
    rw_lock_posix.cc \
    channel_transport/udp_socket_manager_posix.cc \
    channel_transport/udp_socket_manager_wrapper.cc \
    channel_transport/udp_socket_posix.cc \
    channel_transport/udp_socket_wrapper.cc \
    channel_transport/udp_transport_impl.cc

#channel_transport/channel_transport.cc \

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../../.. \
    $(LOCAL_PATH)/base \
    $(LOCAL_PATH)/common \
    $(LOCAL_PATH)/interface \
    $(LOCAL_PATH)/spreadsortlib \
    $(LOCAL_PATH)/channel_transport \
    system/core/include/cutils

LOCAL_SHARED_LIBRARIES := \
    libstlport

LOCAL_STATIC_LIBRARIES := cpufeatures

APP_CPPFLAGS := -frtti -std=c++11

# for native multimedia
LOCAL_LDLIBS    += -lOpenMAXAL
# for logging
LOCAL_LDLIBS    += -llog
# for native windows
LOCAL_LDLIBS    += -landroid

LOCAL_CFLAGS    += -UNDEBUG


include $(BUILD_SHARED_LIBRARY)
$(call import-module,android/cpufeatures)
