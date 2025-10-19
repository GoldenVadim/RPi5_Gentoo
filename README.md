## get sources
```sh
git clone --depth 1 --recurse-submodules https://github.com/GoldenVadim/RPi5_Gentoo.git
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
