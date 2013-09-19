echo
echo "Remove Telecom Customization Apps"
echo "---------------------------------"
echo
echo "This script will remove system/delapp/*.apk and corresponding lib/*.so"
echo

echo -n "Proceed (y/n)? (default: y): "
read do_remove
echo

if [ "$do_remove" == "n" ]
then
  exit 0
fi

function remove_apk()
{
  apk_file=$1
  # find all lib/*.so
  for so_file in `unzip -t $apk_file | grep -Eo ' lib/.+\.so '`
  do
    so_file=$SYSTEM/$so_file
    if [ -e $so_file ]
    then
      echo "removing $so_file from $apk_file ..."
      sudo rm -f $so_file
    fi
  done
  echo "removing $apk_file ..."
  sudo rm -f $apk_file
}

SYSTEM=${1:-system}

if [ ! -d "$SYSTEM" ]
then
  echo "$SYSTEM does not exist or is not a folder."
  exit 0
fi

for apk_file in $SYSTEM/delapp/*.apk
do
  if [ -e $apk_file ]
  then
    remove_apk $apk_file
  fi
done

while read apk_file
do
  if [ -e $apk_file ]
  then
    remove_apk $apk_file
  fi
done <<EOF
$SYSTEM/app/yituisong.apk
EOF

# vim:ai:et:sts=2:sw=2:ft=sh
