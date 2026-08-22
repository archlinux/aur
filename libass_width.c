/*
 * libass_width.c
 *
 * A module exposing:
 *
 *     double libass_get_width(const char *fontname, int fontsize, const char *text)
 *
 * which measures the rendered width of `text` with the given font and
 * size. Returns 0 for empty text, the width for measurable text, and -1
 * if no width could be measured.
 *
 * Width is measured with the libass metrics API (ass_get_metrics) rather
 * than by rasterizing subtitles and scanning the resulting bitmaps. The
 * returned value is the logical layout width, i.e. the sum of the per-run
 * advances, which correctly accounts for spaces and kerning.
 *
 * libass is statically linked into this module so that it carries its own
 * metrics-enabled build; every other dependency (harfbuzz, fribidi,
 * fontconfig, freetype, libpng, libunibreak) is linked dynamically.
 */

#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "ass.h"
#include "ass_metrics.h"

static const char *ass_template =
"[Script Info]\n"
"Title: Karaoke Subtitle\n"
"ScriptType: v4.00+\n"
"WrapStyle: 0\n"
"ScaledBorderAndShadow: yes\n"
"YCbCr Matrix: None\n"
"PlayResX: 1920\n"
"PlayResY: 1080\n"
"[V4+ Styles]\n"
"Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding\n"
"Style: K1,%s,%d,&H00FFFFFF,&H000000FF,&H00000000,&H00000000,0,0,0,0,100,100,0,0,1,2,2,1,64,64,240,1\n"
"[Events]\n"
"Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text\n"
"Dialogue: 0,0:00:00.00,0:00:07.02,K1,,0,0,0,,%s\n";

static void msg_callback(int level, const char *fmt, va_list va, void *data)
{
    (void) level; (void) fmt; (void) va; (void) data;
}

static ASS_Library *ass_library = NULL;
static ASS_Renderer *ass_renderer = NULL;

double libass_get_width(const char *fontname, int fontsize, const char *text)
{
    if (!text || !text[0])
        return 0.0;

    if (!ass_library) {
        ass_library = ass_library_init();
        ass_set_message_cb(ass_library, msg_callback, NULL);
        ass_renderer = ass_renderer_init(ass_library);
        ass_set_frame_size(ass_renderer, 1920, 1080);
        ass_set_fonts(ass_renderer, NULL, "sans-serif", 1, NULL, 1);
    }

    char buf[1024];
    snprintf(buf, sizeof(buf), ass_template, fontname, fontsize, text);
    ASS_Track *track = ass_read_memory(ass_library, buf, strlen(buf), "UTF8");
    if (!track)
        return -1.0;

    /*
     * Obtain layout metrics instead of rendering bitmaps. The returned
     * metrics are only valid until the next rendering/metrics call on this
     * renderer, so they must be consumed before ass_free_track() below.
     */
    ASS_Metrics *metrics = ass_get_metrics(ass_renderer, track, 0);
    if (!metrics) {
        ass_free_track(track);
        return -1.0;
    }

    /* Sum the per-run advances to obtain the logical layout width. */
    double total = 0.0;
    int has_runs = 0;
    for (ASS_Metrics *ev = metrics; ev; ev = ev->next) {
        for (ASS_RunMetrics *run = ev->runs; run; run = run->next) {
            total += run->advance.x;
            has_runs = 1;
        }
    }

    ass_free_track(track);
    if (!has_runs || total <= 0)
        return -1.0;
    return total;
}