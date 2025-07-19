#!/bin/sh

DEST=/mnt # or /mnt/gentoo for example.
BRCM=$DEST/lib/firmware/brcm
sudo mkdir -p $BRCM

# Wi-Fi
sudo cp ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio-standard.bin ${DEST}/lib/firmware/brcm/
sudo cp ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio.clm_blob ${DEST}/lib/firmware/brcm/
sudo cp ${WORK}/firmware-nonfree/debian/config/brcm80211/brcm/brcmfmac43455-sdio.txt ${DEST}/lib/firmware/brcm/
sudo ln -s cyfmac43455-sdio-standard.bin $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.bin
sudo ln -s cyfmac43455-sdio.clm_blob $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob
sudo ln -s brcmfmac43455-sdio.txt $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.txt

# Bluetooth
sudo cp ${WORK}/bluez-firmware/debian/firmware/broadcom/BCM4345C0.hcd ${DEST}/lib/firmware/brcm/
sudo ln -s BCM4345C0.hcd $BRCM/BCM4345C0.raspberrypi,5-model-b.hcd


ls -l $BRCM
