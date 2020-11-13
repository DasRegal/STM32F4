if (NOT SOURCE_FILES)
    message(FATAL_ERROR "Variable SOURCE_FILES must be defined before including spl.cmake")
endif ()
if (NOT INC_FILES)
    message(FATAL_ERROR "Variable INC_FILES must be defined before including spl.cmake")
endif ()

add_definitions(-DUSE_STDPERIPH_DRIVER)
add_definitions(-DSTM32F429_439xx)

set(SPL_PATH "../../common_lib/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/STM32F4xx_StdPeriph_Driver")
set(CMSIS_PATH "../../common_lib/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0/Libraries/CMSIS")

set(STARTUP_FILE "../CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc_ride7/startup_stm32f429_439xx.s")

file(GLOB_RECURSE SPL_SOURCE_FILES
    #"${SPL_PATH}/src/*.c"
    "${SPL_PATH}/src/misc.c"
    "${SPL_PATH}/src/stm32f4xx_gpio.c"
    "${SPL_PATH}/src/stm32f4xx_rcc.c"
    "${SPL_PATH}/src/stm32f4xx_tim.c"
    "${SPL_PATH}/src/stm32f4xx_usart.c"
)

file(GLOB_RECURSE SPL_INC_FILES 
    #"${SPL_PATH}/inc/*.h"
    "${SPL_PATH}/src/misc.h"
    "${SPL_PATH}/src/stm32f4xx_gpio.h"
    "${SPL_PATH}/src/stm32f4xx_rcc.h"
    "${SPL_PATH}/src/stm32f4xx_tim.h"
    "${SPL_PATH}/src/stm32f4xx_usart.h"
    "${CMSIS_PATH}/Device/ST/STM32F4xx/Include/*.h"
    "${CMSIS_PATH}/Include/core_cm4.h"
)

add_library(SPL_LIB ${SPL_SOURCE_FILES} ${SPL_INC_FILES})

include_directories(SYSTEM
        ${SPL_PATH}/inc
        ${CMSIS_PATH}/Include
        ${CMSIS_PATH}/Device/ST/STM32F4xx/Include
)

list(APPEND SOURCE_FILES "${SPL_PATH}/${STARTUP_FILE}")