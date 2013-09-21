#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

while read apk cmversion; do
    if [ "$apk" == -* ]; then continue; fi
    if [ -e "$__work_dir/system/apps/$apk" ]; then
        remove_apk "$__work_dir/system/apps/$apk"
    fi
    install_apk $__root_dir/cm/$cmversion/system/app/$apk $__work_dir/system/
done <<EOF
DeskClock.apk       10.1.2
Trebuchet.apk       10.0.0
-Calculator.apk      10.1.2 INSTALL_FAILED_OLDER_SDK
Torch.apk           10.0.0
SoundRecorder.apk   10.0.0
-DSPManager.apk      10.0.0
EOF

sudo mkdir $__work_dir/cust/chinatelecom/cn/media/
sudo cp $__root_dir/tools/cm/bootanimation.zip $__work_dir/cust/chinatelecom/cn/media/


# vim:ai:et:sts=4:sw=4:
