#!/bin/sh

# Mount.sh; you can change DEST variable in script
# /dev/sda2 -> DEST      | /dev/mmcblk0p2
# /dev/sda1 -> DEST/boot | /dev/mmcblk0p1

# Initialization
WORK=.
DEST=Root # or /mnt/gentoo for example.
BRCM=$DEST/lib/firmware/brcm
sudo mkdir -p $BRCM

# Kernel
git clone --depth=1 https://github.com/raspberrypi/firmware.git
sudo cp ${WORK}/firmware/boot/bcm2712-rpi-5-b.dtb ${DEST}/boot/
sudo cp ${WORK}/firmware/boot/fixup_cd.dat ${DEST}/boot/
sudo cp ${WORK}/firmware/boot/fixup.dat ${DEST}/boot/
sudo cp ${WORK}/firmware/boot/start_cd.elf ${DEST}/boot/
sudo cp ${WORK}/firmware/boot/start.elf ${DEST}/boot/
sudo cp ${WORK}/firmware/boot/bootcode.bin ${DEST}/boot/
sudo cp ${WORK}/firmware/boot/kernel_2712.img ${DEST}/boot/
sudo cp -r ${WORK}/firmware/boot/overlays ${DEST}/boot/
sudo cp -r ${WORK}/firmware/modules ${DEST}/lib/

# Wi-Fi
git clone --depth=1 https://github.com/RPi-Distro/firmware-nonfree.git
sudo cp ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio-standard.bin ${DEST}/lib/firmware/brcm/
sudo cp ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio.clm_blob ${DEST}/lib/firmware/brcm/
sudo cp ${WORK}/firmware-nonfree/debian/config/brcm80211/brcm/brcmfmac43455-sdio.txt ${DEST}/lib/firmware/brcm/
sudo ln -s cyfmac43455-sdio-standard.bin $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.bin
sudo ln -s cyfmac43455-sdio.clm_blob $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob
sudo ln -s brcmfmac43455-sdio.txt $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.txt

# Bluetooth
git clone --depth=1 https://github.com/RPi-Distro/bluez-firmware.git
sudo cp ${WORK}/bluez-firmware/debian/firmware/broadcom/BCM4345C0.hcd ${DEST}/lib/firmware/brcm/
sudo ln -s BCM4345C0.hcd $BRCM/BCM4345C0.raspberrypi,5-model-b.hcd


ls -l $BRCM
