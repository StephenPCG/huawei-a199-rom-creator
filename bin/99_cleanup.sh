#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

source $__script_dir/common

for dir in $__work_dir/*; do
    if [ -d "$dir" ]; then
        if grep -q "$dir" /proc/mounts; then
            echo umounting $dir
            sudo umount $dir
        fi
    fi
done
echo "removing $__work_dir/ ..."
rm -rf $__work_dir

echo "removing $__output_dir/ ..."
rm -rf $__output_dir

# vim:ai:et:sts=4:sw=4:
