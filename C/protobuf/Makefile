all:
	g++ pserver.cpp test.pb.cc --std=c++11 -g -lpthread -lprotobuf -o srv
	g++ pclient.cpp test.pb.cc --std=c++11 -g -lpthread  -lprotobuf -o cli
clean:
	rm -f srv cli
