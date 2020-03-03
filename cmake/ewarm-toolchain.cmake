add_definitions(-DSTM32F10X_MD)

#set(CMAKE_SYSTEM_NAME Generic)

set(CPU_FLAGS "--cpu Cortex-M3")

set(EWARM_ROOT_DIR "C:/Program Files (x86)/IAR Systems/Embedded Workbench 8.3/arm")

set(CMAKE_C_COMPILER "${EWARM_ROOT_DIR}/bin/iccarm.exe" "${CPU_FLAGS} -e")
set(CMAKE_CXX_COMPILER "${EWARM_ROOT_DIR}/bin/iccarm.exe" "${CPU_FLAGS} --c++")
set(CMAKE_ASM_COMPILER "${EWARM_ROOT_DIR}/bin/iasmarm.exe" "${CPU_FLAGS} -r")

set(LINKER_SCRIPT "${EWARM_ROOT_DIR}/config/linker/ST/stm32f103xB.icf")
set(CMAKE_C_LINK_FLAGS "--semihosting --config ${LINKER_SCRIPT}")
set(CMAKE_CXX_LINK_FLAGS "--semihosting --config ${LINKER_SCRIPT}")
