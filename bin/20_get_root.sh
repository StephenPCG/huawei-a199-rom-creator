#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

__work_dir=$__root_dir/work
__rom_dir=$__root_dir/rom
__output_dir=$__root_dir/output

sudo cp -v $__root_dir/tools/su_files/chainfire/su $__work_dir/system/xbin/su
sudo chown -v 0.0 $__work_dir/system/xbin/su
sudo chmod -v u+rwsx,g=rsx,o+rx $__work_dir/system/xbin/su

sudo cp -v $__root_dir/tools/su_files/chainfire/Superuser.apk $__work_dir/system/app/
sudo chown -v 0.0 $__work_dir/system/app/Superuser.apk

popd >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4: