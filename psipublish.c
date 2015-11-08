#include "deadbeef.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

DB_functions_t *deadbeef;
DB_misc_t plugin;
char tunefilepath[100];
int isplayed;

void updatetune(const char *title, const char *artist, const char *album, int length)
{
    FILE *tunefile;
    tunefile = fopen(tunefilepath, "w");
    if (tunefile) {
        fprintf(tunefile, "%s%s%s\n%s\n%s\n%s\n%d\n", title, deadbeef->conf_get_int("psipublish.showplayer", 0) ? " [DeaDBeeF]" : "", isplayed ? "" : " [PAUSED]", artist, album, title, length);
        fclose(tunefile); 
    }
}

static int psipublish_songstarted(ddb_event_track_t *ev) {
    if (deadbeef->conf_get_int("psipublish.enable", 0)) {
        DB_playItem_t *track = ev->track;
        if (track) {
            isplayed = 1;
            updatetune(deadbeef->pl_find_meta(track, "title"), deadbeef->pl_find_meta(track, "artist"), deadbeef->pl_find_meta(track, "album"), deadbeef->pl_get_item_duration(track));
        }
    }
    return 0;
}

static int psipublish_songfinished(ddb_event_track_t *ev) {
    remove(tunefilepath);
    return 0;
}


static int psipublish_paused() {
    if (deadbeef->conf_get_int("psipublish.enable", 0)) {
        DB_playItem_t *track = deadbeef->streamer_get_playing_track();
        if (track) {
            isplayed = deadbeef->get_output()->state() == OUTPUT_STATE_PLAYING;
            updatetune(deadbeef->pl_find_meta(track, "title"), deadbeef->pl_find_meta(track, "artist"), deadbeef->pl_find_meta(track, "album"), deadbeef->pl_get_item_duration(track));
            deadbeef->pl_item_unref(track);
        }
    }
    return 0; 
}

static int psipublish_pluginmessage(uint32_t id, uintptr_t ctx, uint32_t p1, uint32_t p2) {
    switch (id) {
    case DB_EV_SONGSTARTED:
        psipublish_songstarted((ddb_event_track_t *)ctx);
        break;
    case DB_EV_SONGFINISHED:
        psipublish_songfinished((ddb_event_track_t *)ctx);
        break;
    case DB_EV_PAUSED:
        psipublish_paused();
        break;
    }
    return 0;
}

int psipublish_pluginstart(void) {
    sprintf(tunefilepath, "%s/.cache/psi+/tune", getenv("HOME"));
    return 0;
}

int psipublish_pluginstop (void) {
    remove(tunefilepath);
    return 0;
}

static const char settings_dlg[] =
    "property \"Enable publishing\" checkbox psipublish.enable 0;\n"
    "property \"Show player\" checkbox psipublish.showplayer 0;\n"
;

DB_misc_t plugin = {
    DB_PLUGIN_SET_API_VERSION
    .plugin.type = DB_PLUGIN_MISC,
    .plugin.version_major = 1,
    .plugin.version_minor = 3,
    .plugin.id = "psipublish",
    .plugin.name = "Psi IM Publish Tune",
    .plugin.descr = "Now playing for Psi IM",
    .plugin.website = "",
    .plugin.start = psipublish_pluginstart,
    .plugin.stop = psipublish_pluginstop,
    .plugin.message = psipublish_pluginmessage,
    .plugin.configdialog = settings_dlg
};

DB_plugin_t *
psipublish_load(DB_functions_t *ddb) {
    deadbeef = ddb;
    return &plugin.plugin;
}
