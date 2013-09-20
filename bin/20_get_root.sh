#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

sudo cp -v $__root_dir/tools/su_files/chainfire/su $__work_dir/system/xbin/su
sudo chown -v 0.0 $__work_dir/system/xbin/su
sudo chmod -v u+rwsx,g=rsx,o+rx $__work_dir/system/xbin/su

sudo cp -v $__root_dir/tools/su_files/chainfire/Superuser.apk $__work_dir/system/app/
sudo chown -v 0.0 $__work_dir/system/app/Superuser.apk

# update busybox
echo "installing busybox"
sudo rm -vf $__work_dir/system/bin/busybox
sudo cp -vf $__root_dir/tools/busybox_files/busybox1.20.2 $__work_dir/system/xbin/busybox
sudo chmod 755 $__work_dir/system/xbin/busybox
sudo chown -v 0.2000 $__work_dir/system/xbin/busybox
while read applet; do
    if [ ! -e "$__work_dir/system/xbin/$applet" ]; then
        sudo ln -sv busybox  "$__work_dir/system/xbin/$applet"
        sudo chown -h 0.2000 "$__work_dir/system/xbin/$applet"
    fi
done < $__root_dir/tools/busybox_files/busybox1.20.2.applets

popd >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4:
