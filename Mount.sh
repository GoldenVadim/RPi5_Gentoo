#!/bin/sh
./CheckEnv.sh || exit 1;

file $DISK || { echo "/!\ '${DISK}' is not found."; exit 1; }
umount -v $DISK*
mount -o sync -v "${DISK}"2 $DEST -m || { echo "/!\ Failed to mount second root partition of '${DISK}'."; exit 1; }
mount -o sync -v "${DISK}"1 $DEST/boot -m || { echo "/!\ Failed to mount first boot partition of '${DISK}'."; exit 1; }

lsblk
