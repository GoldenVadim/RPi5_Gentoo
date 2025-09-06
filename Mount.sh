#!/bin/sh
. ./SetupEnv.sh

file $DISK || { echo "/!\ '${DISK}' is not found."; exit 1; }
sudo umount -v $DISK*
sudo mount -v "${DISK}"2 $DEST -m || { echo "/!\ Failed to mount second root partition of '${DISK}'."; exit 1; }
sudo mount -v "${DISK}"1 $DEST/boot -m || { echo "/!\ Failed to mount first boot partition of '${DISK}'."; exit 1; }

lsblk
