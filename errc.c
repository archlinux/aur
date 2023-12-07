#include <stdlib.h>
#include <stdarg.h>
#include <err.h>

_Noreturn void errc(int eval, int status, const char *fmt, ...)
{
         va_list ap;
         va_start(ap, fmt);
         vwarnx(fmt, ap);
         va_end(ap);
         exit(eval);
}
