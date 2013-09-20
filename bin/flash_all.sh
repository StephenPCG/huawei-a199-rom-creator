#!/bin/bash

set -e

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__rom_dir >/dev/null 2>&1

echo "rebooting to bootloader..."
sudo adb reboot-bootloader

flashimg() {
    imgname=$1
    if [ -e "${imgname}.img" ]; then
        sudo fastboot flash $imgname ${imgname}.img
    fi
}

if yes_or_no "Wipe userdata?" n; then
    wipe_userdata=yes
else
    wipe_userdata=no
fi

flashimg boot
flashimg recovery
flashimg system
flashimg cust
if [ "$wipe_userdata" == yes ]; then
    flashimg userdata
fi

sudo fastboot reboot

popd >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4:
