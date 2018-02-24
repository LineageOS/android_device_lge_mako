LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    mm_camera_interface2.c \
    mm_camera_stream.c \
    mm_camera_channel.c \
    mm_camera.c \
    mm_camera_poll_thread.c \
    mm_camera_notify.c \
    mm_camera_sock.c \
    mm_camera_helper.c \
    mm_omx_jpeg_encoder.c

LOCAL_CFLAGS += -D_ANDROID_
LOCAL_COPY_HEADERS_TO := mm-camera-interface
LOCAL_COPY_HEADERS += \
    mm_camera_interface2.h \
    mm_omx_jpeg_encoder.h

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/.. \
    $(LOCAL_PATH)/../inc \
    hardware/qcom/media/msm8960/mm-core/inc

# Kernel headers
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include/media
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_CFLAGS += -Wall -Werror

LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE := libmmcamera_interface2
LOCAL_SHARED_LIBRARIES := libdl libcutils liblog

include $(BUILD_SHARED_LIBRARY)
