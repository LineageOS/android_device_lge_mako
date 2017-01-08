# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=speed \
    dalvik.vm.dex2oat-swap=false

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.handset.mic.type=digital \
    persist.audio.dualmic.config=endfire \
    persist.audio.fluence.voicecall=true \
    persist.audio.handset.mic=dmic \
    persist.audio.fluence.mode=endfire \
    persist.audio.lowlatency.rec=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd \
    qcom.bluetooth.soc=smd

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    persist.camera.cpp.duplication=false

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.recordable.rgba8888=1 \
    persist.hwc.mdpcomp.enable=true \
    ro.opengles.version=196608 \
    ro.sf.lcd_density=320

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    media.aac_51_output_enabled=true

# Radio
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so

# Do not power down SIM card when modem is sent to low power mode
# RIL sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.telephony.call_ring.multiple=0 \
    telephony.lteOnCdmaDevice=0

# Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sensors.wl_dis=true \
    ro.qualcomm.sensors.smd=true

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
