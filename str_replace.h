// Stub for str_replace.h that is transitively used by boinc includes but not
// shipped by boinc...
// Only the definition of safe_strcpy is used. We don't need an implementation.

size_t strlcpy(char *dst, const char *src, size_t siz);

#define safe_strcpy(x, y) strlcpy(x, y, sizeof(x))
