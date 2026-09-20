// SPDX-FileCopyrightText: 2026 Martin Fritzsche <mafri@mafri.org>
// SPDX-License-Identifier: 0BSD

/*
 * acnext-workbench-fix - work around the blank Workbench tab in AnycubicSlicerNext
 * on Linux/WebKitGTK.
 *
 * Problem
 * -------
 * The Workbench UI is a Vue SPA embedded in libWorkbench.so. The application
 * serves it through a private URI scheme registered with
 * webkit_web_context_register_uri_scheme():
 *
 *     pages://localhost/Workbench/index.html?time=...&md5=...#/...
 *
 * The scheme handler builds its response with webkit_uri_scheme_response_new()
 * and attaches a "Content-Type: text/html" header via
 * webkit_uri_scheme_response_set_http_headers(), but it never calls
 * webkit_uri_scheme_response_set_content_type(). WebKitGTK does not derive the
 * response MIME type from those headers, so it ends up guessing
 * "application/x-extension-html".
 *
 * As a result webkit_response_policy_decision_is_mime_type_supported() returns
 * FALSE, the wxWebView policy handler calls webkit_policy_decision_ignore(),
 * and the load aborts with "Frame load interrupted". index.html is fetched but
 * never parsed, so no sub-resource (js/app.js, js/chunk-vendors.js, CSS) is
 * ever requested and <div id="app"> stays empty - the tab renders blank white.
 *
 * Every other view is unaffected because they load over file:// or https://.
 *
 * Fix
 * ---
 * Interpose webkit_uri_scheme_request_finish_with_response() and set an explicit
 * content type derived from the request path before handing the response back to
 * WebKit. Only the "pages" scheme is touched; every other scheme, including the
 * application's "anycubic" API bridge, is passed through untouched.
 *
 * This is a workaround for the packaged binary. The proper fix belongs upstream:
 * the scheme handler should call webkit_uri_scheme_response_set_content_type().
 *
 * Build:
 *     gcc -shared -fPIC -O2 -o acnext-workbench-fix.so acnext-workbench-fix.c -ldl
 *
 * Use:
 *     LD_PRELOAD=/path/to/acnext-workbench-fix.so AnycubicSlicerNext
 *
 * Set ACNEXT_FIX_DEBUG=1 to log every content type applied.
 */

#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef void WebKitURISchemeRequest;
typedef void WebKitURISchemeResponse;

#define TAG "[acnext-workbench-fix] "
#define SCHEME "pages://"
#define SCHEME_LEN 8

static int debug_enabled(void)
{
    static int cached = -1;

    if (cached < 0) {
        const char *value = getenv("ACNEXT_FIX_DEBUG");
        cached = (value && *value && strcmp(value, "0") != 0) ? 1 : 0;
    }
    return cached;
}

static void *resolve(const char *name)
{
    void *addr = dlsym(RTLD_NEXT, name);

    if (!addr)
        fprintf(stderr, TAG "missing symbol: %s\n", name);
    return addr;
}

/* Derive a content type from the request path, ignoring query and fragment. */
static const char *content_type_for_uri(const char *uri)
{
    static const struct {
        const char *ext;
        size_t len;
        const char *type;
    } types[] = {
        { "html",  4, "text/html" },
        { "htm",   3, "text/html" },
        { "js",    2, "text/javascript" },
        { "mjs",   3, "text/javascript" },
        { "css",   3, "text/css" },
        { "json",  4, "application/json" },
        { "map",   3, "application/json" },
        { "svg",   3, "image/svg+xml" },
        { "png",   3, "image/png" },
        { "jpg",   3, "image/jpeg" },
        { "jpeg",  4, "image/jpeg" },
        { "gif",   3, "image/gif" },
        { "webp",  4, "image/webp" },
        { "ico",   3, "image/x-icon" },
        { "woff2", 5, "font/woff2" },
        { "woff",  4, "font/woff" },
        { "ttf",   3, "font/ttf" },
        { "otf",   3, "font/otf" },
        { "wasm",  4, "application/wasm" },
    };

    const char *path = uri + SCHEME_LEN;
    size_t path_len = strcspn(path, "?#");
    size_t ext_start = path_len;

    while (ext_start > 0 && path[ext_start - 1] != '.' && path[ext_start - 1] != '/')
        ext_start--;

    if (ext_start == 0 || path[ext_start - 1] != '.')
        return NULL;

    for (size_t i = 0; i < sizeof types / sizeof *types; i++) {
        if (path_len - ext_start == types[i].len &&
            strncasecmp(path + ext_start, types[i].ext, types[i].len) == 0)
            return types[i].type;
    }
    return NULL;
}

void webkit_uri_scheme_request_finish_with_response(WebKitURISchemeRequest *request,
                                                    WebKitURISchemeResponse *response)
{
    static void (*real_finish)(WebKitURISchemeRequest *, WebKitURISchemeResponse *);
    static void (*set_content_type)(WebKitURISchemeResponse *, const char *);
    static const char *(*get_uri)(WebKitURISchemeRequest *);
    static int resolved;

    if (!resolved) {
        real_finish = resolve("webkit_uri_scheme_request_finish_with_response");
        set_content_type = resolve("webkit_uri_scheme_response_set_content_type");
        get_uri = resolve("webkit_uri_scheme_request_get_uri");
        resolved = 1;
    }

    if (!real_finish)
        return;

    if (set_content_type && get_uri) {
        const char *uri = get_uri(request);

        if (uri && strncmp(uri, SCHEME, SCHEME_LEN) == 0) {
            const char *type = content_type_for_uri(uri);

            if (type) {
                set_content_type(response, type);
                if (debug_enabled())
                    fprintf(stderr, TAG "%s <- %.140s\n", type, uri);
            }
        }
    }

    real_finish(request, response);
}
