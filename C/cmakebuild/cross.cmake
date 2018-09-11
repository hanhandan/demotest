SET(CMAKE_C_COMPILER $ENV{CROSS_COMPILE}gcc)
SET(CMAKE_CXX_COMPILER $ENV{CROSS_COMPILE}g++)
SET(CMAKE_AR $ENV{CROSS_COMPILE}ar)
SET(CMAKE_LD $ENV{CROSS_COMPILE}ld)
SET(CMAKE_RANLIB $ENV{CROSS_COMPILE}ranlib)
SET(CMAKE_STRIP $ENV{CROSS_COMPILE}strip)
# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(BUILD_STATIC_LIB TRUE)
SET(CROSS_COMPILE TRUE)
link_directories($ENV{TOOLCHAIN_ROOT}/usr/lib)