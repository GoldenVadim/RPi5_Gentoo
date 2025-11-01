echo ' * Copying boot files...'
cp $WORK/firmware/boot/bcm2712-rpi-5-b.dtb $DEST/boot/
cp $WORK/firmware/boot/kernel_2712.img $DEST/boot/
cp -r $WORK/firmware/boot/overlays $DEST/boot/
cp -r $WORK/firmware/modules/*-v8-16k+ $DEST/lib/
cp $WORK/firmware/extra/System_2712.map $DEST/boot

echo ' * Copying Wi-Fi & Bluetooth firmware...'
mkdir -p $BRCM
# Wi-Fi
cp $WORK/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio-standard.bin $BRCM
cp $WORK/firmware-nonfree/debian/config/brcm80211/cypress/cyfmac43455-sdio.clm_blob $BRCM
cp $WORK/firmware-nonfree/debian/config/brcm80211/brcm/brcmfmac43455-sdio.txt $BRCM
ln -s cyfmac43455-sdio-standard.bin $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.bin
ln -s cyfmac43455-sdio.clm_blob $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob
ln -s brcmfmac43455-sdio.txt $BRCM/brcmfmac43455-sdio.raspberrypi,5-model-b.txt
# Bluetooth
cp $WORK/bluez-firmware/debian/firmware/broadcom/BCM4345C0.hcd $BRCM
ln -s BCM4345C0.hcd $BRCM/BCM4345C0.raspberrypi,5-model-b.hcd
