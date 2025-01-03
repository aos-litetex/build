# Build Environment

For my fork (codename "HydraX") of [LeaOS](https://github.com/Iceows/lineage_build_leaos) for ``Huawei P20 lite`` aka ``ANE-LX1``.

## OS information & scope
* Based on ``Android 13``→[``LineageOS 20``](https://lineageos.org/)→[``LeaOS``](https://xdaforums.com/t/rom-huawei-13-leaos-lineage-20-0-for-huawei-device-emui-9-1-version.4558665/)
* Shipped with [microG](https://microg.org/) and [F-Droid](https://f-droid.org)
* Some minor additional patches to improve usability (e.g. not contacting unreachable [captive-portal](https://en.wikipedia.org/wiki/Captive_portal) [servers located in China](https://github.com/aos-litetex/lineage_patches_leaos/commit/8b829f6299dc90607f4cdc1f0917a6028dea9728)) and the build process
* The build aims to be 
  * Platform-independent (using Docker)
  * Automated so that security updates can be shipped more often

## Installation guide
based on the [original guide from XDA](https://xdaforums.com/t/rom-huawei-13-leaos-lineage-20-0-for-huawei-device-emui-9-1-version.4558665/)

<details><summary>Requirements</summary>

* Huawei P20 lite
* A PC with ADB installed and a USB cable to connect the phone

</details>

<br/>

<details><summary><b>INITIAL installation</b></summary>

* Create a backup of all your data on the phone, it will be lost otherwise!
* [Unlock the bootloader](https://github.com/aos-litetex/unlock-p20-lite-bootloader)
* Boot up your phone, go into developer settings, enable ADB and make sure OEM unlock is active
* Enter fastboot
  * Connect your phone with a PC
  * Hold ``Vol Down`` + ``Power``
* Flash TWRP (recovery): ``fastboot flash recovery_ramdisk <twrp.img>``
  * Can be downloaded from: https://dl.twrp.me/anne/
* Flash [TureX's ``phenix`` kernel](https://xdaforums.com/t/kernel-emui-9-p20-lite-phenix-kernel.4241503/) since Huawei ships an outdated kernel
* Flash system: ``fastboot flash <system.img>``
  * Can be downloaded from the [releases](https://github.com/aos-litetex/build/releases)
  * The image is compressed with ``zstd``. You have to unpack it first!
    * On Windows you can do this e.g. with this [7-Zip-zstd](https://github.com/mcmilk/7-Zip-zstd)
* Boot into recovery/TWRP
  * Remove USB cable
  * Hold ``Vol Up`` + ``Power``
  * Allow modifications, DO NOT choose "read-only"! You may brick your phone!
* Resize system: ``Wipe > Advanced Wipe > System > Repair or Change File System > Resize File System > Swipe``
* Wipe 
  * ``cache``
  * ``dalvik/art cache``
  * ``internal storage``
  * ``data``
* (optional) Install DRM (see XDA forum/guide for details)
* Reboot your system
* First start assistant should show up

</details>

<br/>

<details><summary><b>Updating an existing installation</b></summary>

* Enter fastboot
  * Connect your phone with a PC
  * Hold ``Vol Down`` + ``Power``
* Flash system: ``fastboot flash <system.img>``
  * Can be downloaded from the [releases](https://github.com/aos-litetex/build/releases)
  * The image is compressed with ``zstd``. You have to unpack it first!
    * On Windows you can do this e.g. with this [7-Zip-zstd](https://github.com/mcmilk/7-Zip-zstd)
* Boot into recovery/TWRP
  * Remove USB cable
  * Hold ``Vol Up`` + ``Power``
  * Allow modifications, DO NOT choose "read-only"! You may brick your phone!
* Resize system: ``Wipe > Advanced Wipe > System > Repair or Change File System > Resize File System > Swipe``
* Wipe 
  * ``cache``
  * ``dalvik/art cache``
  * DO NOT WIPE ``internal storage`` or ``data`` or you will use all your apps/data
* Reboot your system

</details>

<br/>

<details><summary>General troubleshooting help</summary>

If the installation is not working / randomly crashing you can try the following:
* Reinstall it with above steps
* Pick an older release

</details>

## Notes for maintaining/building

### Requirements
* x64 Processor
* ~200GB of disk space
* ~22GB of RAM (depends on amount of Threads) for Docker
* Patience (even on a 16 core CI server with a 1Gb/s connection the build needs ~2h)

### How to update
* Update forked repositories
* Update ``vendor/hardware_overlay`` revision in [anne.xml](./user/manifests/anne.xml) so that it matches with upstream

### Further references
* https://xdaforums.com/t/rom-huawei-13-leaos-lineage-20-0-for-huawei-device-emui-9-1-version.4558665/
* https://github.com/lineageos4microg/docker-lineage-cicd
* https://github.com/testflows/TestFlows-GitHub-Hetzner-Runners
