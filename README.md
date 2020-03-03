STM32F429ZI
===========

## Build

```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="../cmake/arm-toolchain.cmake" -G "MinGW Makefiles" ../
make
```

Use EWARM toolchain for IAR:

```
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="../cmake/ewarm-toolchain.cmake" -G "MinGW Makefiles" ../
```