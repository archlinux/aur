#define _GNU_SOURCE
#include <dlfcn.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
#include <glib.h>
#include <png.h>
#include <string.h>
#include <setjmp.h>

static GHashTable *pending_loaders = NULL;
static GHashTable *loader_buffers = NULL;

static void ensure_tables(void) {
    if (!pending_loaders) {
        pending_loaders = g_hash_table_new(g_direct_hash, g_direct_equal);
        loader_buffers = g_hash_table_new_full(g_direct_hash, g_direct_equal,
                                                NULL, (GDestroyNotify)g_byte_array_unref);
    }
}

typedef struct {
    const guchar *data;
    gsize offset;
    gsize length;
} PngMemRead;

static void png_mem_read_fn(png_structp png, png_bytep out, png_size_t count) {
    PngMemRead *rd = png_get_io_ptr(png);
    if (rd->offset + count > rd->length) {
        png_error(png, "read past end");
        return;
    }
    memcpy(out, rd->data + rd->offset, count);
    rd->offset += count;
}

static GdkPixbuf *decode_png_from_memory(const guchar *data, gsize length) {
    png_structp png = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    if (!png) return NULL;
    png_infop info = png_create_info_struct(png);
    if (!info) { png_destroy_read_struct(&png, NULL, NULL); return NULL; }

    if (setjmp(png_jmpbuf(png))) {
        png_destroy_read_struct(&png, &info, NULL);
        return NULL;
    }

    PngMemRead rd = { data, 0, length };
    png_set_read_fn(png, &rd, png_mem_read_fn);
    png_read_info(png, info);

    int w = png_get_image_width(png, info);
    int h = png_get_image_height(png, info);
    int ct = png_get_color_type(png, info);
    int bd = png_get_bit_depth(png, info);

    if (bd == 16) png_set_strip_16(png);
    if (ct == PNG_COLOR_TYPE_PALETTE) png_set_palette_to_rgb(png);
    if (ct == PNG_COLOR_TYPE_GRAY && bd < 8) { png_set_expand(png); png_set_gray_to_rgb(png); }
    if (ct == PNG_COLOR_TYPE_GRAY || ct == PNG_COLOR_TYPE_GRAY_ALPHA) png_set_gray_to_rgb(png);
    if (png_get_valid(png, info, PNG_INFO_tRNS)) png_set_tRNS_to_alpha(png);
    if (!(ct & PNG_COLOR_MASK_ALPHA) && !png_get_valid(png, info, PNG_INFO_tRNS))
        png_set_filler(png, 0xff, PNG_FILLER_AFTER);

    png_read_update_info(png, info);

    GdkPixbuf *pixbuf = gdk_pixbuf_new(GDK_COLORSPACE_RGB, TRUE, 8, w, h);
    if (!pixbuf) { png_destroy_read_struct(&png, &info, NULL); return NULL; }

    guchar *pixels = gdk_pixbuf_get_pixels(pixbuf);
    int stride = gdk_pixbuf_get_rowstride(pixbuf);
    png_bytep *rows = g_new(png_bytep, h);
    for (int i = 0; i < h; i++)
        rows[i] = pixels + i * stride;

    png_read_image(png, rows);
    g_free(rows);
    png_destroy_read_struct(&png, &info, NULL);
    return pixbuf;
}

GdkPixbufLoader* gdk_pixbuf_loader_new_with_type(const gchar *image_type, GError **error) {
    ensure_tables();
    GdkPixbufLoader* (*real_new)(const gchar*, GError**) =
        dlsym(RTLD_NEXT, "gdk_pixbuf_loader_new_with_type");
    GdkPixbufLoader *loader = real_new(image_type, error);
    if (!loader) {
        if (error && *error) { g_error_free(*error); *error = NULL; }
        loader = (GdkPixbufLoader*)g_object_new(gdk_pixbuf_loader_get_type(), NULL);
    }
    if (loader) {
        GByteArray *arr = g_byte_array_new();
        g_hash_table_insert(loader_buffers, loader, arr);
    }
    return loader;
}

gboolean gdk_pixbuf_loader_write(GdkPixbufLoader *loader, const guchar *buf, gsize count, GError **error) {
    ensure_tables();
    GByteArray *arr = g_hash_table_lookup(loader_buffers, loader);
    if (arr)
        g_byte_array_append(arr, buf, count);
    g_hash_table_insert(pending_loaders, loader, GINT_TO_POINTER(1));
    gboolean (*real_write)(GdkPixbufLoader*, const guchar*, gsize, GError**) =
        dlsym(RTLD_NEXT, "gdk_pixbuf_loader_write");
    gboolean r = real_write(loader, buf, count, error);
    if (!r && error && *error) { g_error_free(*error); *error = NULL; r = TRUE; }
    return r;
}

gboolean gdk_pixbuf_loader_close(GdkPixbufLoader *loader, GError **error) {
    ensure_tables();
    g_hash_table_remove(pending_loaders, loader);
    gboolean (*real_close)(GdkPixbufLoader*, GError**) =
        dlsym(RTLD_NEXT, "gdk_pixbuf_loader_close");
    gboolean r = real_close(loader, error);
    if (!r && error && *error) { g_error_free(*error); *error = NULL; r = TRUE; }
    g_hash_table_remove(loader_buffers, loader);
    return r;
}

GdkPixbuf* gdk_pixbuf_loader_get_pixbuf(GdkPixbufLoader *loader) {
    ensure_tables();
    if (g_hash_table_contains(pending_loaders, loader)) {
        gboolean (*real_close)(GdkPixbufLoader*, GError**) =
            dlsym(RTLD_NEXT, "gdk_pixbuf_loader_close");
        real_close(loader, NULL);
        g_hash_table_remove(pending_loaders, loader);
    }
    GdkPixbuf* (*real_get)(GdkPixbufLoader*) =
        dlsym(RTLD_NEXT, "gdk_pixbuf_loader_get_pixbuf");
    GdkPixbuf *result = real_get(loader);
    if (!result) {
        GByteArray *arr = g_hash_table_lookup(loader_buffers, loader);
        if (arr && arr->len > 0)
            result = decode_png_from_memory(arr->data, arr->len);
    }
    return result;
}
