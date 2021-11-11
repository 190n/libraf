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

#endif
