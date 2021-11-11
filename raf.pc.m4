prefix=PREFIX
libdir=${prefix}/lib
includedir=${prefix}/include

Name: libraf
Description: Library to print Raf
URL: https://github.com/190n/libraf
Version: VERSION
Libs: -L${libdir} -lraf
Cflags: -I${includedir}
