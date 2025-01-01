# See also https://github.com/AndyCGYan/lineage_build_unified/blob/lineage-20-td/buildbot_unified.sh

echo "Executing repopick"
repopick -t 13-burnin -r -f
repopick -t 13-taro-kalama -r -f
repopick 321337 -r -f # Deprioritize important developer notifications
repopick 321338 -r -f # Allow disabling important developer notifications
repopick 321339 -r -f # Allow disabling USB notifications
