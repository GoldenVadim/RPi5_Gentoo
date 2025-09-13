#!/bin/sh
. ./SetupEnv.sh

echo " * Unpacking stage3..."
links https://www.gentoo.org/downloads/#arm64-advanced || echo " * Skipping links"
file stage3-arm64*.tar.xz || { echo "/!\ stage3 is not found. Please, download it."; exit 1; }
sudo tar xvpf stage3-arm64*.tar.xz --numeric-owner --xattrs-include="*.*" -C $DEST || { echo "/!\ Failed to unpack stage3."; exit 1; }

echo " * Copying boot files..."
sudo cp -v ${WORK}/firmware/boot/bcm2712-rpi-5-b.dtb ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/fixup_cd.dat ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/fixup.dat ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/start_cd.elf ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/start.elf ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/bootcode.bin ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/kernel_2712.img ${DEST}/boot/
sudo cp -rv ${WORK}/firmware/boot/overlays ${DEST}/boot/
sudo cp -rv ${WORK}/firmware/modules/*-v8l-16k ${DEST}/lib/
sudo cp -v ${WORK}/firmware/extra/System_2712.map ${DEST}/boot

sudo mkdir -p $BRCM

echo " * Copying firmware..."
sudo cp -v ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio-standard.bin $BRCM
sudo cp -v ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio.clm_blob $BRCM
sudo cp -v ${WORK}/firmware-nonfree/debian/config/brcm80211/brcm/brcmfmac43455-sdio.txt $BRCM
sudo ln -sv cyfmac43455-sdio-standard.bin $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.bin
sudo ln -sv cyfmac43455-sdio.clm_blob $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob
sudo ln -sv brcmfmac43455-sdio.txt $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.txt

sudo cp -v ${WORK}/bluez-firmware/debian/firmware/broadcom/BCM4345C0.hcd $BRCM
sudo ln -sv BCM4345C0.hcd $BRCM/BCM4345C0.raspberrypi,5-model-b.hcd

ls -l $BRCM

echo " * Synchronizing all writes to disk, please don't interrupt."
sudo sync
echo

echo "/!\ Contents of destination"
ls $DEST
echo

echo "/!\ Run these commands if you are installed with systemd profile:"
echo " systemd-firstboot --root=${DEST} --reset --prompt"
echo " systemd-machine-id-setup --root=${DEST}"
echo " systemctl --root=${DEST} preset-all"
echo " systemctl --root=${DEST} preset-all --global"
echo

echo "/!\ Password of root will be 'raspberry'."
sed -i "1c$(cat shadow)" $DEST/etc/shadow
echo

echo "/!\ Comment this string in ${DEST}/etc/inittab"
echo ' f0:12345:respawn:/sbin/agetty 9600 ttyAMA0 vt100'
echo
