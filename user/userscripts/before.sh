# Ported from https://github.com/Iceows/lineage_build_leaos/blob/lineage-20.0/build.sh

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
