# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from msm8998-common
include device/xiaomi/msm8998-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/chiron

# Kernel
TARGET_KERNEL_CONFIG := chiron_defconfig
# Xiaomi MiCode
#TARGET_KERNEL_CONFIG := sagit_user_defconfig

# uncomment/enable to allow root adb/mtp in TWRP recovery - comment out/disable for production run
BOARD_KERNEL_CMDLINE +=androidboot.selinux=permissive

# Assert
TARGET_OTA_ASSERT_DEVICE := chiron

# Audio
AUDIO_FEATURE_ELLIPTIC_ULTRASOUND_SUPPORT := true

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# --------------------------------------
# TWRP recovery specific setting - start
# --------------------------------------

#RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
TARGET_RECOVERY_QCOM_RTC_FIX := true

# TWRP Debugging
#TWRP_EVENT_LOGGING := true
#TARGET_USES_LOGD := true
#TWRP_INCLUDE_LOGCAT := true
#TARGET_RECOVERY_DEVICE_MODULES += strace
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $($(TARGET_OUT_OPTIONAL_EXECUTABLES)/strace
#TW_CRYPTO_SYSTEM_VOLD_DEBUG := true
#TW_CRYPTO_SYSTEM_VOLD_DISABLE_TIMEOUT := true

# Bootloader
#TARGET_BOOTLOADER_BOARD_NAME := msm8998
#TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Encryption
TW_INCLUDE_CRYPTO := true
# legacy hardware crypto used until 2018-04-20 by OmniROM/LineageOS/ResurrectionRemix/AOSP/AICP based ROMS
#TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
#TW_CRYPTO_USE_SYSTEM_VOLD := qseecomd
#TARGET_KEYMASTER_WAIT_FOR_QSEE := true
# enable/disable Qualcomm hardware encryption
#TARGET_HW_DISK_ENCRYPTION := true

# Recovery
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# additional filesystem support
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT := false
TW_NO_EXFAT_FUSE := false
#TW_NO_USB_STORAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_IGNORE_MISC_WIPE_DATA := true

# Other TWRP Configuration
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXTRA_LANGUAGES := true
# TW_DEFAULT_LANGUAGE := en
TW_EXCLUDE_SUPERSU := true

# Disable Mouse Cursor
TW_INPUT_BLACKLIST := "hbtp_vm"

# Display Brightness
TW_DEFAULT_BRIGHTNESS := 2047
TW_MAX_BRIGHTNESS := 4095
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"

# Use ro.product.model - backup folder is named like model not like serial number (default)
# TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

#ALLOW_MISSING_DEPENDENCIES := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# --------------------------------------
# TWRP recovery specific setting - end
# --------------------------------------

# Inherit from proprietary files
include vendor/xiaomi/chiron/BoardConfigVendor.mk
