set(COMMON_FLAGS "-mcpu=cortex-m4 -mthumb")
set(COMMON_FLAGS "${COMMON_FLAGS} -ffunction-sections -fdata-sections")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_FLAGS}")

set(LINKER_FILE "${CMAKE_CURRENT_SOURCE_DIR}/linker/STM32F429ZI.ld")
set(LINKER_FLAGS "${LINKER_FLAGS} -T${LINKER_FILE} ${DEVICE_DEFS} -lc -lnosys -Wl,--gc-sections")
