$(call inherit-product, device/lge/star-common/star.mk)

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/v909/v909-vendor.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/v909/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#DEVICE_PACKAGE_OVERLAYS += device/lge/p999/overlay

# Board-specific init
PRODUCT_COPY_FILES += \
    device/lge/v909/init.v909.rc:root/init.rc \
    #device/lge/v909/vold.fstab:system/etc/vold.fstab \
  #  device/lge/v909/gps.conf:system/etc/gps.conf \
    device/lge/v909/init.vsnet:system/bin/init.vsnet

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko

PRODUCT_NAME := lge_v909
PRODUCT_DEVICE := v909
PRODUCT_MODEL := LG-V909
