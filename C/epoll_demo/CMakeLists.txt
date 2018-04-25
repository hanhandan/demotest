include_directories(./)
AUX_SOURCE_DIRECTORY(./server SRV_SRC)
AUX_SOURCE_DIRECTORY(./client CLI_SRC)
#ADD_DEFINITIONS(-DHAVE_CONFIG_H -DHOST_CPU_STR=\"meson\" -DBUILD_CPU=x86_64 -DLIBDIR=\"/usr/lib\" -DOPKGLIBDIR=\"/usr/lib\" -DOPKGETCDIR=\"/etc\" -DOPKGLOCKFILE=\"/app/miner.xyipkmng.ipk/ipk_opkg.lock\" -DDATADIR=\"/usr/share\")

#ADD_LIBRARY(opkg_ipk STATIC ${SRC})
add_executable(epoll_server ${SRV_SRC})
add_executable(epoll_client ${CLI_SRC})
target_link_libraries(epoll_server ${SYS_LIBS})
target_link_libraries(epoll_client ${SYS_LIBS})

