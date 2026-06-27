#define _GNU_SOURCE
#include <dlfcn.h>

static void *real_symbol(const char *name) {
    void *sym = dlsym(RTLD_NEXT, name);
    return sym ? sym : dlsym(RTLD_DEFAULT, name);
}

double sin(double x) {
    static double (*real_sin)(double);
    if (!real_sin)
        real_sin = real_symbol("sin");
    return real_sin ? real_sin(x) : 0.0;
}

void sincos(double x, double *s, double *c) {
    static void (*real_sincos)(double, double *, double *);
    if (!real_sincos)
        real_sincos = real_symbol("sincos");
    if (real_sincos) {
        real_sincos(x, s, c);
    }
    else {
        if (s)
            *s = 0.0;
        if (c)
            *c = 1.0;
    }
}

float expf(float x) {
    static float (*real_expf)(float);
    if (!real_expf)
        real_expf = real_symbol("expf");
    return real_expf ? real_expf(x) : 1.0f;
}

float cosf(float x) {
    static float (*real_cosf)(float);
    if (!real_cosf)
        real_cosf = real_symbol("cosf");
    return real_cosf ? real_cosf(x) : 1.0f;
}

float sinf(float x) {
    static float (*real_sinf)(float);
    if (!real_sinf)
        real_sinf = real_symbol("sinf");
    return real_sinf ? real_sinf(x) : 0.0f;
}

float fmodf(float x, float y) {
    static float (*real_fmodf)(float, float);
    if (!real_fmodf)
        real_fmodf = real_symbol("fmodf");
    return real_fmodf ? real_fmodf(x, y) : 0.0f;
}

float asinf(float x) {
    static float (*real_asinf)(float);
    if (!real_asinf)
        real_asinf = real_symbol("asinf");
    return real_asinf ? real_asinf(x) : 0.0f;
}
