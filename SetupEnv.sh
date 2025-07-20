#!/bin/sh
# Script for initializing environment variables
#  WORK=~/Documents/RaspberryPi5/Gentoo | Path to required files
#  DEST=/mnt/gentoo | Path to root filesystem
#  BRCM is used for installing Wi-Fi and Bluetooth firmware
# Manual running is unneeded

export WORK=.
export DISK=/dev/sda
export DEST=Root
export BRCM=$DEST/lib/firmware/brcm
