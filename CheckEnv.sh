#!/bin/sh

if [ -z $WORK ] || [ -z $DISK ] || [ -z $DEST ] || [ -z $BRCM ]; then
    echo 'Please, run `. ./SetupEnv.sh`'
    exit 1;
else exit 0;
fi
