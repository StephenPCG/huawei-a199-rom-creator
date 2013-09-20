#!/bin/bash

__script_dir=$(dirname $0)
__root_dir=$(dirname $__script_dir)
source $__script_dir/common

pushd $__root_dir >/dev/null 2>&1

if ! prepared; then
    echo "not prepared, please run $__script_dir/00_prepare.sh first."
    exit 1
fi

$SYSTEM_PROP=$__work_dir/system/build.prop
$CUST_PROP=$__work_dir/cust/chinatelecom/cn/prop/local.prop
$DEFAULTS_XML=$__work_dir/cust/chinatelecom/cn/xml/hw_defaults.xml

# show battery_percent
if yes_or_no "Show Battery Percent?" y; then
    prop_set $CUST_PROP ro.config.hw_battery_percent true
else
    prop_set $CUST_PROP ro.config.hw_battery_percent false
fi
defaults_xml_set $DEFAULTS_XML integer battery_percent_switch 1
echo "Show Battery Percent: $(prop_get work/system/build.prop ro.config.hw_battery_percent)"
echo

# change display version id
curver=$(prop_get work/cust/chinatelecom/cn/prop/local.prop ro.build.display.id)
read -p "Change Display Version id? [$curver]: " newver
if [ -n "$newver" ]; then
    prop_set $CUST_PROP ro.build.display.id $newver
fi
echo "Display Version id: $(prop_get work/cust/chinatelecom/cn/prop/local.prop ro.build.display.id)"
echo

# enable usb debugging by default
if yes_or_no "Enable usb debugging by default?" y; then
    prop_set $CUST_PROP persist.service.adb.enable 1
    defaults_xml_set $DEFAULTS_XML integer development_settings_enabled 1
else
    prop_set $CUST_PROP persist.service.adb.enable 0
    defaults_xml_set $DEFAULTS_XML integer development_settings_enabled 0
fi
defaults_xml_set $DEFAULTS_XML integer hw_development_items_hide 1
echo "Enable usb debugging by default: $(prop_get work/system/build.prop persist.service.adb.enable)"
echo

# disable ip call
if yes_or_no "Disable ip call?" y; then
    defaults_xml_set $DEFAULTS_XML integer ipcall_enabled 0
else
    defaults_xml_set $DEFAULTS_XML integer ipcall_enabled 1
fi
echo "ip call enabled: $(defaults_xml_get $DEFAULTS_XML ipcall_enabled)"
echo

# status bar AM/PM style: 0 - large font AM/PM; 1 - small font AM/PM; 2 - do not display
prop_set $CUST_PROP ro.config.AM_PM_STYLE 2
defaults_xml_set $DEFAULTS_XML settings.system.time_12_24 24

# enable GSM
prop_set $CUST_PROP ro.config.hide_gsm_apn false
prop_set $CUST_PROP persist.service.gsmdataservice true
defaults_xml_set $DEFAULTS_XML integer gsm_enable_ct 1

# this do not matter since epush apk is removed
prop_set $CUST_PROP ro.config.enable.telecom_epush false

# vim:ai:et:sts=4:sw=4:
