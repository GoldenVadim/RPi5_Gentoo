## get sources (i know about submodules)
```sh
git clone --depth 1 --recurse-submodules https://github.com/GoldenVadim/RPi5_Gentoo
git clone --depth 1 https://github.com/raspberrypi/firmware RPi5_Gentoo/firmware
git clone --depth 1 https://github.com/RPi-Distro/firmware-nonfree RPi5_Gentoo/firmware-nonfree
git clone --depth 1 https://github.com/RPi-Distro/bluez-firmware RPi5_Gentoo/bluez-firmware
cd RPi5_Gentoo
```

## setup environment variables
```sh
$EDITOR SetupEnv.sh
. ./SetupEnv.sh
```

## install
```sh
./Mount.sh
./Install.sh
. ./UnsetEnv.sh
```
