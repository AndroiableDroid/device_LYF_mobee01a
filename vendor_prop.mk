# ACDB
PRODUCT_PROPERTY_OVERRIDES += \
persist.audio.calfile0=/vendor/etc/acdbdata/QRD/QRD_Bluetooth_cal.acdb \
persist.audio.calfile1=/vendor/etc/acdbdata/QRD/QRD_General_cal.acdb \
persist.audio.calfile2=/vendor/etc/acdbdata/QRD/QRD_Global_cal.acdb \
persist.audio.calfile3=/vendor/etc/acdbdata/QRD/QRD_Handset_cal.acdb \
persist.audio.calfile4=/vendor/etc/acdbdata/QRD/QRD_Hdmi_cal.acdb \
persist.audio.calfile5=/vendor/etc/acdbdata/QRD/QRD_Headset_cal.acdb \
persist.audio.calfile6=/vendor/etc/acdbdata/QRD/QRD_Speaker_cal.acdb

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.audio.sdk.fluencetype=fluence \
persist.vendor.audio.fluence.voicecall=true \
persist.vendor.audio.fluence.voicerec=false \
persist.vendor.audio.fluence.speaker=false

# Display
PRODUCT_PROPERTY_OVERRIDES += \
ro.sf.lcd_density=300

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
persist.camera.cpp.duplication=false \
persist.camera.hal.debug.mask=0

# VNDK
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vndk.version=28
