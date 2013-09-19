#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)

pushd $__root_dir >/dev/null 2>&1

source $__script_dir/common

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

# show battery_percent
if yes_or_no "Show Battery Percent?" y; then
    prop_set work/system/build.prop ro.config.hw_battery_percent true
else
    prop_set work/system/build.prop ro.config.hw_battery_percent false
fi
echo "Show Battery Percent: $(prop_get work/system/build.prop ro.config.hw_battery_percent)"
echo

# change display version id
curver=$(prop_get work/cust/chinatelecom/cn/prop/local.prop ro.build.display.id)
read -p "Change Display Version id? [$curver]: " newver
if [ -n "$newver" ]; then
    prop_set work/cust/chinatelecom/cn/prop/local.prop ro.build.display.id $newver
fi
echo "Display Version id: $(prop_get work/cust/chinatelecom/cn/prop/local.prop ro.build.display.id)"
echo

# enable usb debugging by default
if yes_or_no "Enable usb debugging by default?" y; then
    prop_set work/system/build.prop persist.service.adb.enable 1
else
    prop_set work/system/build.prop persist.service.adb.enable 0
fi
echo "Enable usb debugging by default: $(prop_get work/system/build.prop persist.service.adb.enable)"
echo

# disable ip call
if yes_or_no "Disable ip call?" y; then
    prop_set work/system/build.prop ro.config.hw_support_ipcall false
else
    prop_set work/system/build.prop ro.config.hw_support_ipcall true
fi
echo "Support ipcall: $(prop_get work/system/build.prop ro.config.hw_support_ipcall)"
echo


# vim:ai:et:sts=4:sw=4:
