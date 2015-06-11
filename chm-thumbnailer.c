#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <chm_lib.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
#include <libxml/HTMLparser.h>
#include <libxml/SAX2.h>
#include <libxml/uri.h>
#include <libxml/xmlstring.h>

static inline unsigned int get_word(const unsigned char *buffer)
{
    return (unsigned int)(buffer[0] | (buffer[1] << 8));
}

static int get_content(struct chmFile *file, const char *path,
        unsigned char **buffer)
{
    struct chmUnitInfo ui;

    if (chm_resolve_object(file, path, &ui) == CHM_RESOLVE_FAILURE)
        return 0;
    if ((*buffer = (unsigned char *)malloc(ui.length)) == NULL)
        return 0;
    if (chm_retrieve_object(file, &ui, *buffer, 0, (long long)ui.length) !=
            (long long)ui.length)
    {
        free(*buffer);
        return 0;
    }

    return (int)ui.length;
}

static char *get_home_path(struct chmFile *file)
{
    unsigned char *buffer;
    unsigned int current, type, len, total;
    char *path = NULL;

    if ((total = (unsigned int)get_content(file, "/#SYSTEM", &buffer)) == 0)
        return NULL;
    for (current = 4; current < total; current += 4 + len)
    {
        type = get_word(buffer + current);
        len = get_word(buffer + current + 2);
        if (type == 2)
        {
            if (current + 4 + len <= total && (path = (char *)malloc(len + 1)))
            {
                path[0] = '/';
                memcpy(path + 1, buffer + current + 4, len);
            }
            break;
        }
    }

    free(buffer);
    return path;
}

static GdkPixbuf *get_image_from_data(unsigned char *buffer, int length)
{
    GInputStream *input;
    GdkPixbuf *image;

    input = g_memory_input_stream_new_from_data(buffer, length, NULL);
    image = gdk_pixbuf_new_from_stream(input, NULL, NULL);
    g_input_stream_close(input, NULL, NULL);

    return image;
}

static inline int round_div(const int x, const int y)
{
    return (x + y / 2) / y;
}

static GdkPixbuf *scale_image(GdkPixbuf *original, int size)
{
    int width, height;
    GdkInterpType type;

    width = gdk_pixbuf_get_width(original);
    height = gdk_pixbuf_get_height(original);
    if (width < height)
    {
        width = round_div(width * size, height);
        type = height <= size ? GDK_INTERP_TILES : GDK_INTERP_HYPER;
        height = size;
    }
    else
    {
        height = round_div(height * size, width);
        type = width <= size ? GDK_INTERP_TILES : GDK_INTERP_HYPER;
        width = size;
    }

    return gdk_pixbuf_scale_simple(original, width, height, type);
}

static const double lambda = 0.993;

struct inner_file
{
    struct chmFile *file;
    xmlChar *path;
    int size;
    double w;
    const xmlChar *current;
};

static int get_content_length(struct chmFile *file, const char *path)
{
    struct chmUnitInfo ui;

    if (chm_resolve_object(file, path, &ui) == CHM_RESOLVE_FAILURE)
        return 0;

    return (int)ui.length;
}

static void startelem(struct inner_file *fp, const xmlChar *name,
        const xmlChar **atts)
{
    double size;
    xmlChar *uri = NULL;

    if (!xmlStrcasecmp(name, (const xmlChar *)"img"))
    {
        while (*atts)
        {
            if (!xmlStrcasecmp(*atts, (const xmlChar *)"src"))
            {
                uri = xmlBuildURI(atts[1], fp->current);
                size = get_content_length(fp->file, (const char *)uri) * fp->w;
                fp->w *= lambda;
                if (size > fp->size)
                {
                    free(fp->path);
                    fp->path = uri;
                    fp->size = (int)size;
                }
                else
                    free(uri);
                break;
            }
            atts += 2;
        }
    }
}

static char *parse_home(struct chmFile *file, unsigned char *buffer,
        const char *current)
{
    struct inner_file fp = { .file = file, .path = NULL, .size = 0, .w = 1.0,
        .current = xmlURIEscapeStr((const xmlChar *)current, NULL) };
    htmlSAXHandler sax = { .startElement = (startElementSAXFunc)startelem };

    htmlSAXParseDoc(buffer, NULL, &sax, &fp);

    free((void *)fp.current);
    return (char *)fp.path;
}

int main(const int argc, const char *argv[])
{
    struct chmFile *file;
    char *homepath, *imagepath = NULL;
    unsigned char *buffer;
    int buffer_length, size;
    GdkPixbuf *image, *output;

    if (argc != 4 || (size = atoi(argv[3])) <= 0)
        exit(EXIT_FAILURE);

    g_type_init();
    if ((file = chm_open(argv[1])) == NULL)
        exit(EXIT_FAILURE);
    if ((homepath = get_home_path(file)) == NULL)
        exit(EXIT_FAILURE);
    if ((buffer_length = get_content(file, homepath, &buffer)) == 0)
        exit(EXIT_FAILURE);
    if ((image = get_image_from_data(buffer, buffer_length)) == NULL)
    {
        if ((imagepath = parse_home(file, buffer, homepath)) == NULL)
            exit(EXIT_FAILURE);
        free(buffer);
        if ((buffer_length = get_content(file, imagepath, &buffer)) == 0)
            exit(EXIT_FAILURE);
        if ((image = get_image_from_data(buffer, buffer_length)) == NULL)
            exit(EXIT_FAILURE);
    }

    output = scale_image(image, size);
    gdk_pixbuf_save(output, argv[2], "png", NULL, "compression", "9", NULL);

    chm_close(file);
    g_object_unref(image);
    g_object_unref(output);
    free(buffer);
    free(homepath);
    free(imagepath);

    return EXIT_SUCCESS;
}
