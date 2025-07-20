#!/bin/sh

DISK=/dev/sda # /mnt/mmcblk0 for RPi 5
DEST=Root

sudo umount $DISK
sudo mount /dev/sda2 $DEST -m
sudo mount /dev/sda1 $DEST/boot -m

lsblk
