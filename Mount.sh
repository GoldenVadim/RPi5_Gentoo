#!/bin/sh

DISK=/dev/sda # /mnt/mmcblk0 for RPi 5

sudo umount $DISK*
sudo mount /dev/sda2 Root
sudo mount /dev/sda1 Root/boot

lsblk
