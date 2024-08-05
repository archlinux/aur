// forgiving_utf8.h
#ifndef FORGIVING_UTF8_H
#define FORGIVING_UTF8_H

#include <cstddef> // For size_t

#ifdef __cplusplus
extern "C" {
#endif

// Function prototype
size_t utf8_to_latin9(char *output, const char *input, size_t length);

#ifdef __cplusplus
}
#endif

#endif // FORGIVING_UTF8_H
