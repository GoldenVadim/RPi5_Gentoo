#!/bin/sh
./CheckEnv.sh || exit 1;

sh $WORK/InstallStage3.sh
sh $WORK/InstallFirmwareBoot.sh

echo '/!\ Contents of destination'
ls -l $BRCM
ls $DEST
echo

echo '/!\ Run these commands if you are installed with systemd profile:'
echo " * systemd-firstboot --root=${DEST} --reset --prompt"
echo " * systemctl --root=${DEST} preset-all"
echo " * systemctl --root=${DEST} preset-all --global"
echo

echo '/!\ Password of root will be `raspberry`.'
sed -i "1c$(cat shadow)" $DEST/etc/shadow
echo

echo "/!\ Comment this string in ${DEST}/etc/inittab for OpenRC profiles"
echo ' f0:12345:respawn:/sbin/agetty 9600 ttyAMA0 vt100'
echo
