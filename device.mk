#
# Copyright (C) 2011 The Android Open-Source Project
# Copyright (C) 2017 The LineageOS Project
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

# Overlay
DEVICE_PACKAGE_OVERLAYS := device/lge/mako/overlay

# Features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_CHARACTERISTICS := nosdcard

# System properties
-include device/lge/mako/system_prop.mk

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    libqcomvoiceprocessing

PRODUCT_COPY_FILES += \
    device/lge/mako/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/lge/mako/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/lge/mako/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Bluetooth
PRODUCT_PACKAGES += \
    bdAddrLoader \
    hci_qcomm_init

# Camera
PRODUCT_PACKAGES += \
    camera.mako \
    camera.msm8960 \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libmmcamera_interface2 \
    libmmcamera_interface \
    libmm-omxcore \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    Snap

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Display
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    liboverlay \
    memtrack.msm8960

# Gello
PRODUCT_PACKAGES += \
    Gello

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8960

# Lights
PRODUCT_PACKAGES += \
    lights.mako

# Location
PRODUCT_PACKAGES += \
    flp.msm8960 \
    gps.msm8960 \
    libgeofence \
    libgps.utils \
    libizat_core \
    libloc_adapter \
    libloc_api_v02 \
    libloc_core \
    libloc_ds_api \
    libloc_eng

PRODUCT_COPY_FILES += \
    device/lge/mako/configs/gps.conf:system/etc/gps.conf

# Media
PRODUCT_COPY_FILES += \
    device/lge/mako/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/lge/mako/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    device/lge/mako/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# NFC
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.default \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    device/lge/mako/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# Power
PRODUCT_PACKAGES += \
    power.mako \
    power.msm8960

# Ramdisk/Init
PRODUCT_COPY_FILES += \
    device/lge/mako/rootdir/etc/fstab.mako:root/fstab.mako \
    device/lge/mako/rootdir/etc/init.mako.rc:root/init.mako.rc \
    device/lge/mako/rootdir/etc/init.mako.bt.sh:system/bin/init.mako.bt.sh \
    device/lge/mako/rootdir/etc/init.mako.usb.rc:root/init.mako.usb.rc \
    device/lge/mako/rootdir/etc/init.mako.wifi.sh:system/bin/init.mako.wifi.sh \
    device/lge/mako/rootdir/etc/ueventd.mako.rc:root/ueventd.mako.rc

# Thermal
PRODUCT_COPY_FILES += \
    device/lge/mako/configs/thermald-mako.conf:system/etc/thermald.conf

# WiFi/WCNSS
PRODUCT_PACKAGES += \
    conn_init \
    hostapd \
    hostapd_default.conf \
    libwfcu \
    libwpa_client \
    p2p_supplicant_overlay.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    wpa_supplicant_overlay.conf \

PRODUCT_COPY_FILES += \
    device/lge/mako/wcnss/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    device/lge/mako/wcnss/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/lge/mako/wcnss/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

# Keylayout
PRODUCT_COPY_FILES += \
    device/lge/mako/keylayout/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
    device/lge/mako/keylayout/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    device/lge/mako/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    device/lge/mako/keylayout/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
    device/lge/mako/keylayout/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
    device/lge/mako/keylayout/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
    device/lge/mako/keylayout/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
    device/lge/mako/keylayout/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/lge/mako/idc/touch_dev.idc:system/usr/idc/touch_dev.idc

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
