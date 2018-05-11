Copyright (C) 2017/2018 The LineageOS Project & Copyright (C) 2018 OmniRom & Copyright (C) 2018 Nextgen-Networks

Device configuration for Xiaomi Mi MIX 2
=========================================

The Xiaomi Mi MIX 2 (codenamed _"Chiron"_) is a high-end smartphone from Xiaomi.

It was announced in October 2017. Release date was December 2017.

Modified to create Android 8.1 based TWRP recovery builds.  
TWRP Base to use with: https://github.com/nextgen-networks/android_bootable_recovery/tree/android-8.1_v7

## ... more information about setup your build environment & start a build:

To initialize your local repository using the OmniROM trees, use a command like this:

```
repo init -u git://github.com/omnirom/android.git -b android-8.1
```

Add to `.repo/local_manifests/roomservice_chiron.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--Please be carefull when manually edit this file-->
<manifest>
  <project name="nextgen-networks/android_device_xiaomi_chiron-OMNI" path="device/xiaomi/chiron" remote="github" revision="android-8.1" />
  <project name="nextgen-networks/android_device_xiaomi_msm8998-common" path="device/xiaomi/msm8998-common" remote="github" revision="android-8.1" />
  <project name="omnirom/android_kernel_xiaomi_msm8998" path="kernel/xiaomi/msm8998" remote="github" revision="android-8.1" />
  <project name="android_hardware_qcom_display-caf-msm8998" path="hardware/qcom/display-caf-msm8998" remote="omnirom" revision="android-8.1" />
  <project name="android_hardware_qcom_audio-caf-msm8998" path="hardware/qcom/audio-caf-msm8998" remote="omnirom" revision="android-8.1" />
  <project name="android_hardware_qcom_media-caf-msm8998" path="hardware/qcom/media-caf-msm8998" remote="omnirom" revision="android-8.1" />
  <project name="android_packages_apps_SnapdragonCamera2" path="packages/apps/SnapdragonCamera2" remote="omnirom" revision="android-8.1" />
  <project name="vendor_qcom_opensource_dataservices" path="vendor/qcom/opensource/dataservices" remote="omnirom" revision="android-8.1" />
  <project name="DonkeyCoyote/proprietary_vendor_xiaomi" path="vendor/xiaomi" remote="github" revision="android-8.1" />
</manifest>
```

Add to `.repo/local_manifests/roomservice.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--Please be carefull when manually edit this file-->
<manifest>
  <project name="omnirom/android_external_busybox" path="external/busybox" remote="github" revision="android-8.1" />
  <remove-project name="platform/bootable/recovery" />
  <project name="nextgen-networks/android_bootable_recovery" path="bootable/recovery" remote="github" revision="android-8.1_v7" />
  <project name="android_device_qcom_caf-sepolicy" path="device/qcom/sepolicy" remote="omnirom" revision="android-8.1" />
  <project name="android_vendor_qcom_opensource_interfaces" path="vendor/qcom/opensource/interfaces" remote="omnirom" revision="android-8.1" />
  <project name="android_vendor_qcom_opensource_dpm" path="vendor/qcom/opensource/dpm" remote="omnirom" revision="android-8.0" />
</manifest>
```

Then run `repo sync` to check it out.

To build:

```sh
recoverydevice="chiron" && . build/envsetup.sh && breakfast $recoverydevice && lunch omni_$recoverydevice-eng && croot && make -j8 recoveryimage && mv $OUT/recovery.img $OUT/twrp-3.2.1-0-$recoverydevice-$USER-$(date +%Y%m%d-%H%M)-OMNI.img
```


This device tree is intended to be used for devices with OS flavours as follows:  
* OmniRom
* LineageOS
* Resurrection Remix
* AOSP
* AICP
* MIUI (en-/decryption working since commits at 2018-04-24)

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Quad-core 2.45 GHz Kryo 280 & Quad-core 1.9 GHz Kryo 280
Chipset | Qualcomm MSM8998 Snapdragon 835
GPU     | Adreno 540
Memory  | 6/8 GB RAM
Shipped Android Version | 7.1.1
Storage | 64/128/256 GB (UFS Flash)
Battery | Non-removable Li-Po 3350 mAh (QC 3.0)
Display | 1080 x 2160 pixels, 5.99 inches (~403 ppi pixel density)
Camera  | 12 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash

## Device picture

![Xiaomi Mi MIX 2](https://i8.mifile.cn/a1/pms_1505401464.03824312!560x560.jpg "Xiaomi Mi MIX 2 in black")
