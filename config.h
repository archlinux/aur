/* The configuration header file */
/* $Id$ */

#ifndef HED__CONFIG_H
#define HED__CONFIG_H

/*
 * 'Mercy!' cried Gandalf. 'If the giving of information is to be the cure of
 * your inquisitiveness, I shall spend all the rest of my days in answering
 * you. What more do you want to know?'
 *
 * 'The names of all the stars, and of all living things, and the whole history
 * of Middle-earth and Over-heaven and of the Sundering Seas,' laughed Pippin.
 */

#include <libhed/config.h>

/* Comment this out to remove color configuration */
#define CONFIG_CUSTOM_COLORS 1

/* Below, several macros are defined. Modify them according to your system. */

/* Comment out if your system does not have getopt_long(). */
#define HAVE_GETOPT_LONG

/* Comment out if your system does not have memrchr(). */
#define HAVE_MEMRCHR

/* The biggest integer type available on the system. */
#define BINT_TYPE long long

#ifdef HED_CONFIG_LFS
# define _FILE_OFFSET_BITS 64
#else
# define _FILE_OFFSET_BITS 32
#endif

#endif
