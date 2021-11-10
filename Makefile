CC=clang
CFLAGS=-Wall -Wextra -Werror -Wpedantic -fPIC

all: raf_test raf_test_shared libraf.so

raf_test: raf.o raf_test.o
	$(CC) raf.o raf_test.o -o raf_test

raf_test_shared: libraf.so raf_test_shared.o
	$(CC) -L. -lraf raf_test_shared.o -o raf_test_shared

libraf.so: raf.o
	$(CC) raf.o -shared -o libraf.so

%.o: %.c raf.h
	$(CC) $(CFLAGS) -c $<

test_shared: raf_test_shared
	LD_LIBRARY_PATH=. ./raf_test_shared

clean:
	rm -f raf_test raf_test_shared libraf.so raf.o raf_test.o raf_test_shared.o

format:
	clang-format -i -style=file *.[ch]

.PHONY: all clean test_shared format
