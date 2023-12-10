# Ported from https://github.com/Iceows/lineage_build_leaos/blob/lineage-20.0/build.sh

apply_patches() {
    echo "Applying patch group ${1}"
    bash /root/userscripts/apply_patches.sh ./lineage_patches_leaos/${1}
}

echo "Executing repopick"
repopick 321337 -f # Deprioritize important developer notifications
repopick 321338 -f # Allow disabling important developer notifications
repopick 321339 -f # Allow disabling USB notifications
repopick 340916 # SystemUI: add burnIn protection
repopick 342860 # codec2: Use numClientBuffers to control the pipeline
repopick 342861 # CCodec: Control the inputs to avoid pipeline overflow
repopick 342862 # [WA] Codec2: queue a empty work to HAL to wake up allocation thread
repopick 342863 # CCodec: Use pipelineRoom only for HW decoder
repopick 342864 # codec2: Change a Info print into Verbose

echo "Unzipping isp_dts"
# EMUI 9
unzip -o ./vendor/huawei/hi6250-9-common/proprietary/vendor/firmware/isp_dts.zip -d ./vendor/huawei/hi6250-9-common/proprietary/vendor/firmware

echo "Applying device patches"
apply_patches patches_device
apply_patches patches_device_iceows
