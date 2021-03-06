cmake_minimum_required(VERSION 3.13)
project(stm32f429 C CXX ASM)

# Include an error in case the user forgets to specify ARM as a toolchain
if (NOT CMAKE_TOOLCHAIN_FILE)
    message(FATAL_ERROR "Cross compiling only. Please use -DCMAKE_TOOLCHAIN_FILE=cmake/arm-toolchain.cmake or use your own toolchain file")
endif ()

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build)

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -Os")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Os")

file(GLOB_RECURSE SOURCE_FILES
    "src/config/*.c"
    "src/main.c"
)

file(GLOB_RECURSE INC_FILES
    "src/config/*.h"
)

include_directories(
    src/config
)

include("cmake/spl.cmake")
include("cmake/stm32f429zit.cmake")

set(ELF_OUT "${PROJECT_NAME}_${CMAKE_BUILD_TYPE}.elf")
set(BIN_OUT "${PROJECT_NAME}_${CMAKE_BUILD_TYPE}.bin")

add_executable(${ELF_OUT} ${SOURCE_FILES} ${INC_FILES})
target_link_libraries(${ELF_OUT} SPL_LIB)

set_target_properties(${ELF_OUT} PROPERTIES LINK_FLAGS ${LINKER_FLAGS})
add_custom_target(
        ${BIN_OUT} ALL
        COMMAND ${ARM_OBJCOPY} -Obinary ${ELF_OUT} ${BIN_OUT}
        WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
        DEPENDS ${ELF_OUT}
)

add_custom_command(
        TARGET ${ELF_OUT}
        POST_BUILD
        COMMAND ${ARM_SIZE} ${ELF_OUT}
        WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
)