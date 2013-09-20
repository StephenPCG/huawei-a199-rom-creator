#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

if [ "$__is_testing" == "true" ]; then
    echo "TESTING MODE!"
fi
for apk_file in $__root_dir/tools/customapps/*.apk; do
    if [ "$__is_testing" != "true" ]; then
        if [[ "$apk_file" == test* ]]; then
            echo "not in testing mode, skip $apk_file"
            continue
        fi
    fi
    install_apk $apk_file $__work_dir/system/
done

# vim:ai:et:sts=4:sw=4:
