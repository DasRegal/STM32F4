set(CMAKE_C_STANDARD_REQUIRED YES)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

set(COMMON_WARN_FLAGS "-pedantic -Wall -Wextra\
    -Wdisabled-optimization -Wdouble-promotion -Wduplicated-cond -Wfloat-equal\
    -Winit-self -Winline -Winvalid-pch -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs\
    -Wmissing-format-attribute -Wno-unused -Wnull-dereference -Wodr -Wpointer-arith -Wredundant-decls -Wshadow\
    -Wstrict-overflow=5 -Wwrite-strings -Wuninitialized\
    -Wunreachable-code")

set(C_WARN_FLAGS "${COMMON_WARN_FLAGS} -Wbad-function-cast -Wmissing-prototypes -Wold-style-definition\
    -Wstrict-prototypes")
set(CXX_WARN_FLAGS "${COMMON_WARN_FLAGS} -Wctor-dtor-privacy -Wnoexcept -Wold-style-cast -Woverloaded-virtual\
    -Wsign-promo -Wstrict-null-sentinel -Wuseless-cast -Wzero-as-null-pointer-constant")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${C_WARN_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX_WARN_FLAGS}")
