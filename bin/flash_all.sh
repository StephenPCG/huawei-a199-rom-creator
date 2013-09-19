#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

__work_dir=$__root_dir/work
__rom_dir=$__root_dir/rom
__output_dir=$__root_dir/output

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

sudo fastboot reboot

if [ ! -e "userdata.img" ]; then
    echo "rebooting to recovery ..."
    sudo adb wait-for-device
    sudo adb reboot recovery
fi

popd >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4:
