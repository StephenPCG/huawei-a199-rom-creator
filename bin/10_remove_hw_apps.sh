#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

__work_dir=$__root_dir/work
__rom_dir=$__root_dir/rom
__output_dir=$__root_dir/output

function remove_apk(){
    apk_file=$1
    # find all lib/*.so
    for so_file in `unzip -t $apk_file | grep -Eo ' lib/.+\.so '`; do
        so_file=$SYSTEM/$so_file
        if [ -e $so_file ]; then
            echo "removing $so_file from $apk_file ..."
            sudo rm -f $so_file
        fi
    done
    echo "removing $apk_file ..."
    sudo rm -f $apk_file
}

SYSTEM=${1:-$__work_dir/system}

if [ ! -d "$SYSTEM" ]; then
    echo "$SYSTEM does not exist or is not a folder."
    exit 0
fi

while read apk_file; do
    if [ -e $SYSTEM/app/$apk_file ]; then
        remove_apk $SYSTEM/app/$apk_file
    fi
done <<EOF
ApkBatchInstall.apk
CountLapseTime.apk
Email.apk
HandWritingSimpPack.apk
HwAppObserver.apk
HwCameraHelp.apk
HWCardManager.apk
HwFileManager.apk
HwFlashlight.apk
HwIME.apk
HwNotePad.apk
HwPowerGenieEngine.apk
HwPowerManager.apk
HwPushService.apk
HwStartupGuide.apk
PinyinPack.apk
QuickSearchBox.apk
HwAllBackup.apk
Calculator.apk
UserDictionaryProvider.apk
CangjiePack.apk
HwOUC.apk
HwMediaCenter.apk
EOF

# vim:ai:et:sts=4:sw=4:
