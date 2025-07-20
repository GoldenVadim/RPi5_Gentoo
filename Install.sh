#!/bin/sh

# Mount.sh; you can change DEST variable in script
# /dev/sda2 -> DEST      | /dev/mmcblk0p2
# /dev/sda1 -> DEST/boot | /dev/mmcblk0p1

# Initialization
WORK=.
DEST=Root # or /mnt/gentoo for example.
BRCM=$DEST/lib/firmware/brcm

# Root filesystem
tar xvpf stage3-arm64*.tar.xz --numeric-owner --xattrs-include="*.*" -C $DEST

# Kernel & modules
sudo cp -v ${WORK}/firmware/boot/bcm2712-rpi-5-b.dtb ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/fixup_cd.dat ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/fixup.dat ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/start_cd.elf ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/start.elf ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/bootcode.bin ${DEST}/boot/
sudo cp -v ${WORK}/firmware/boot/kernel_2712.img ${DEST}/boot/
sudo cp -rv ${WORK}/firmware/boot/overlays ${DEST}/boot/
sudo cp -rv ${WORK}/firmware/modules ${DEST}/lib/

# Firmware
sudo mkdir -p $BRCM

sudo cp -v ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio-standard.bin $BRCM
sudo cp -v ${WORK}/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio.clm_blob $BRCM
sudo cp -v ${WORK}/firmware-nonfree/debian/config/brcm80211/brcm/brcmfmac43455-sdio.txt $BRCM
sudo ln -sv cyfmac43455-sdio-standard.bin $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.bin
sudo ln -sv cyfmac43455-sdio.clm_blob $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob
sudo ln -sv brcmfmac43455-sdio.txt $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.txt

sudo cp -v ${WORK}/bluez-firmware/debian/firmware/broadcom/BCM4345C0.hcd $BRCM
sudo ln -sv BCM4345C0.hcd $BRCM/BCM4345C0.raspberrypi,5-model-b.hcd

# Manually if you installing SystemD profile
#systemd-machine-id-setup --root=$DEST
#systemctl --root=$DEST preset-all          | System services
#systemctl --root=$DEST preset-all --global | User services

ls $DEST
ls -l $BRCM

