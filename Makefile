CC=clang
CFLAGS=-Wall -Wextra -Werror -Wpedantic -fPIC
PREFIX=/usr
VERSION=1.0

all: raf_test raf_test_shared libraf.so

raf_test: raf.o raf_test.o
	$(CC) raf.o raf_test.o -o raf_test

raf_test_shared: libraf.so raf_test_shared.o
	$(CC) -L. -lraf raf_test_shared.o -o raf_test_shared

libraf.so: raf.o
	$(CC) raf.o -shared -o libraf.so

%.o: %.c raf.h
	$(CC) $(CFLAGS) -c $<

raf.pc: raf.pc.m4
	m4 -D PREFIX=$(PREFIX) -D VERSION=$(VERSION) raf.pc.m4 > raf.pc

install: libraf.so raf.pc raf.h
	install -m 755 libraf.so $(PREFIX)/lib/libraf.so
	install -m 644 raf.pc $(PREFIX)/lib/pkgconfig/raf.pc
	install -m 644 raf.h $(PREFIX)/include/raf.h

uninstall:
	rm -f $(PREFIX)/lib/libraf.so $(PREFIX)/lib/pkgconfig/raf.pc $(PREFIX)/include/raf.h

test_shared: raf_test_shared
	LD_LIBRARY_PATH=. ./raf_test_shared

clean:
	rm -f raf_test raf_test_shared libraf.so raf.o raf_test.o raf_test_shared.o raf.pc

format:
	clang-format -i -style=file *.[ch]

.PHONY: all clean test_shared format install uninstall
