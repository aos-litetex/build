# Ported from https://github.com/Iceows/lineage_build_leaos/blob/lineage-20.0/build.sh

# Was changed in https://github.com/LineageOS/android_vendor_lineage/commit/49b20fd75c747da08697e6db0be1e300b2fff6f6
# Ported over from https://github.com/Iceows/lineage_build_leaos/commit/18c18ad4b7a5c821a1acb7eab11c06b72344eea0
export WITH_ADB_INSECURE=true

apply_patches() {
    echo "Applying patch group ${1}"
    bash /root/userscripts/apply_patches.sh ./lineage_patches_leaos/${1}
}

echo "Applying treble patches"
apply_patches patches_treble_prerequisite
apply_patches patches_treble_td

apply_patches patches_platform
apply_patches patches_treble
apply_patches patches_platform_personal
apply_patches patches_treble_personal
apply_patches patches_treble_iceows

echo "Finalizing preparations for treble"
rm -f device/*/sepolicy/common/private/genfs_contexts
cd device/phh/treble
git clean -fdx
bash generate.sh lineage
cd ../../..
