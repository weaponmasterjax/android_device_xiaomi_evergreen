#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Allow building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

DEVICE_PATH := device/xiaomi/evergo
PREBUILT_PATH := $(DEVICE_PATH)/prebuilt

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := evergo
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6833

# Assert
TARGET_OTA_ASSERT_DEVICE := evergreen,evergo,opal,everpal

# Kernel
BOARD_KERNEL_CMDLINE := \
	bootopt=64S3,32N2,64N2

BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_DTB_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_PREBUILT_KERNEL := $(PREBUILT_PATH)/Image.gz
TARGET_PREBUILT_DTB := $(PREBUILT_PATH)/dtb.img

BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_BOOT_HEADER_VERSION := 2

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Partitions configs
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
BOARD_USES_METADATA_PARTITION := true

# Partitions size
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := main

BOARD_MAIN_PARTITION_LIST := system vendor product
BOARD_MAIN_SIZE := 9126805504

# File systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_F2FS := true

# AB
AB_OTA_UPDATER := true

# Workaround for copying error vendor files to recovery ramdisk
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Resolution
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Tools
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true
TW_INCLUDE_REPACKTOOLS := true

# Haptic
TW_SUPPORT_INPUT_AIDL_HAPTICS :=true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION := evgop
TW_LOAD_VENDOR_MODULES := "haptic.ko"
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_PYTHON := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXCLUDE_APEX := true
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_FRAMERATE := 90

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Device config
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_FASTBOOT_BOOT := true
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.build.flavor;ro.build.tags;ro.build.type;ro.build.user;ro.build.version.incremental=ro.system.build.version.incremental;ro.build.version.release=ro.system.build.version.release;ro.build.version.release_or_codename=ro.system.build.version.release;ro.bootimage.build.tags;ro.bootimage.build.type;ro.bootimage.build.fingerprint=ro.system.build.fingerprint;ro.bootimage.build.version.incremental=ro.system.build.version.incremental;ro.bootimage.build.version.release=ro.system.build.version.release;ro.bootimage.build.version.release_or_codename=ro.system.build.version.release;ro.product.build.fingerprint=ro.system.build.fingerprint;ro.product.build.version.incremental=ro.system.build.version.incremental;ro.product.build.version.release=ro.system.build.version.release;ro.product.build.version.release_or_codename=ro.system.build.version.release;ro.build.description=ro.system.build.fingerprint;ro.build.display.id=ro.system.build.fingerprint;ro.build.fingerprint=ro.system.build.fingerprint;ro.odm.build.tags;ro.odm.build.type;ro.odm.build.fingerprint=ro.system.build.fingerprint;ro.odm.build.version.incremental=ro.system.build.version.incremental;ro.odm.build.version.release=ro.system.build.version.release;ro.odm.build.version.release_or_codename=ro.system.build.version.release;ro.system.build.tags;ro.system.build.type;ro.system.build.fingerprint=ro.system.build.fingerprint;ro.system.build.version.incremental=ro.system.build.version.incremental;ro.system.build.version.release=ro.system.build.version.release;ro.system.build.version.release_or_codename=ro.system.build.version.release;ro.system_ext.build.tags;ro.system_ext.build.type;ro.system_ext.build.fingerprint=ro.system.build.fingerprint;ro.system_ext.build.version.incremental=ro.system.build.version.incremental;ro.system_ext.build.version.release=ro.system.build.version.release;ro.system_ext.build.version.release_or_codename=ro.system.build.version.release;ro.vendor.build.tags;ro.vendor.build.type;ro.vendor.build.fingerprint=ro.system.build.fingerprint;ro.vendor.build.version.incremental=ro.system.build.version.incremental;ro.vendor.build.version.release=ro.system.build.version.release;ro.vendor.build.version.release_or_codename=ro.system.build.version.release"

ifneq ($(OF_HIDE_NOTCH),1)
    # Configure Status bar icons for regular TWRP builds only
    TW_CUSTOM_CLOCK_POS := 40
    TW_CUSTOM_CPU_POS := 605
    TW_STATUS_ICONS_ALIGN := center
endif
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Decryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

#SHRP
SHRP_DEVICE_CODE := evergo
SHRP_PATH := device/xiaomi/evergo
SHRP_MAINTAINER := weaponmasterjax
SHRP_DEVICE_TYPE := A/B
SHRP_REC := /dev/block/platform/bootdevice/by-name/boot
SHRP_REC_TYPE := SAR
SHRP_EDL_MODE := 0
SHRP_EXPRESS := true
SHRP_EXPRESS_USE_DATA := true
SHRP_FLASH := 0
SHRP_INTERNAL := /sdcard
SHRP_EXTERNAL := /external_sd
SHRP_OTG := /usb_otg
SHRP_AB := true
SHRP_NOTCH := true
SHRP_DARK := false
SHRP_STATUSBAR_RIGHT_PADDING := 40
SHRP_STATUSBAR_LEFT_PADDING := 40
# SHRP Addons
SHRP_SKIP_DEFAULT_ADDON_1 := true
SHRP_SKIP_DEFAULT_ADDON_2 := true
INC_IN_REC_MAGISK := true
INC_IN_REC_ADDON_3 := true
INC_IN_REC_ADDON_4 := true
# extras
SHRP_EXTERNAL_ADDON_PATH := $(DEVICE_PATH)/addons/
SHRP_EXTERNAL_ADDON_1_NAME := "Mount Super as RW"
SHRP_EXTERNAL_ADDON_1_INFO := "This will mount your system partitions as RW"
SHRP_EXTERNAL_ADDON_1_FILENAME := mountrw.zip
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := Mount
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := Mounted
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
SHRP_EXTERNAL_ADDON_2_NAME := dynDFE
SHRP_EXTERNAL_ADDON_2_INFO := "This will disable force encryption of your device."
SHRP_EXTERNAL_ADDON_2_FILENAME := dynDFE.zip
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := Disable
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := Disabled
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true