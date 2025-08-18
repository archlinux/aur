/* hfc config file */

#ifndef HFC_CONFIG_H
#define HFC_CONFIG_H

#include <stddef.h>
#include <stdbool.h>

#define MAX_KEYBINDINGS 64

typedef struct {
    char fg[16];
    char bg[16];
    bool bold;
} ColorSetting;

typedef struct {
    ColorSetting header;
    ColorSetting footer;
    ColorSetting entry_selected;
    ColorSetting entry_highlight;
    ColorSetting entry_default;
    ColorSetting table_header;

    char path_urls[256];
} HFCConfig;

typedef struct {
    int key;
    char action[32];
} KeyBinding;

extern HFCConfig config;
extern KeyBinding keybindings[MAX_KEYBINDINGS];
extern int keybinding_count;

void init_colors(void);
void load_config(void);
const char *get_config_path(const char *filename, char *buffer, size_t size);
void apply_color(ColorSetting *setting, short pair_id);
void remove_color(ColorSetting *setting, short pair_id);
const char *get_keys_for_action(const char *action);
short get_color_code(const char *name);

#endif

