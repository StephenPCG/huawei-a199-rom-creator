#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

__work_dir=$__root_dir/work
__rom_dir=$__root_dir/rom
__output_dir=$__root_dir/output

gapps_zip="gapps-jb-20121011-signed.zip"

if [ ! -e "$gapps_zip" ]; then
    echo "please download $gapps_zip and put it in this dir."
    exit 1
fi

pushd $__work_dir >/dev/null 2>&1
sudo unzip ../$gapps_zip -x 'optional/*' 'META-INF/*' install-optional.sh
popd >/dev/null 2>&1

# vim:ai:et:sts=4:sw=4:
