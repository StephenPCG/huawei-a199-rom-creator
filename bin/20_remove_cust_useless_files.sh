#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

while read file; do
    file=$__work_dir/cust/$file
    if [ -e "$file" ]; then
        sudo rm -vf $file
    elif [ -d "$file" ]; then
        sudo rm -vfr $file
    fi
done <<EOF
chinatelecom/cn/cdrom/autorun.iso
chinatelecom/cn/pcmodem/autorun.iso
EOF

# vim:ai:et:sts=4:sw=4:
