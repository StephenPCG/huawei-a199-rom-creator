#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

SYSTEM_PROP=$__work_dir/system/build.prop
CUST_PROP=$__work_dir/cust/chinatelecom/cn/prop/local.prop
DEFAULTS_XML=$__work_dir/cust/chinatelecom/cn/xml/hw_defaults.xml

cp -v $SYSTEM_PROP /tmp/build.prop
cp -v $CUST_PROP /tmp/local.prop
cp -v $DEFAULTS_XML /tmp/hw_defaults.xml

# show battery_percent
echo "[custom] show battery percent"
prop_set $CUST_PROP ro.config.hw_battery_percent true
prop_set $SYSTEM_PROP ro.config.hw_battery_percent true
defaults_xml_set $DEFAULTS_XML integer battery_percent_switch 1

# change display version id
echo "[custom] rom display version id: $__rom_ver"
prop_set $CUST_PROP ro.build.display.id $__rom_ver
prop_set $SYSTEM_PROP ro.build.display.id $__rom_ver

# enable usb debugging by default
echo "[custom] enable usb debugging"
prop_set $CUST_PROP persist.service.adb.enable 1
prop_set $SYSTEM_PROP persist.service.adb.enable 1
defaults_xml_set $DEFAULTS_XML integer development_settings_enabled 1
defaults_xml_set $DEFAULTS_XML integer hw_development_items_hide 1

# disable ip call
echo "[custom] disable ipcall"
defaults_xml_set $DEFAULTS_XML integer ipcall_enabled 0
prop_set $SYSTEM_PROP ro.config.hw_support_ipcall false
prop_set $CUST_PROP ro.config.hw_support_ipcall false

# status bar AM/PM style: 0 - large font AM/PM; 1 - small font AM/PM; 2 - do not display
echo "[custom] status bar AM/PM style: none"
prop_set $CUST_PROP ro.config.AM_PM_STYLE 2
prop_set $SYSTEM_PROP ro.config.AM_PM_STYLE 2
# default use 24h format
defaults_xml_set $DEFAULTS_XML settings.system.time_12_24 24

# enable GSM
echo "[custom] enable gsm"
prop_set $CUST_PROP ro.config.hide_gsm_apn false
prop_set $CUST_PROP persist.service.gsmdataservice true
prop_set $SYSTEM_PROP ro.config.hide_gsm_apn false
prop_set $SYSTEM_PROP persist.service.gsmdataservice true
defaults_xml_set $DEFAULTS_XML integer gsm_enable_ct 1

# copy hw_launcher_default_workspace.xml
sudo cp -vf $__root_dir/tools/cust/hw_launcher_default_workspace.xml $__work_dir/cust/chinatelecom/cn/xml/

## set default theme
if [ -e "$__work_dir/system/themes/Taste.hwt" ]; then
    echo use theme: Taste.hwt
    defaults_xml_set $DEFAULTS_XML string hw_def_theme /system/themes/Taste.hwt
fi

# change emui version
#prop_set $CUST_PROP ro.build.version.emui 1.6
#prop_set $SYSTEM_PROP ro.build.version.emui 1.6

# vim:ai:et:sts=4:sw=4:
