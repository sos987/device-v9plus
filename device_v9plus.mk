# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/v9plus/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

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
    gralloc.v9 \
    copybit.v9 \
    gps.v9 \
    lights.v9 \
    sensors.v9 \
    libOmxCore \
    libOmxVidEnc \
    FM \
    abtfilt \
    dexpreopt

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

$(call inherit-product-if-exists, vendor/zte/v9plus/v9plus-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/v9plus/overlay

# Board-specific init
PRODUCT_COPY_FILES += \
    device/zte/v9plus/recovery/sbin/diagftmtest:/root/sbin/diagftmtest\
    device/zte/v9plus/recovery/sbin/hci_qcomm_init:/root/sbin/hci_qcomm_init\
    device/zte/v9plus/recovery/sbin/iwmulticall:/root/sbin/iwmulticall\
    device/zte/v9plus/recovery/sbin/iwpriv:/root/sbin/iwpriv\
    device/zte/v9plus/recovery/sbin/ptt_socket_app:/root/sbin/ptt_socket_app\
    device/zte/v9plus/recovery/sbin/rmt_storage_recovery:/root/sbin/rmt_storage_recovery\
    device/zte/v9plus/recovery/sbin/usbconfig:/root/sbin/usbconfig\
    device/zte/v9plus/recovery/etc/usb.conf:root/usb.conf


# LDPI assets
PRODUCT_LOCALES += ldpi mdpi
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	ro.sf.hwrotation=180


# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# This should not be needed, but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

# Google ClientBase
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-zte\
    ro.com.google.clientidbase.yt=android-zte\
    ro.com.google.clientidbase.am=android-zte\
    ro.com.google.clientidbase.ms=android-zte\
    ro.com.google.clientidbase.gmm=android-zte


DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/v9plus/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/v9plus/v9plus_keypad.kl:system/usr/keylayout/v9plus_keypad.kl

# fstab
PRODUCT_COPY_FILES += \
    device/zte/v9plus/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/v9plus/init.v9plus.rc:root/init.v9plus.rc \
    device/zte/v9plus/ueventd.v9plus.rc:root/ueventd.v9plus.rc

# Audio
PRODUCT_COPY_FILES += \
    device/zte/v9plus/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/v9plus/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/v9plus/init.qcom.sh:/root/init.qcom.sh \
    device/zte/v9plus/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/zte/v9plus/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/zte/v9plus/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/zte/v9plus/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/zte/v9plus/init.btprop.sh:system/bin/init.btprop.sh \
    device/zte/v9plus/bt_testmode.sh:system/bin/bt_testmode.sh \
    device/zte/v9plus/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/v9plus/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/v9plus/prebuilt/hostapd:system/bin/hostapd \
    device/zte/v9plus/prebuilt/hostapd.conf:system/hostapd/hostapd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/v9plus/prebuilt/libra.ko:system/lib/modules/libra.ko \
    device/zte/v9plus/prebuilt/libra_ftm.ko:system/lib/modules/libra_ftm.ko \
    device/zte/v9plus/prebuilt/librasdioif.ko:system/lib/modules/librasdioif.ko

#Firmware copy from device
PRODUCT_COPY_FILES += \
    device/zte/v9plus/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/zte/v9plus/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/zte/v9plus/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/zte/v9plus/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/zte/v9plus/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/zte/v9plus/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    device/zte/v9plus/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
    device/zte/v9plus/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    device/zte/v9plus/firmware/wlan/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wapi_fw.bin \
    device/zte/v9plus/firmware/wlan/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wlan_nv.bin

#Media profile
PRODUCT_COPY_FILES += \
    device/zte/v9plus/media_profiles.xml:system/etc/media_profiles.xml

# V9 uses medium-density artwork where available
PRODUCT_LOCALES += mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


PRODUCT_NAME := full_v9plus
PRODUCT_BRAND := zte
PRODUCT_DEVICE := v9plus
PRODUCT_MODEL := MegaFon V9+
PRODUCT_MANUFACTURER := zte
