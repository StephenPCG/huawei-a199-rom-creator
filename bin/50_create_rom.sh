#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

__work_dir=$__root_dir/work
__rom_dir=$__root_dir/rom
__output_dir=$__root_dir/output

#PATH=`pwd`/ext4_utils/:$PATH
EXT4_UTILS_PATH="$(pwd)/ext4_utils"

pushd "$EXT4_UTILS_PATH" >/dev/null 2>&1
echo "compiling ext4_utils ..."
make
popd >/dev/null 2>&1

MAKE_EXT4FS="$EXT4_UTILS_PATH/make_ext4fs"
IMG2SIMG="$EXT4_UTILS_PATH/img2simg"

echo "creating system.img ..."
sudo $MAKE_EXT4FS -l 900m -s -a system $__rom_dir/system.img $__work_dir/system

echo "creating cust.img ..."
sudo $MAKE_EXT4FS -l 100m -s -a cust $__rom_dir/cust.img $__work_dir/cust

# vim:ai:et:sts=4:sw=4:
