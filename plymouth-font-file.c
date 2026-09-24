#include <glib.h>
#include <pango/pango.h>
#include <pango/pangoft2.h>
#include <fontconfig/fontconfig.h>

int main(int argc, char **argv)
{
    gboolean bold = FALSE;

    GOptionEntry options[] = {
        { "bold", 'b', 0, G_OPTION_ARG_NONE, &bold,
          "Use the bold font variant", NULL },
        { NULL }
    };

    GOptionContext *context = g_option_context_new("FONT");
    g_option_context_set_summary(
        context,
        "Find the font file matching a Pango font description."
    );
    g_option_context_add_main_entries(context, options, NULL);

    GError *error = NULL;
    if (!g_option_context_parse(context, &argc, &argv, &error)) {
        g_printerr("%s\n", error->message);
        g_error_free(error);
        g_option_context_free(context);
        return 1;
    }

    if (argc != 2) {
        gchar *help = g_option_context_get_help(context, TRUE, NULL);
        g_printerr("%s", help);
        g_free(help);
        g_option_context_free(context);
        return 1;
    }

    PangoFontMap *map = PANGO_FONT_MAP(pango_ft2_font_map_new());
    PangoContext *pango_context = pango_font_map_create_context(map);
    PangoFontDescription *desc = pango_font_description_from_string(argv[1]);

    if (bold)
        pango_font_description_set_weight(desc, PANGO_WEIGHT_BOLD);

    PangoFont *font = pango_context_load_font(pango_context, desc);
    int status = 1;

    if (font) {
        FcPattern *pattern = pango_fc_font_get_pattern(PANGO_FC_FONT(font));
        FcChar8 *file;

        if (FcPatternGetString(pattern, FC_FILE, 0, &file) == FcResultMatch) {
            g_print("%s\n", file);
            status = 0;
        }
    }

    g_clear_object(&font);
    pango_font_description_free(desc);
    g_object_unref(pango_context);
    g_object_unref(map);
    g_option_context_free(context);

    return status;
}

