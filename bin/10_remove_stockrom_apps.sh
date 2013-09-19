#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

source $__script_dir/common

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

SYSTEM=${1:-$__work_dir/system}

if [ ! -d "$SYSTEM" ]; then
    echo "$SYSTEM does not exist or is not a folder."
    exit 1
fi

while read action apk_file description; do
    if [ "$action" == "-" ]; then
        # remove apk_file
        remove_apk $SYSTEM/app/$apk_file
    fi
done < $__script_dir/stock_rom_apps.txt

# vim:ai:et:sts=4:sw=4:
