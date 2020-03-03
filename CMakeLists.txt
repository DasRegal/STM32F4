cmake_minimum_required(VERSION 3.9)

# Use ARM-GCC for crosscompiling
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

project(stm32f429 C CXX ASM)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build)

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")

file(GLOB_RECURSE SOURCE_FILES
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

#if (LINKER_FLAGS)
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
#endif ()