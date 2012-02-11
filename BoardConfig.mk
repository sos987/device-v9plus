LOCAL_PATH:= $(call my-dir)

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false


# inherit from the proprietary version
-include device/zte/v9plus/BoardConfigVendor.mk


TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# OpenGL Driver Config
BOARD_EGL_CFG := device/zte/v9plus/egl.cfg

BOARD_HAVE_BLUETOOTH := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4708

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

WITH_JIT := true
ENABLE_JSC_JIT := true

TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

JS_ENGINE := v8

# GPS Related Defines
BOARD_GPS_LIBRARIES := libloc
BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

# Kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/v9plus/kernel
TARGET_PREBUILT_KERNEL := device/zte/v9plus/kernel
BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_CMDLINE := console=ttyMSM1,115200
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
#BOARD_PAGE_SIZE := 0x00001000

TARGET_PROVIDES_LIBRIL := true
TARGET_PROVIDES_LIBAUDIO := true

# Recovery
TARGET_BOOTLOADER_BOARD_NAME := v9plus
TARGET_OTA_ASSERT_DEVICE := v9plus
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_LDPI_RECOVERY := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2908749824
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_RECOVERY_INITRC := device/zte/v9plus/recovery.rc
BOARD_CUSTOM_GRAPHICS := ../../../device/zte/v9plus/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/zte/v9plus/recovery/recovery_ui.c
TARGET_RECOVERY_PRE_COMMAND := "echo 3 > /proc/sys/vm/drop_caches; sync"

## PARTITION LAYOUT/INFO ##
BOARD_HAS_NO_MISC_PARTITION := false
BOARD_BOOT_DEVICE := /dev/block/mmcblk0p12
BOARD_RECOVERY_DEVICE := /dev/block/mmcblk0p13
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p15
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p17
BOARD_CACHE_FILESYSTEM := ext4
BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
BOARD_DATA_FILESYSTEM := ext4
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_HAS_NO_SELECT_BUTTON := true

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun"
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
