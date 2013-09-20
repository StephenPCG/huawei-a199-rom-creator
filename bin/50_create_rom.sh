#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

EXT4_UTILS_PATH="$__root_dir/tools/ext4_utils"

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

echo "creating userdata.img ..."
sudo rm -rf $__work_dir/userdata/*
sudo cp -r $__work_dir/cust/ $__work_dir/userdata/cust
sudo chown -R 1000.1000 $__work_dir/userdata/cust
echo -n "chinatelecom/cn" | sudo tee $__work_dir/userdata/custom.bin >/dev/null

sudo $MAKE_EXT4FS -l 5g -s -a userdata $__rom_dir/userdata.img $__work_dir/userdata

# vim:ai:et:sts=4:sw=4:
