#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

__work_dir=$__root_dir/work
__rom_dir=$__root_dir/rom
__output_dir=$__root_dir/output

echo "checking if any folder is mounted in $__work_dir ..."
if `mount | grep -q $__work_dir`; then
    echo "some folders are mounted in $__work_dir"
    mount | grep $__work_dir
    exit 1
fi

echo "clearing $__work_dir and $__rom_dir ..."
rm -rf $__work_dir
mkdir -pv $__work_dir

rm -rf $__rom_dir
mkdir -pv $__rom_dir

app_file=${1:-UPDATE.APP}

if [ ! -e "$app_file" ]; then
    echo "$app_file does not exist."
    exit 1
fi

echo "unpacking $app_file ..."
$__script_dir/split_updata.py -u $app_file

echo "mounting work/system/ ..."
mkdir -pv $__work_dir/system
sudo mount -o loop output/system.img $__work_dir/system

echo "mouting work/cust/..."
mkdir -pv $__work_dir/cust
sudo mount -o loop output/cust.img $__work_dir/cust

popd $__root_dir >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4:
