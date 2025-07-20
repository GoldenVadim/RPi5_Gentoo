#!/bin/sh
. ./SetupEnv.sh

sudo umount -v $DISK*
sudo mount -v /dev/sda2 $DEST -m
sudo mount -v /dev/sda1 $DEST/boot -m

lsblk
