#!/bin/sh
# You can skip links if you already have downloaded stage3
. ./SetupEnv.sh

links https://www.gentoo.org/downloads/#arm64-advanced
file stage3-arm64*
sudo tar xvpf stage3-arm64*.tar.xz --numeric-owner --xattrs-include="*.*" -C $DEST

echo "Run these commands if you are installed with systemd profile:"
echp "systemd-machine-id-setup --root=$DEST"
echo "systemctl --root=$DEST preset-all"
echo "systemctl --root=$DEST preset-all --global"

echo "Password of root will be 'raspberry'."
sed -i "1c$(cat shadow)" $DEST/etc/shadow

echo "Comment this string in ${DEST}/etc/inittab"
echo 'f0:12345:respawn:/sbin/agetty 9600 ttyAMA0 vt100'
