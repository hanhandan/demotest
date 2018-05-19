include_directories(./)
AUX_SOURCE_DIRECTORY(./ SRC)
ADD_LIBRARY(libfileop STATIC ${SRC})

