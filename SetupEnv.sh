#!/bin/sh
# Script for initializing environment variables
#  WORK | Path to required files
#  DISK | Path to disk block
#  DEST | Mountpoint for mounting $DISK1 and $DISK2
#  BRCM is used for installing Wi-Fi and Bluetooth firmware

export WORK=$PWD
export DISK=/dev/sda
export DEST=$WORK/Root
export BRCM=$DEST/lib/firmware/brcm

echo "Work path: ${WORK}; Disk block: ${DISK}; Mount destination: ${DEST}; BRCM: ${BRCM}"
