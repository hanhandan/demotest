
project(demo)
cmake_minimum_required(VERSION 2.8.7)

##设置应用变量
#get_filename_component(yunshang_source_dir "${PROJECT_SOURCE_DIR}/src" ABSOLUTE)

SET(RELEASE_MODE FALSE)

MESSAGE("${CMAKE_C_COMPILER}")
MESSAGE("${CMAKE_CXX_COMPILER}")
MESSAGE("${BUILD_NUM}")

set(LIBRARY_OUTPUT_PATH 	${PROJECT_BINARY_DIR}/lib)
set(EXECUTABLE_OUTPUT_PATH  ${PROJECT_SOURCE_DIR}/bin)

## 设置头文件路径
include_directories(${PROJECT_SOURCE_DIR}/include/common)
include_directories(${PROJECT_SOURCE_DIR}/include)

link_directories(${LIBRARY_OUTPUT_PATH})
link_directories(${PROJECT_SOURCE_DIR}/lib)

## 设置编译器release或者debug选项
IF ( ${BUILD_OS} MATCHES "XOS")
	IF(RELEASE_MODE)
		SET(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -Werror -Wreturn-type -s -O3 -Wno-unused  -fPIC ")
		SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wreturn-type -s -O3 -Wno-unused -fpermissive -fPIC")
	ELSE()
		SET(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}  -Wreturn-type -O0 -g -fstack-protector-all  -Wno-unused  -fPIC")
		SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  -Wreturn-type -O0 -g -fstack-protector-all  -Wno-unused -fpermissive -fPIC ")
	ENDIF()
ELSE()
	IF(RELEASE_MODE)
		SET(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -Werror -Wreturn-type -s -O3 -Wno-unused  -fPIC -Wl,--rpath=.")
		SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wreturn-type -s -O3 -Wno-unused -fpermissive -fPIC -Wl,--rpath=.")
	ELSE()
		SET(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}  -Wreturn-type -O0 -Wl,-Map=minerlive.map -g -fstack-protector-all  -Wno-unused  -fPIC -Wl,--rpath=.")
		SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  -Wreturn-type -O0 -Wl,-Map=minerlive.map -g -fstack-protector-all  -Wno-unused -fpermissive -fPIC -Wl,--rpath=.")
	ENDIF()
ENDIF()

## 设置编译选项

## 设置需要连接的库文件

SET(SYS_LIBS pthread dl m curl crypto json-c m)

#CONFIGURE_FILE(
#"version.h.in"
#"${PROJECT_SOURCE_DIR}/include/version.h"
#)
##设置需要编译的源码目录
add_subdirectory(epoll_demo)
