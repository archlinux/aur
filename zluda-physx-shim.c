/*
 * zluda-physx-shim.c -- LD_PRELOAD shim for running NVIDIA PhysX 5 GPU code on
 * ZLUDA (CUDA-on-AMD).  It papers over three gaps found in ZLUDA 7.preview.13:
 *
 *  1. cuMemcpy3DAsync returns CUDA_ERROR_NOT_SUPPORTED (801).  PhysX uses it for
 *     SDF texture uploads (PxgGeometryManager).  The synchronous cuMemcpy3D works,
 *     so we fall back to it after draining the stream.
 *  2. cuMemcpyPeerAsync returns 801.  For same-context copies we fall back to
 *     cuMemcpyDtoDAsync.
 *  3. ZLUDA's PTX compiler silently drops every kernel that contains a
 *     `red.<space>.add.f32` reduction (cuModuleLoadDataEx still returns 0, but
 *     cuModuleGetFunction then fails with CUDA_ERROR_NOT_FOUND).  nvcc emits
 *     `red` instead of `atom` whenever the result of atomicAdd(float) is unused.
 *     The equivalent `atom...add.f32 %dummy, [..], val;` compiles fine, so we
 *     rewrite the PTX text on the fly before handing it to ZLUDA.  Modules without
 *     the pattern are passed through untouched.  (Kernels that use indirect calls
 *     through function pointers -- PhysX's ConvexCore and particle collision
 *     modules -- cannot be rescued this way; ZLUDA has no support for them.)
 *
 * The shim only calls the next libcuda in the chain (dlsym RTLD_NEXT), so it is
 * inert on a real NVIDIA driver (the originals succeed, no fallback is taken,
 * and a real driver happily accepts the atom form too).
 *
 * Build:  gcc -O2 -shared -fPIC -o libzluda-physx-shim.so zluda-physx-shim.c -ldl
 * Debug:  PHYSX_SHIM_DEBUG=1 logs every fallback / rewrite.
 *         PHYSX_SHIM_DUMP=<dir> additionally writes every PTX module it saw there.
 */
#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <stdint.h>

typedef int CUresult;
typedef void* CUstream;
typedef void* CUcontext;
typedef void* CUmodule;
typedef unsigned long long CUdeviceptr;
typedef struct CUDA_MEMCPY3D_st CUDA_MEMCPY3D;
#define CUDA_SUCCESS 0
#define CUDA_ERROR_NOT_SUPPORTED 801

static int dbg(void) { static int v = -1; if (v < 0) v = getenv("PHYSX_SHIM_DEBUG") != NULL; return v; }

static void* real(const char* name)
{
    void* p = dlsym(RTLD_NEXT, name);
    if (!p && dbg()) fprintf(stderr, "[physx-shim] %s not found in next object\n", name);
    return p;
}

/* ---- 1. cuMemcpy3DAsync -> cuMemcpy3D (synchronous) --------------------------- */
static CUresult memcpy3d_async_impl(const char* sym, const CUDA_MEMCPY3D* p, CUstream s)
{
    typedef CUresult (*fn_async)(const CUDA_MEMCPY3D*, CUstream);
    typedef CUresult (*fn_sync)(const CUDA_MEMCPY3D*);
    typedef CUresult (*fn_ssync)(CUstream);
    static fn_async orig = NULL; static fn_sync sync = NULL; static fn_ssync ssync = NULL;
    if (!orig) orig = (fn_async)real(sym);
    CUresult r = orig ? orig(p, s) : CUDA_ERROR_NOT_SUPPORTED;
    if (r != CUDA_ERROR_NOT_SUPPORTED) return r;
    if (!sync) sync = (fn_sync)real("cuMemcpy3D_v2");
    if (!sync) sync = (fn_sync)real("cuMemcpy3D");
    if (!sync) return r;
    if (!ssync) ssync = (fn_ssync)real("cuStreamSynchronize");
    if (ssync) ssync(s);               /* keep stream ordering */
    r = sync(p);
    if (dbg()) fprintf(stderr, "[physx-shim] %s -> cuMemcpy3D fallback, rc=%d\n", sym, r);
    return r;
}
CUresult cuMemcpy3DAsync_v2(const CUDA_MEMCPY3D* p, CUstream s)      { return memcpy3d_async_impl("cuMemcpy3DAsync_v2", p, s); }
CUresult cuMemcpy3DAsync_v2_ptsz(const CUDA_MEMCPY3D* p, CUstream s) { return memcpy3d_async_impl("cuMemcpy3DAsync_v2_ptsz", p, s); }
CUresult cuMemcpy3DAsync(const CUDA_MEMCPY3D* p, CUstream s)         { return memcpy3d_async_impl("cuMemcpy3DAsync", p, s); }

/* ---- 2. cuMemcpyPeerAsync -> cuMemcpyDtoDAsync (same context only) ------------- */
static CUresult peer_async_impl(const char* sym, CUdeviceptr dst, CUcontext dctx, CUdeviceptr src, CUcontext sctx, size_t n, CUstream s)
{
    typedef CUresult (*fn_peer)(CUdeviceptr, CUcontext, CUdeviceptr, CUcontext, size_t, CUstream);
    typedef CUresult (*fn_dtod)(CUdeviceptr, CUdeviceptr, size_t, CUstream);
    static fn_peer orig = NULL; static fn_dtod dtod = NULL;
    if (!orig) orig = (fn_peer)real(sym);
    CUresult r = orig ? orig(dst, dctx, src, sctx, n, s) : CUDA_ERROR_NOT_SUPPORTED;
    if (r != CUDA_ERROR_NOT_SUPPORTED) return r;
    if (dctx != sctx) { if (dbg()) fprintf(stderr, "[physx-shim] %s cross-context, cannot emulate\n", sym); return r; }
    if (!dtod) dtod = (fn_dtod)real("cuMemcpyDtoDAsync_v2");
    if (!dtod) dtod = (fn_dtod)real("cuMemcpyDtoDAsync");
    if (!dtod) return r;
    r = dtod(dst, src, n, s);
    if (dbg()) fprintf(stderr, "[physx-shim] %s -> cuMemcpyDtoDAsync fallback, rc=%d\n", sym, r);
    return r;
}
CUresult cuMemcpyPeerAsync(CUdeviceptr d, CUcontext dc, CUdeviceptr s, CUcontext sc, size_t n, CUstream st)      { return peer_async_impl("cuMemcpyPeerAsync", d, dc, s, sc, n, st); }
CUresult cuMemcpyPeerAsync_ptsz(CUdeviceptr d, CUcontext dc, CUdeviceptr s, CUcontext sc, size_t n, CUstream st) { return peer_async_impl("cuMemcpyPeerAsync_ptsz", d, dc, s, sc, n, st); }

/* ---- 3. PTX rewrite: red.*.add.f32 -> atom.*.add.f32 %zlred, ... --------------- */

/* Locate the PTX text inside a module image.  Returns pointer to the text and its
 * length (not counting the terminating NUL), or NULL if this is not something we
 * understand (compressed fatbin, cubin, ...). */
static const char* find_ptx(const void* image, size_t* len)
{
    const unsigned char* b = (const unsigned char*)image;
    const char* start = NULL; size_t limit;
    if (b[0] == 0x50 && b[1] == 0xED && b[2] == 0x55 && b[3] == 0xBA)      /* fatbin container */
    {
        uint64_t fatSize; memcpy(&fatSize, b + 8, 8);
        uint16_t hdr; memcpy(&hdr, b + 6, 2);
        limit = (size_t)hdr + (size_t)fatSize;
        if (limit > (256u << 20)) return NULL;
        const char* p = (const char*)b + hdr; const char* end = (const char*)b + limit;
        /* the PTX payload starts with nvcc's comment banner or the .version directive */
        for (; p + 9 < end; p++)
            if ((p[0] == '/' && p[1] == '/' && p[2] == '\n' && p[3] == '/' && p[4] == '/') || !memcmp(p, ".version ", 9)) { start = p; break; }
        if (!start) return NULL;
        /* 0x7f ELF anywhere before the text would mean a cubin we must not touch -- our
         * builds are PTX-only, but be safe: refuse if an ELF entry precedes the PTX */
        for (p = (const char*)b + hdr; p + 4 < start; p++) if (p[0] == 0x7f && p[1] == 'E' && p[2] == 'L' && p[3] == 'F') return NULL;
        size_t n = strnlen(start, (size_t)(end - start));
        *len = n; return start;
    }
    {   /* bare PTX text (possibly with leading blank lines / comments) */
        const char* p = (const char*)b; size_t i;
        for (i = 0; i < 64 && (p[i] == '\n' || p[i] == '\r' || p[i] == ' ' || p[i] == '\t'); i++) ;
        if (!memcmp(p + i, "//", 2) || !memcmp(p + i, ".version", 8)) { *len = strlen(p); return p; }
    }
    return NULL;
}

/* Is this line a `red....f32` reduction?  (leading whitespace / predicate allowed) */
static const char* red_opcode(const char* line, const char* lineEnd)
{
    const char* p = line;
    while (p < lineEnd && (*p == ' ' || *p == '\t')) p++;
    if (p < lineEnd && *p == '@') { while (p < lineEnd && *p != ' ' && *p != '\t') p++; while (p < lineEnd && (*p == ' ' || *p == '\t')) p++; }
    if (lineEnd - p < 5 || memcmp(p, "red.", 4)) return NULL;
    const char* q = p; while (q < lineEnd && *q != ' ' && *q != '\t') q++;      /* opcode token */
    if (q - p >= 4 && !memcmp(q - 4, ".f32", 4)) return p;
    return NULL;
}

static char* rewrite_ptx(const char* src, size_t len, int* nrew)
{
    if (!memmem(src, len, "red.", 4)) return NULL;
    /* quick reject: no f32 reductions at all */
    int any = 0; const char* l = src; const char* end = src + len;
    while (l < end) { const char* nl = memchr(l, '\n', (size_t)(end - l)); if (!nl) nl = end; if (red_opcode(l, nl)) { any = 1; break; } l = nl + 1; }
    if (!any) return NULL;

    size_t cap = len + len / 4 + 4096; char* out = (char*)malloc(cap); size_t o = 0;
    long bracePos = -1;        /* output offset just after the function-body "{" line */
    int depth = 0, declared = 0; *nrew = 0;
    l = src;
    while (l < end)
    {
        const char* nl = memchr(l, '\n', (size_t)(end - l)); if (!nl) nl = end;
        size_t ll = (size_t)(nl - l);
        if (o + ll + 64 > cap) { cap = cap * 2 + ll + 64; out = (char*)realloc(out, cap); }
        const char* trimmed = l; while (trimmed < nl && (*trimmed == ' ' || *trimmed == '\t')) trimmed++;
        if (depth == 0 && nl - trimmed == 1 && *trimmed == '{')
        {   /* function body opener */
            memcpy(out + o, l, ll); o += ll; out[o++] = '\n';
            bracePos = (long)o; declared = 0; depth = 1; l = nl + 1; continue;
        }
        const char* op = red_opcode(l, nl);
        if (op && depth > 0)
        {
            if (!declared && bracePos >= 0)
            {
                static const char decl[] = "\t.reg .f32 \t%zlred;\n";
                memmove(out + bracePos + sizeof(decl) - 1, out + bracePos, o - (size_t)bracePos);
                memcpy(out + bracePos, decl, sizeof(decl) - 1); o += sizeof(decl) - 1; declared = 1;
            }
            /* "<ws>[@p ]red.X.f32<ws>[addr], val;"  ->  "<ws>[@p ]atom.X.f32 %zlred, [addr], val;" */
            memcpy(out + o, l, (size_t)(op - l)); o += (size_t)(op - l);
            const char* q = op; while (q < nl && *q != ' ' && *q != '\t') q++;
            memcpy(out + o, "atom.", 5); o += 5; memcpy(out + o, op + 4, (size_t)(q - op - 4)); o += (size_t)(q - op - 4);
            memcpy(out + o, " %zlred, ", 9); o += 9;
            while (q < nl && (*q == ' ' || *q == '\t')) q++;
            memcpy(out + o, q, (size_t)(nl - q)); o += (size_t)(nl - q);
            out[o++] = '\n'; (*nrew)++;
        }
        else
        {
            memcpy(out + o, l, ll); o += ll; out[o++] = '\n';
        }
        /* track nesting (PTX puts block braces on their own lines) */
        for (const char* c = l; c < nl; c++) { if (*c == '{') depth++; else if (*c == '}') depth--; }
        if (depth < 0) depth = 0;
        l = nl + 1;
    }
    out[o] = 0;
    return out;
}

static void dump_ptx(const char* text, size_t len, int rewritten)
{
    const char* dir = getenv("PHYSX_SHIM_DUMP"); if (!dir) return;
    static int n = 0; char path[4096];
    snprintf(path, sizeof path, "%s/module_%03d%s.ptx", dir, n++, rewritten ? ".rewritten" : "");
    FILE* f = fopen(path, "wb"); if (f) { fwrite(text, 1, len, f); fclose(f); }
}

static CUresult module_load_impl(const char* sym, CUmodule* module, const void* image, unsigned int numOptions, void* options, void** optionValues)
{
    typedef CUresult (*fn_ex)(CUmodule*, const void*, unsigned int, void*, void**);
    typedef CUresult (*fn_plain)(CUmodule*, const void*);
    static fn_ex origEx = NULL; static fn_plain origPlain = NULL;
    if (!origEx) origEx = (fn_ex)real("cuModuleLoadDataEx");
    if (!origPlain) origPlain = (fn_plain)real("cuModuleLoadData");
    size_t len = 0; const char* ptx = image ? find_ptx(image, &len) : NULL;
    char* rewritten = NULL; int nrew = 0;
    if (ptx && !getenv("PHYSX_SHIM_NO_REWRITE")) rewritten = rewrite_ptx(ptx, len, &nrew);
    if (ptx) dump_ptx(rewritten ? rewritten : ptx, rewritten ? strlen(rewritten) : len, rewritten != NULL);
    const void* img = rewritten ? (const void*)rewritten : image;
    CUresult r;
    if (!strcmp(sym, "cuModuleLoadData") && origPlain) r = origPlain(module, img);
    else r = origEx ? origEx(module, img, numOptions, options, optionValues) : CUDA_ERROR_NOT_SUPPORTED;
    if (dbg() && rewritten) fprintf(stderr, "[physx-shim] %s: rewrote %d red.*.f32 -> atom (%zu bytes PTX), rc=%d\n", sym, nrew, len, r);
    free(rewritten);
    return r;
}
CUresult cuModuleLoadDataEx(CUmodule* m, const void* image, unsigned int n, void* opts, void** vals) { return module_load_impl("cuModuleLoadDataEx", m, image, n, opts, vals); }
CUresult cuModuleLoadData(CUmodule* m, const void* image)                                          { return module_load_impl("cuModuleLoadData", m, image, 0, NULL, NULL); }
