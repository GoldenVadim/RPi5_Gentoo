#!/bin/sh

# Variables
DISK=/dev/sda # /mnt/mmcblk0 for RPi 5
DEST=Root

sudo umount -v $DISK
sudo mount -v /dev/sda2 $DEST -m
sudo mount -v /dev/sda1 $DEST/boot -m

lsblk
