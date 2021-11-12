# libraf

This is a C library to print raf to the terminal.

## Usage

### `void raf(bool true_color)`


Print raf to `stdout`

- `true_color`: whether to use true color (otherwise uses ANSI colors)

### `void fraf(FILE *fp, bool true_color)`

Print raf to any file

- `fp`: file to print to
- `true_color`: whether to use true color (otherwise uses ANSI colors)

## Compiling

Running `make` or `make all` will build everything. There are also individual targets to build `libraf.so`, `raf.pc`, `raf_test`, and `raf_test_shared`.

## Installation

Run `make install` as root. The default prefix is `/usr`. You can select an alternative prefix with `make PREFIX=<prefix> install`
