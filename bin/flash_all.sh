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

flashimg boot
flashimg recovery
flashimg system
flashimg userdata
flashimg cust

sudo fastboot reboot-bootloader
exit 0

sudo fastboot reboot

sudo adb wait-for-device
sudo adb reboot recovery

popd >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4:
