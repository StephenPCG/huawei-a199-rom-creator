#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

for apk_file in $__root_dir/customapps/*.apk; do
    install_apk $apk_file $__work_dir/system/
done

# vim:ai:et:sts=4:sw=4:
