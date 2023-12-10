# Ported from https://github.com/Iceows/lineage_build_leaos/blob/lineage-20.0/build.sh

apply_patches() {
    echo "Applying patch group ${1}"
    bash /root/userscripts/apply_patches.sh ./lineage_patches_leaos/${1}
}

echo "Unzipping isp_dts"
# EMUI 9
unzip -o ./vendor/huawei/hi6250-9-common/proprietary/vendor/firmware/isp_dts.zip -d ./vendor/huawei/hi6250-9-common/proprietary/vendor/firmware

echo "Applying device patches"
apply_patches patches_device
apply_patches patches_device_iceows
