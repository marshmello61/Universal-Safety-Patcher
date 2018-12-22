# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

sed 's/ORANGE/GREEN/i' /proc/cmdline | sed 's/YELLOW/GREEN/i' > /data/local/tmp/cmdline
mount -o bind /data/local/tmp/cmdline /proc/cmdline

sed
's;^ro.*\.build\.fingerprint=.*;ro.vendor.build.fingerprint=google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys;' /system/vendor/build.prop > /data/local/tmp/build.prop
mount -o bind /data/local/tmp/build.prop /system/vendor/build.prop
resetprop ro.vendor.build.fingerprint 'google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys'
