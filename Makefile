all: examples

.PHONY : clean c-bridge check_mesos check_proto_headers
c-bridge:
	cd c-bridge; make all

OS=$(shell uname)
ifeq ($(OS),Darwin)
	LIB=/usr/local/lib/libmesos.dylib
else
	LIB=/usr/local/lib/libmesos.so
endif

check_mesos:
	@if [ ! -f $(LIB) ]; then \
  	echo "Error: Expecting $(LIB) in /usr/local/lib"; exit 2; \
	else true; fi
	@if [ ! -d /usr/local/include/mesos ]; then \
  	echo "Error: Expecting mesos headers in /usr/local/include/mesos"; exit 2; \
	else true; fi

check_proto_headers:
	@cd c-bridge;g++ test_headers.cpp 2> /dev/null; if [ $$? -ne 0 ]; then\
  	echo "Error: Expected installed protocol buffer"; exit 2; \
	else true; fi

examples: check_proto_headers check_mesos c-bridge
	go install github.com/burke/mesos-go/example_framework
	go install github.com/burke/mesos-go/example_executor

clean:
	@cd c-bridge; make clean
	go clean
