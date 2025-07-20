#!/bin/sh
# You can skip links if you already have downloaded stage3
. ./SetupEnv.sh

links https://www.gentoo.org/downloads/#arm64-advanced
file stage3-arm64*
sudo tar xvpf stage3-arm64*.tar.xz --numeric-owner --xattrs-include="*.*" -C $DEST

echo "Write this string to first line of ${DEST}/etc/shadow. Password of root will be 'raspberry'"
cat shadow

echo "Comment this string in ${DEST}/etc/inittab"
echo 'f0:12345:respawn:/sbin/agetty 9600 ttyAMA0 vt100'
