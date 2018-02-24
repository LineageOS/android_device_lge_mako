LOCAL_PATH := $(call my-dir)

# When zero we link against libmmcamera; when 1, we dlopen libmmcamera.
DLOPEN_LIBMMCAMERA := 1

include $(CLEAR_VARS)

LOCAL_CFLAGS := -DDLOPEN_LIBMMCAMERA=$(DLOPEN_LIBMMCAMERA)

ifeq ($(strip $(TARGET_USES_ION)), true)
    LOCAL_CFLAGS += -DUSE_ION
endif

ifeq ($(TARGET_USES_MEDIA_EXTENSIONS),true)
    LOCAL_CFLAGS += -DUSE_NATIVE_HANDLE_SOURCE
endif

LOCAL_CFLAGS += \
    -DCAMERA_ION_HEAP_ID=ION_IOMMU_HEAP_ID \
    -DCAMERA_ZSL_ION_HEAP_ID=ION_IOMMU_HEAP_ID \
    -DCAMERA_GRALLOC_HEAP_ID=GRALLOC_USAGE_PRIVATE_IOMMU_HEAP \
    -DCAMERA_GRALLOC_FALLBACK_HEAP_ID=GRALLOC_USAGE_PRIVATE_SYSTEM_HEAP \
    -DCAMERA_ION_FALLBACK_HEAP_ID=ION_IOMMU_HEAP_ID \
    -DCAMERA_ZSL_ION_FALLBACK_HEAP_ID=ION_IOMMU_HEAP_ID \
    -DCAMERA_GRALLOC_CACHING_ID=0 \
    -DNUM_PREVIEW_BUFFERS=4 \
    -DHW_ENCODE \
    -D_ANDROID_

# Uncomment below line to enable smooth zoom
#LOCAL_CFLAGS += -DCAMERA_SMOOTH_ZOOM

# Uncomment below line to close native handles on releaseRecordingFrame
LOCAL_CFLAGS += -DHAL_CLOSE_NATIVE_HANDLES

LOCAL_SRC_FILES := \
    QCameraHAL.cpp \
    QCameraHWI.cpp \
    QCameraHWI_Mem.cpp \
    QCameraHWI_Parm.cpp\
    QCameraHWI_Preview.cpp \
    QCameraHWI_Record.cpp \
    QCameraHWI_Still.cpp \
    QCameraParameters.cpp \
    QCameraStream.cpp \
    QualcommCamera2.cpp

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/mm-camera-interface \
    hardware/qcom/media/msm8960/mm-core/inc \
    hardware/qcom/display/msm8960/libgralloc \
    hardware/qcom/display/msm8960/libgenlock \
    hardware/qcom/media/msm8960/libstagefrighthw \
    frameworks/native/include/media/hardware

# Kernel headers
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include/media
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_SHARED_LIBRARIES := libutils libui libcamera_client libcamera_metadata liblog libcutils libbinder libnativewindow
LOCAL_SHARED_LIBRARIES += libgenlock libmmcamera_interface2
LOCAL_SHARED_LIBRARIES += android.hidl.token@1.0-utils android.hardware.graphics.bufferqueue@1.0

ifneq ($(DLOPEN_LIBMMCAMERA),1)
    LOCAL_SHARED_LIBRARIES += liboemcamera
else
    LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_CFLAGS += -Wall -Werror

LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.mako

include $(BUILD_SHARED_LIBRARY)

include $(LOCAL_PATH)/mm-camera-interface/Android.mk
