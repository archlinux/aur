/* libhed configuration header file */

/* This is a libhed PUBLIC file.
 * This header file will be installed on the target system.
 * When you add new things here, make sure they start with hed_.
 */

#ifndef LIBHED__CONFIG_H
#define LIBHED__CONFIG_H

/* Define which features should be enabled in the library.
 * Comment/uncomment the defines as needed.
 */

/* Comment this out to compile without LFS (Large File Support) */
#define HED_CONFIG_LFS 1

/* Uncomment this if you want the EXPERIMENTAL mmap file backend */
/* #define HED_CONFIG_MMAP 1 */

/* Comment this out if you don't want to include readahead support */
#define HED_CONFIG_READAHEAD 1

/* Comment this out to remove swap file support */
#define HED_CONFIG_SWAP	1

/* Comment this out to use traditional read/write for swap files */
#define HED_CONFIG_SWAP_MMAP 1

#endif	/* LIBHED__CONFIG_H */
