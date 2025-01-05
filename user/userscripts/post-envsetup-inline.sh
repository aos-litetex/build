# Ported from https://github.com/Iceows/lineage_build_leaos/blob/lineage-20.0/build.sh
# See also https://github.com/AndyCGYan/lineage_build_unified/blob/lineage-20-td/buildbot_unified.sh

# Was changed in https://github.com/LineageOS/android_vendor_lineage/commit/49b20fd75c747da08697e6db0be1e300b2fff6f6
# Ported over from https://github.com/Iceows/lineage_build_leaos/commit/18c18ad4b7a5c821a1acb7eab11c06b72344eea0
echo "Setting WITH_ADB_INSECURE"
export WITH_ADB_INSECURE=true

echo "Executing repopick"
# repopick -t 13-burnin -r -f # Burn In Protection is not needed since it's not active and the targeted phones don't have a OLED display
repopick -t 13-taro-kalama -r -f
repopick 321337 -r -f # Deprioritize important developer notifications
repopick 321338 -r -f # Allow disabling important developer notifications
repopick 321339 -r -f # Allow disabling USB notifications
