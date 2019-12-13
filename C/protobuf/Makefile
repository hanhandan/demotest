CROSS_COMPILE=mips-linux-uclibc-
all:
#	g++ pserver.cpp test.pb.cc --std=c++11 -g -lpthread -lprotobuf -o srv
	$(CROSS_COMPILE)g++ pclient.cpp test.pb.cc  -g -lpthread  -I/media/vincent/job/github/hanhandan/protobuf-3.5.1/src -L./ --std=c++11 -lprotobuf -o cli
clean:
	rm -f srv cli
