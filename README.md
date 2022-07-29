STM32F429ZI
===========

## Folder structure

```
.
├── cmake/
├── linker/
└── src/
    ├── config/
    └── main.c
```

## Prepare system

``` sh
sudo apt-get install libnewlib-arm-none-eabi

```

## Build for Windows

```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="../cmake/arm-toolchain.cmake" -G "MinGW Makefiles" ../
make
```
