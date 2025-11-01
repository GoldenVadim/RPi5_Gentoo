#!/bin/sh
./CheckEnv.sh || exit 1;

sh $WORK/InstallStage3.sh
sh $WORK/InstallFirmwareBoot.sh

echo '/!\ Contents of destination'
ls -l $BRCM
ls $DEST
echo

echo '/!\ Changing password of root to `raspberry`.'
sed -i "1c$(cat shadow)" $DEST/etc/shadow || echo ' *  Unable to change password using `sed`. Please do it manually.'
echo

echo '/!\ Run these commands if you are installed with systemd profile:'
echo " * systemd-firstboot --root=${DEST} --reset --prompt"
echo " * systemd-machine-id-setup --root=${DEST}"
echo " * systemctl --root=${DEST} preset-all"
echo " * systemctl --root=${DEST} preset-all --global"
echo

echo "/!\ Comment this string in ${DEST}/etc/inittab if you will use profile with OpenRC"
echo '    f0:12345:respawn:/sbin/agetty 9600 ttyAMA0 vt100'
echo
