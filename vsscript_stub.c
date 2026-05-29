/*
 * VapourSynth scripting API stub for BestClient
 * DDNet never uses VapourSynth; these stubs satisfy BIND_NOW symbol resolution
 * in libavformat.so.60 which was compiled with -lvapoursynth-script.
 */
void* vsscript_init(void)                                                   { return (void*)1; }
void  vsscript_finalize(void)                                               {}
void* vsscript_createScript(void *api)                                      { return 0; }
int   vsscript_evaluateScript(void **h, const char *s, const char *f, int fl) { return 1; }
const char* vsscript_getError(void *h)                                      { return 0; }
void* vsscript_getOutput(void *h, int i)                                    { return 0; }
void  vsscript_freeScript(void *h)                                          {}
void* vsscript_getCore(void *h)                                             { return 0; }
const void* vsscript_getVSApi(int v)                                        { return 0; }
