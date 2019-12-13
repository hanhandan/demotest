include_directories(./)
AUX_SOURCE_DIRECTORY(./ SRC)
add_executable(curl_client ${SRC})
target_link_libraries(curl_client curl)
