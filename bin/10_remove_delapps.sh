#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

SYSTEM=${1:-$__work_dir/system}

if [ ! -d "$SYSTEM" ]; then
    echo "$SYSTEM does not exist or is not a folder."
    exit 1
fi

echo "Removing $SYSTEM/delapp/*.apk ..."
for apk_file in $SYSTEM/delapp/*.apk; do
    remove_apk $apk_file
done

# vim:ai:et:sts=4:sw=4:
