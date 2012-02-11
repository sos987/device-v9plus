LOCAL_PATH := device/zte/v9plus/

include $(CLEAR_VARS)

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

# include the non-open-source counterpart to this file
# -include vendor/zte/v9plus/AndroidBoardVendor.mk

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)
