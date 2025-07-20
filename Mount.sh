#!/bin/sh

DISK=/dev/sda # /mnt/mmcblk0 for RPi 5
DEST=Root

sudo umount $DISK*
mkdir -p $DEST/boot
sudo mount /dev/sda2 $DEST
sudo mount /dev/sda1 $DEST/boot

lsblk
