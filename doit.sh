#!/bin/bash

bin/99_cleanup.sh
#
bin/00_prepare.sh
bin/10_remove_delapps.sh
bin/10_remove_stockrom_apps.sh
bin/10_add_google_apps.sh
bin/10_add_custom_apps.sh
bin/20_remove_cust_useless_files.sh
bin/20_get_root.sh
bin/20_do_customization.sh

bin/50_create_rom.sh

# vim:ai:et:sts=4:sw=4:
