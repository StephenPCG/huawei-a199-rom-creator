#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

source $__script_dir/common

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

sudo cp -v $__root_dir/tools/su_files/chainfire/su $__work_dir/system/xbin/su
sudo chown -v 0.0 $__work_dir/system/xbin/su
sudo chmod -v u+rwsx,g=rsx,o+rx $__work_dir/system/xbin/su

sudo cp -v $__root_dir/tools/su_files/chainfire/Superuser.apk $__work_dir/system/app/
sudo chown -v 0.0 $__work_dir/system/app/Superuser.apk

popd >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4:
