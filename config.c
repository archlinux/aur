#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>


typedef struct {
    size_t ram_mb;
} EditorConfig;


static EditorConfig default_config = {
    .ram_mb = 1024, //
};

static const char CONFIG_FILE[] = "editor_config.bin";

void load_config(EditorConfig *config) {
    if (!config) return;

    FILE *f = fopen(CONFIG_FILE, "rb");
    if (!f) {
        memcpy(config, &default_config, sizeof(EditorConfig));
        return;
    }

    size_t read = fread(config, 1, sizeof(EditorConfig), f);
    fclose(f);

    if (read != sizeof(EditorConfig)) {
        memcpy(config, &default_config, sizeof(EditorConfig));
    }
}

void save_config(const EditorConfig *config) {
    if (!config) return;

    FILE *f = fopen(CONFIG_FILE, "wb");
    if (!f) return;

    fwrite(config, 1, sizeof(EditorConfig), f);
    fclose(f);
}

/* Derive simple memory allocations from RAM setting.
   buffer_kb and swap_mb are outputs computed from ram_mb. */
void apply_memory_settings(const EditorConfig *cfg, size_t *buffer_kb, size_t *swap_mb) {
    if (!cfg || !buffer_kb || !swap_mb) return;

    *buffer_kb = (cfg->ram_mb * 1024ULL) / 4ULL;
    *swap_mb = cfg->ram_mb / 4ULL;

    if (*buffer_kb == 0) *buffer_kb = 1;
    if (*swap_mb == 0) *swap_mb = 1;
}
