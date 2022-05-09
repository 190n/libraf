CC=clang
CFLAGS=-Wall -Wextra -Werror -Wpedantic -fPIC
PREFIX=/usr

LIBRARY=libraf.so
ifeq ($(shell uname -s), Darwin)
LIBRARY=libraf.dylib
endif

all: raf_test raf_test_shared $(LIBRARY) raf.pc

raf_test: raf.o raf_test.o
	$(CC) raf.o raf_test.o -o raf_test

raf_test_shared: $(LIBRARY) raf_test_shared.o
	$(CC) -L. -lraf raf_test_shared.o -o raf_test_shared

$(LIBRARY): raf.o
	$(CC) raf.o -shared -o $(LIBRARY)

%.o: %.c raf.h
	$(CC) $(CFLAGS) -c $<

raf.pc: raf.pc.m4
	m4 -D PREFIX=$(PREFIX) raf.pc.m4 > raf.pc

install: $(LIBRARY) raf.pc raf.h
	install -m 755 $(LIBRARY) $(PREFIX)/lib/$(LIBRARY)
	install -m 644 raf.pc $(PREFIX)/lib/pkgconfig/raf.pc
	install -m 644 raf.h $(PREFIX)/include/raf.h
	install -Dm 644 LICENSE $(PREFIX)/share/licenses/libraf/LICENSE

uninstall:
	rm -f $(PREFIX)/lib/$(LIBRARY) $(PREFIX)/lib/pkgconfig/raf.pc $(PREFIX)/include/raf.h

test_shared: raf_test_shared
	LD_LIBRARY_PATH=. ./raf_test_shared

clean:
	rm -f raf_test raf_test_shared $(LIBRARY) raf.o raf_test.o raf_test_shared.o raf.pc

format:
	clang-format -i -style=file *.[ch]

.PHONY: all clean test_shared format install uninstall
