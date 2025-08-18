/* config.c - hfc config file
*
* headers and macros */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <ncurses.h>
#include <unistd.h>
#include "config.h"

/* functions */
/* 01.00 */ static void trim(char *str);
/* 02.00 */ static int get_special_key_code(const char *name);
/* 03.00 */ static void extract_color(const char *input, char *output);
/* 04.00 */ void remove_keybindings_for_action(const char *action);
/* 05.00 */ void load_config(void);
/* 06.00 */ short get_color_code(const char *name);
/* 07.00 */ void init_colors(void);
/* 08.00 */ void apply_color(ColorSetting *setting, short pair_id);
/* 09.00 */ void remove_color(ColorSetting *setting, short pair_id);
/* 10.00 */ const char *get_config_path(const char *filename, char *buffer, size_t size);
/* 11.00 */ const char *get_keys_for_action(const char *action);

HFCConfig config;

/* mapping table */
typedef struct {
	const char *name;
	int code;
} KeyName;

static KeyName special_keys[] = {
	{ "key_up", KEY_UP },
	{ "key_down", KEY_DOWN },
	{ "key_left", KEY_LEFT },
	{ "key_right", KEY_RIGHT },
	{ "key_home", KEY_HOME },
	{ "key_end", KEY_END },
	{ "key_npage", KEY_NPAGE },
	{ "key_ppage", KEY_PPAGE },
	{ "key_enter", 10 },
	{ "space", ' ' },
};

/* 01.00 */ static void
trim(char *str)
{
	char *end;
	while (isspace((unsigned char)*str)) str++;
	end = str + strlen(str) - 1;
	while (end > str && isspace((unsigned char)*end)) end--;
	end[1] = '\0';
}

/* 02.00 */ static int
get_special_key_code(const char *name)
{
	for (size_t i = 0; i < sizeof(special_keys) / sizeof(special_keys[0]); i++) {
		if (strcmp(name, special_keys[i].name) == 0)
			return special_keys[i].code;
	}
	return -1;
}

/* 03.00 */ static void
extract_color(const char *input, char *output)
{
	if (!input || !*input) {
		*output = '\0';
		return;
	}

	while (isspace((unsigned char)*input)) input++;

	if (!*input) {
		*output = '\0';
		return;
	}

	sscanf(input, "%15s", output);
}

/* 04.00 */ void remove_keybindings_for_action(const char *action) {
	for (int i = 0; i < keybinding_count; ) {
		if (strcmp(keybindings[i].action, action) == 0) {
			for (int j = i; j < keybinding_count - 1; j++) {
				keybindings[j] = keybindings[j + 1];
			}
			keybinding_count--;
		} else {
			i++;
		}
	}
}

/* 05.00 */ void load_config(void)
{
	/* init config to "no colors" and default keybindings count */
	memset(&config, 0, sizeof(HFCConfig));
	keybinding_count = 0;

	ColorSetting *all_colors[] = {
		&config.header, &config.footer, &config.entry_selected,
		&config.entry_highlight, &config.entry_default, &config.table_header
	};
	for (size_t i = 0; i < sizeof(all_colors)/sizeof(all_colors[0]); i++) {
		all_colors[i]->fg[0] = '\0';
		all_colors[i]->bg[0] = '\0';
		all_colors[i]->bold = false;
	}

	char path[512];
	get_config_path("conf", path, sizeof(path));

	/* default keybindings */
	static struct {
		const char *key;
		const char *action;
	} default_keybindings[] = {
		{ "j", "down" }, { "k", "up" }, { "q", "quit" }, { "a", "add" },
		{ "r", "remove" }, { "e", "edit" }, { "u", "update" },
		{ "U", "update_all" }, { "o", "order" }, { "m", "merge" },
		{ "L", "refresh" }, { "+", "select_all" }, { "-", "unselect_all" },
		{ "space", "select" }, { "?", "help" }
	};

	FILE *fp = fopen(path, "r");
	if (!fp) return;

	char line[512];
	char current_section[32] = {0};

	/* ui color config mapping */
	typedef struct {
		const char *key;
		ColorSetting *setting;
	} ColorConfigMap;

	ColorConfigMap color_map[] = {
		{ "header",         &config.header },
		{ "footer",         &config.footer },
		{ "entry_selected", &config.entry_selected },
		{ "entry_highlight",&config.entry_highlight },
		{ "entry_default",  &config.entry_default },
		{ "table_header",   &config.table_header }
	};

	while (fgets(line, sizeof(line), fp)) {
		trim(line);

		if (line[0] == '#' || line[0] == '\0') continue;

		if (line[0] == '[') {
			sscanf(line, "[%31[^]]", current_section);
			continue;
		}

		if (strcmp(current_section, "ui") == 0) {
			char word1[64] = {0}, word2[64] = {0}, word3[64] = {0};
			char word4[64] = {0}, word5[64] = {0};

			if (sscanf(line, "%63s %63s %63s %63s %63s", word1, word2, word3, word4, word5) >= 3
				&& strcmp(word1, "color") == 0) {

				for (size_t i = 0; i < sizeof(color_map)/sizeof(color_map[0]); ++i) {
					if (strcmp(word2, color_map[i].key) == 0) {
						ColorSetting *set = color_map[i].setting;

						strncpy(set->fg, word3, sizeof(set->fg));

						if (strcmp(word4, "bold") == 0) {
							set->bg[0] = '\0';
							set->bold = true;
						} else if (*word4) {
							strncpy(set->bg, word4, sizeof(set->bg));
							if (strcmp(word5, "bold") == 0)
								set->bold = true;
						}

						break;
					}
				}
				}
		}

		if (strcmp(current_section, "keys") == 0) {
			if (strncmp(line, "bind ", 5) == 0 && keybinding_count < MAX_KEYBINDINGS) {
				char key_str[32], action[32];
				if (sscanf(line + 5, "%31s %31s", key_str, action) == 2) {
					int key = get_special_key_code(key_str);
					if (key == -1 && strlen(key_str) == 1)
						key = key_str[0];

					if (key != -1) {
						remove_keybindings_for_action(action);
						keybindings[keybinding_count].key = key;
						strncpy(keybindings[keybinding_count].action, action,
								sizeof(keybindings[keybinding_count].action));
						keybinding_count++;
					}
				}
			}
		}
	}

	fclose(fp);

	/* add fallback keybindings if missing */
	for (size_t i = 0; i < sizeof(default_keybindings) / sizeof(default_keybindings[0]); i++) {
		const char *action = default_keybindings[i].action;
		int already_bound = 0;

		for (int j = 0; j < keybinding_count; j++) {
			if (strcmp(keybindings[j].action, action) == 0) {
				already_bound = 1;
				break;
			}
		}

		if (!already_bound && keybinding_count < MAX_KEYBINDINGS) {
			int key = get_special_key_code(default_keybindings[i].key);
			if (key == -1 && strlen(default_keybindings[i].key) == 1)
				key = default_keybindings[i].key[0];

			keybindings[keybinding_count].key = key;
			strncpy(keybindings[keybinding_count].action,
					action,
		   sizeof(keybindings[keybinding_count].action));
			keybinding_count++;
		}
	}
}

/* 06.00 */ short
get_color_code(const char *name)
{
	if (!name || !*name) return -1;

	struct {
		const char *name;
		short code;
	} colors[] = {
		{ "black",   COLOR_BLACK },
		{ "red",     COLOR_RED },
		{ "green",   COLOR_GREEN },
		{ "yellow",  COLOR_YELLOW },
		{ "blue",    COLOR_BLUE },
		{ "magenta", COLOR_MAGENTA },
		{ "cyan",    COLOR_CYAN },
		{ "white",   COLOR_WHITE },
		{ "gray",    8 },
	};

	for (size_t i = 0; i < sizeof(colors)/sizeof(colors[0]); i++) {
		if (strcmp(name, colors[i].name) == 0)
			return colors[i].code;
	}

	return -1;
}

/* 07.00 */ void
init_colors(void)
{
	if (!has_colors()) return;

	start_color();
	use_default_colors();

	struct {
		ColorSetting *setting;
		short pair_id;
	} pairs[] = {
		{ &config.header,         1 },
		{ &config.footer,         2 },
		{ &config.entry_selected, 3 },
		{ &config.entry_highlight,4 },
		{ &config.table_header,   5 },
		{ &config.entry_default,  6 }
	};

	char fg_buf[16], bg_buf[16];
	short fg_code, bg_code;

	for (size_t i = 0; i < sizeof(pairs)/sizeof(pairs[0]); i++) {
		ColorSetting *set = pairs[i].setting;

		/* extract color */
		extract_color(set->fg, fg_buf);
		extract_color(set->bg, bg_buf);

		fg_code = get_color_code(fg_buf);
		bg_code = get_color_code(bg_buf);

		/* only initialize if at least one valid color */
		if (fg_code != -1 || bg_code != -1) {
			init_pair(pairs[i].pair_id,
					  (bg_code != -1 ? bg_code : -1),
					  (fg_code != -1 ? fg_code : -1));
		}
	}
}

/* 08.00 */ void
apply_color(ColorSetting *setting, short pair_id)
{
	if (!*setting->fg && !*setting->bg)
		return;

	int attrs = COLOR_PAIR(pair_id);
	if (setting->bold)
		attrs |= A_BOLD;
	attron(attrs);
}

/* 09.00 */ void
remove_color(ColorSetting *setting, short pair_id)
{
	if (!*setting->fg && !*setting->bg)
		return;

	int attrs = COLOR_PAIR(pair_id);
	if (setting->bold)
		attrs |= A_BOLD;
	attroff(attrs);
}

/* 10.00 */ const char *
get_config_path(const char *filename, char *buffer, size_t size)
{
	const char *home;

	home = getenv("HOME");
	if (!home)
		return NULL;

	if (strcmp(filename, "counts") == 0) {
		snprintf(buffer, size, "%s/.local/state/hfc/%s", home,filename);
	} else {
		const char *config_home = getenv("XDG_CONFIG_HOME");

		if (!config_home || strlen(config_home) == 0) {
			snprintf(buffer, size, "%s/.config/hfc/%s", home, filename);
		} else {
			snprintf(buffer, size, "%s/hfc/%s", config_home, filename);
		}
	}

	return buffer;
}

/* 11.00 */ const char *
get_keys_for_action(const char *action) {
	static char buf[128];
	buf[0] = '\0';

	for (int i = 0; i < keybinding_count; i++) {
		if (strcmp(keybindings[i].action, action) == 0) {
			char keyname[32];

			/* check special keys */
			int found_special = 0;
			for (size_t j = 0; j < sizeof(special_keys)/sizeof(special_keys[0]); j++) {
				if (keybindings[i].key == special_keys[j].code) {
					snprintf(keyname, sizeof(keyname), "%s", special_keys[j].name);
					found_special = 1;
					break;
				}
			}
			if (!found_special) {
				snprintf(keyname, sizeof(keyname), "%c", keybindings[i].key);
			}

			if (strstr(buf, keyname) == NULL) {
				if (buf[0] != '\0') {
					strncat(buf, "/", sizeof(buf) - strlen(buf) - 1);
				}
				strncat(buf, keyname, sizeof(buf) - strlen(buf) - 1);
			}
		}
	}

	return (buf[0] != '\0') ? buf : "?";
}
