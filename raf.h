#ifndef __RAF_H__
#define __RAF_H__

#include <stdbool.h>
#include <stdio.h>

/**
 * Print raf to stdout
 *
 * true_color: whether to use true color (otherwise uses ANSI colors)
 */
void raf(bool true_color);

/**
 * Print raf to any file
 *
 * fp:         file to print to
 * true_color: whether to use true color (otherwise uses ANSI colors)
 */
void fraf(FILE *fp, bool true_color);

/**
 * Write raf to any file descriptor
 *
 * fd:         file descriptor to write to
 * true_color: whether to use true color (otherwise uses ANSI colors)
 *
 * Returns 0 if successful, or -1 (with errno set to the error) otherwise.
 */
int fdraf(int fd, bool true_color);

#endif
