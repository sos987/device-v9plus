ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/v9plus/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

$(call inherit-product-if-exists, vendor/zte/v9plus/v9plus-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/v9plus/overlay

PRODUCT_COPY_FILES += \
    device/zte/v9plus/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/v9plus/v9plus_keypad.kl:system/usr/keylayout/v9plus_keypad.kl


PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    gralloc.v9plus \
    copybit.v9plus \
    gps.v9plus \
    lights.v9plus \
    sensors.v9plus \
    libOmxCore \
    libOmxVidEnc \
    abtfilt \
    dexpreopt

# Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/zte/v9plus/boot/sbin/diagftmtest:/root/sbin/diagftmtest\
    device/zte/v9plus/boot/sbin/hci_qcomm_init:/root/sbin/hci_qcomm_init\
    device/zte/v9plus/boot/sbin/iwmulticall:/root/sbin/iwmulticall\
    device/zte/v9plus/boot/sbin/iwpriv:/root/sbin/iwpriv\
    device/zte/v9plus/boot/sbin/ptt_socket_app:/root/sbin/ptt_socket_app\
    device/zte/v9plus/boot/sbin/rmt_storage_recovery:/root/sbin/rmt_storage_recovery\
    device/zte/v9plus/boot/sbin/usbconfig:/root/sbin/usbconfig\
    device/zte/v9plus/boot/sbin/init:/root/sbin/init\
    device/zte/v9plus/boot/ueventd.v9plus.rc:root/ueventd.rc\
    device/zte/v9plus/boot/init.goldfish.rc:root/init.goldfish.rc\
    device/zte/v9plus/boot/init.qcom.rc:root/init.qcom.rc\
    device/zte/v9plus/boot/init.qcom.sh:root/init.qcom.sh\
    device/zte/v9plus/boot/init.v9plus.rc:root/init.v9plus.rc\
    device/zte/v9plus/boot/init.rc:root/init.rc\
    device/zte/v9plus/recovery/etc/usb.conf:root/usb.conf

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# fstab
PRODUCT_COPY_FILES += \
    device/zte/v9plus/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES+= \
    device/zte/v9plus/prebuilt/lib/libaudio.so:system/lib/libaudio.so \
    device/zte/v9plus/prebuilt/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so \
    device/zte/v9plus/prebuilt/lib/libaudio.so:obj/lib/libaudio.so \
    device/zte/v9plus/prebuilt/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/zte/v9plus/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/v9plus/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/v9plus/prebuilt/bin/hostapd:system/bin/hostapd \
    device/zte/v9plus/prebuilt/lib/libwpa_client.so:system/lib/libwpa_client.so \
    device/zte/v9plus/prebuilt/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    device/zte/v9plus/prebuilt/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    device/zte/v9plus/prebuilt/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    device/zte/v9plus/prebuilt/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
    device/zte/v9plus/prebuilt/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf 

# Camera
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/lib/libcamera.so:system/lib/libcamera.so \
    device/zte/v9plus/prebuilt/lib/libcamera_client.so:system/lib/libcamera_client.so \
    device/zte/v9plus/prebuilt/lib/libcameraservice.so:system/lib/libcameraservice.so \
    device/zte/v9plus/prebuilt/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/zte/v9plus/prebuilt/lib/libmmipl.so:system/lib/libmmipl.so \
    device/zte/v9plus/prebuilt/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/zte/v9plus/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
    device/zte/v9plus/prebuilt/lib/libcamera_client.so:obj/lib/libcamera_client.so \
    device/zte/v9plus/prebuilt/lib/libcameraservice.so:obj/lib/libcameraservice.so \
    device/zte/v9plus/prebuilt/lib/liboemcamera.so:obj/lib/liboemcamera.so

# RIL
PRODUCT_COPY_FILES+= \
    device/zte/v9plus/prebuilt/lib/libril.so:system/lib/libril.so \
    device/zte/v9plus/prebuilt/lib/libril.so:obj/lib/libril.so

# 3D
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
    device/zte/v9plus/prebuilt/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    device/zte/v9plus/prebuilt/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    device/zte/v9plus/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/zte/v9plus/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/zte/v9plus/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/zte/v9plus/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/zte/v9plus/prebuilt/lib/libgsl.so:system/lib/libgsl.so

# OMX libraries
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
    device/zte/v9plus/prebuilt/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/zte/v9plus/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/zte/v9plus/prebuilt/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
    device/zte/v9plus/prebuilt/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/zte/v9plus/prebuilt/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/zte/v9plus/prebuilt/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/zte/v9plus/prebuilt/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/zte/v9plus/prebuilt/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    device/zte/v9plus/prebuilt/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    device/zte/v9plus/prebuilt/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    device/zte/v9plus/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/zte/v9plus/prebuilt/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/zte/v9plus/prebuilt/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/zte/v9plus/prebuilt/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    device/zte/v9plus/prebuilt/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/zte/v9plus/prebuilt/lib/libOmxQcelpHwDec.so:system/lib/libOmxQcelpHwDec.so \
    device/zte/v9plus/prebuilt/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    device/zte/v9plus/prebuilt/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so

# Fix Logcat / Misc
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/lib/liblog.so:system/lib/liblog.so \
    device/zte/v9plus/prebuilt/bin/logcat:system/bin/logcat \
    device/zte/v9plus/prebuilt/bin/logwrapper:system/bin/logwrapper \
    device/zte/v9plus/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    device/zte/v9plus/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/zte/v9plus/prebuilt/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    device/zte/v9plus/prebuilt/etc/hosts:system/etc/hosts \
    device/zte/v9plus/prebuilt/etc/gps.conf:system/etc/gps.conf

# Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/lib/modules/libra.ko:system/lib/modules/libra.ko \
    device/zte/v9plus/prebuilt/lib/modules/libra_ftm.ko:system/lib/modules/libra_ftm.ko \
    device/zte/v9plus/prebuilt/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko

# WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/v9plus/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    device/zte/v9plus/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
    device/zte/v9plus/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    device/zte/v9plus/firmware/wlan/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wapi_fw.bin \
    device/zte/v9plus/firmware/wlan/qcom_wlan_nv.bin:system/etc/firmware/wlan/qcom_wlan_nv.bin

# Other firmware files
PRODUCT_COPY_FILES +=\
    device/zte/v9plus/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/zte/v9plus/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/zte/v9plus/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/zte/v9plus/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# 3G PPP
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/etc/ppp/ip-up-vpn:system/etc/ppp/ip-up-vpn 


# LDPI assets
PRODUCT_LOCALES += ldpi mdpi
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	ro.sf.hwrotation=180


# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# XXX: We might enable precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed, but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

# v9plus uses medium-density artwork where available
PRODUCT_LOCALES += mdpi

# Google ClientBase
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-zte\
    ro.com.google.clientidbase.yt=android-zte\
    ro.com.google.clientidbase.am=android-zte\
    ro.com.google.clientidbase.ms=android-zte\
    ro.com.google.clientidbase.gmm=android-zte


PRODUCT_NAME := full_v9plus
PRODUCT_BRAND := zte
PRODUCT_DEVICE := v9plus
PRODUCT_MODEL := MegaFon V9+
PRODUCT_MANUFACTURER := zte
