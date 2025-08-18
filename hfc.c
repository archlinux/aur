/* hfc.c - host file client
*
* headers and macros */
#define _POSIX_C_SOURCE 200809L

#include <ctype.h>
#include <curl/curl.h>
#include <errno.h>
#include <locale.h>
#include <ncurses.h>
#include <netdb.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include "config.h"
#include "get.h"
#include "hfc.h"
#include "update.h"
#include <sys/types.h>
#include <sys/file.h>
#include <sys/wait.h>

#define MAX_ENTRIES     100
#define MAX_KEYBINDINGS  64
#define MAX_LINE_LEN    256
#define MAX_HEADER_LEN  256
#define MAX_NAME_LEN    220

/* functions */
/* 01.00 */ static int check_write_hosts(bool silent);
/* 02.00 */ static void load_entries(void);
/* 03.00 */ static void reorder_entry(int from, int to);
/* 04.00 */ static int fetch_lock_exists(void);
/* 05.00 */ static int is_fetch_lock_empty(void);
/* 06.00 */ static void create_fetch_lock(int index);
/* 07.00 */ static void remove_index_from_lock(int index_to_remove);
/* 08.00 */ static void start_update_in_background(void);
/* 09.00 */ static void save_count_for_index(int index);
/* 10.00 */ static void save_counts(void);
/* 11.00 */ static void load_counts(void);
/* 12.00 */ static void update_all_sources(void);
/* 13.00 */ static void update_selected_sources(void);
/* 14.00 */ static void update_domain_count(int index);
/* 15.00 */ static int count_hosts_in_section(int section_index);
/* 16.00 */ static void save_entries(void);
/* 17.00 */ static void free_entries(void);
/* 18.00 */ static void display_entries(int highlight);
/* 19.00 */ static void init_footer(void);
/* 20.00 */ static void print_footer(const char *fmt, ...);
/* 21.00 */ static void display_help(void);
/* 22.00 */ static void edit_entry(int index);
/* 23.00 */ static void add_entry(void);
/* 24.00 */ static void background_fetch_entry(int index);
/* 25.00 */ static void remove_entry(int index);
/* 26.00 */ static void remove_selected_entries(void);
/* 27.00 */ static void rebuild_hostfile_headers_from_urls(void);
/* 28.00 */ static void merge_entry(int index);
/* 29.00 */ static void merge_selected_entries(void);
/* 30.00 */ static void rename_entry(int index);
/* 31.00 */ const char *get_action_for_key(int key);
/* 32.00 */ static int has_network_connection(void);
/* 33.00 */ int main(int argc, char *argv[]);

/* variables */
int domain_count              = 0;
int footer_busy               = 0;
int in_help_mode              = 0;
int highlight                 = 0;
int updates_count             = 0;
int entry_count               = 0;
int keybinding_count          = 0;
int is_checking               = 1;
volatile int update_progress = -1;
int selected[MAX_ENTRIES]   = {0};
int update_pipe[2];
int updates_counts[MAX_ENTRIES];
int domains_counts[MAX_ENTRIES];
Domain domains[MAX_ENTRIES];
WINDOW *footer_win = NULL;
KeyBinding keybindings[MAX_KEYBINDINGS];
char *entries[MAX_ENTRIES];
char urls_path[256];
char counts_path[256];
char fetch_lock_path[256];
char path_keybindings[256];
long remote_sizes[MAX_ENTRIES];
const char *editor = NULL;
const char *hosts_path = "/etc/hosts";
int is_local_entry(const char *entry) {
	if (!entry) return 0;
	return !(strstr(entry, "http://") || strstr(entry, "https://"));
}

/* 01.00 */ static int
check_write_hosts(bool silent)
{
	if (access(hosts_path, W_OK) != 0) {
		if (!silent) {
			int is_tui = (stdscr != NULL || isatty(fileno(stdout)));

			if (is_tui) {
				print_footer("Error: Can't open hosts for writing: permission denied.");
				refresh();
				napms(1500);
			} else {
				fprintf(stderr, "Error: Can't open hosts for writing: permission denied.\n");
			}
		}
		return 0;
	}
	return 1;
}

/* 02.00 */ static void
load_entries(void)
{
	FILE *fp;
	char line[MAX_LINE_LEN];
	char *url_start;

	/* entries from urls_path */
	fp = fopen(urls_path, "r");
	if (fp) {
		entry_count = 0;
		while (fgets(line, sizeof(line), fp) && entry_count < MAX_ENTRIES) {
			line[strcspn(line, "\n")] = '\0';
			url_start = line;
			entries[entry_count]        = strdup(url_start);
			domains[entry_count].url    = strdup(entries[entry_count]);
			domains[entry_count].hosts  = NULL;
			entry_count++;
		}
		fclose(fp);
	}

	/* temporary entries from fetch.lock (not yet in urls_path!) */
	if (fetch_lock_exists()) {
		FILE *lock_fp = fopen(fetch_lock_path, "r");
		if (lock_fp) {
			while (fgets(line, sizeof(line), lock_fp) && entry_count < MAX_ENTRIES) {
				line[strcspn(line, "\n")] = '\0';

				/* check: already in entries[]? */
				int exists = 0;
				for (int i = 0; i < entry_count; i++) {
					if (entries[i] && strcmp(entries[i], line) == 0) {
						exists = 1;
						break;
					}
				}

				if (!exists) {
					entries[entry_count]        = strdup(line);
					domains[entry_count].url    = strdup(entries[entry_count]);
					domains[entry_count].hosts  = NULL;
					domains_counts[entry_count] = -1;
					updates_counts[entry_count] = -1;
					remote_sizes[entry_count]   = 0;
					entry_count++;
				}
			}
			fclose(lock_fp);
		}
	}
}

/* 03.00 */ static void
reorder_entry(int from, int to)
{
	if (from == to || from < 0 || to < 0 || from >= entry_count || to >= entry_count)
		return;

	if (!check_write_hosts(true)) {
		return;
	}

	/* read hosts file into blocks */
	FILE *fp = fopen(hosts_path, "r");
	if (!fp) return;

	char **blocks = calloc(entry_count, sizeof(char *));
	size_t *block_sizes = calloc(entry_count, sizeof(size_t));
	int current = -1;
	size_t bufsize = 0;
	char *block_buf = NULL;
	char line[MAX_LINE_LEN];

	while (fgets(line, sizeof(line), fp)) {
		if (strncmp(line, "# ", 2) == 0) {
			if (current >= 0) {
				blocks[current] = block_buf;
				block_sizes[current] = bufsize;
			}
			current++;
			block_buf = NULL;
			bufsize = 0;
		}
		size_t len = strlen(line);
		block_buf = realloc(block_buf, bufsize + len + 1);
		memcpy(block_buf + bufsize, line, len);
		bufsize += len;
		block_buf[bufsize] = '\0';
	}
	if (current >= 0) {
		blocks[current] = block_buf;
		block_sizes[current] = bufsize;
	}
	fclose(fp);

	/* back up metadata */
	char *entry_tmp = entries[from];
	int domain_tmp = domains_counts[from];
	int update_tmp = updates_counts[from];
	long size_tmp = remote_sizes[from];
	int sel_tmp = selected[from];
	Domain domain_struct_tmp = domains[from];
	char *block_tmp = blocks[from];
	size_t block_size_tmp = block_sizes[from];

	/* move arrays */
	if (from < to) {
		for (int i = from; i < to; i++) {
			entries[i] = entries[i + 1];
			domains_counts[i] = domains_counts[i + 1];
			updates_counts[i] = updates_counts[i + 1];
			remote_sizes[i] = remote_sizes[i + 1];
			selected[i] = selected[i + 1];
			domains[i] = domains[i + 1];
			blocks[i] = blocks[i + 1];
			block_sizes[i] = block_sizes[i + 1];
		}
	} else {
		for (int i = from; i > to; i--) {
			entries[i] = entries[i - 1];
			domains_counts[i] = domains_counts[i - 1];
			updates_counts[i] = updates_counts[i - 1];
			remote_sizes[i] = remote_sizes[i - 1];
			selected[i] = selected[i - 1];
			domains[i] = domains[i - 1];
			blocks[i] = blocks[i - 1];
			block_sizes[i] = block_sizes[i - 1];
		}
	}

	/* use secured position */
	entries[to] = entry_tmp;
	domains_counts[to] = domain_tmp;
	updates_counts[to] = update_tmp;
	remote_sizes[to] = size_tmp;
	selected[to] = sel_tmp;
	domains[to] = domain_struct_tmp;
	blocks[to] = block_tmp;
	block_sizes[to] = block_size_tmp;

	/* rewrite hosts file with new numbers */
	FILE *out = fopen(hosts_path, "w");
	if (out) {
		for (int i = 0; i < entry_count; i++) {
			fprintf(out, "# %d. %s\n", i + 1, entries[i]);
			char *block_content = strstr(blocks[i], "\n");
			if (block_content) {
				fputs(block_content + 1, out);
			}
		}
		fclose(out);
	}

	for (int i = 0; i < entry_count; i++) {
		free(blocks[i]);
	}
	free(blocks);
	free(block_sizes);

	save_entries();
	save_counts();
}

/* 04.00 */ static int
fetch_lock_exists(void)
{
	FILE *fp = fopen(fetch_lock_path, "r");
	if (fp) {
		fclose(fp);
		return 1;
	}
	return 0;
}

/* 05.00 */ static int
is_fetch_lock_empty(void)
{
	FILE *fp = fopen(fetch_lock_path, "r");
	if (!fp) return 1;

	int dummy;
	int result = (fscanf(fp, "%d", &dummy) != 1);
	fclose(fp);
	return result;
}

/* 06.00 */ static void
create_fetch_lock(int index)
{
	if (fetch_lock_path[0] == '\0')
		return;

	/* check if index is already in lock */
	FILE *check = fopen(fetch_lock_path, "r");
	if (check) {
		char line[1024];
		while (fgets(line, sizeof(line), check)) {
			line[strcspn(line, "\n")] = '\0';
			if (strcmp(line, entries[index]) == 0) {
				fclose(check);
				return;
			}
		}
		fclose(check);
	}

	/* if lock does not exist – add */
	FILE *fp = fopen(fetch_lock_path, "a");
	if (!fp) {
		perror("fopen fetch_lock");
		return;
	}

	flock(fileno(fp), LOCK_EX);
	fprintf(fp, "%s\n", entries[index]);
	fflush(fp);
	flock(fileno(fp), LOCK_UN);
	fclose(fp);
}

/* 07.00 */ static void
remove_index_from_lock(int index_to_remove)
{
	if (!entries[index_to_remove]) return;

	int fd = open(fetch_lock_path, O_RDWR);
	if (fd == -1) return;

	flock(fd, LOCK_EX);

	FILE *in = fdopen(fd, "r");
	if (!in) {
		close(fd);
		return;
	}

	FILE *out = fopen("/tmp/fetch_lock_temp", "w");
	if (!out) {
		fclose(in);
		return;
	}

	char line[1024];
	int is_empty = 1;

	while (fgets(line, sizeof(line), in)) {
		line[strcspn(line, "\n")] = '\0';

		if (strcmp(line, entries[index_to_remove]) != 0) {
			fprintf(out, "%s\n", line);
			is_empty = 0;
		}
	}

	fclose(in);
	fclose(out);
	rename("/tmp/fetch_lock_temp", fetch_lock_path);

	if (is_empty) {
		remove(fetch_lock_path);
	}
}

/* 08.00 */ static void
start_update_in_background()
{
	pid_t pid = fork();

	if (pid < 0) {
		perror("fork");
		return;
	}

	if (pid == 0) {
		/* check permission */
		if (geteuid() != 0 || !check_write_hosts(true)) {
			_exit(0);
		}
		/* handle updates */
		for (int idx = 0; idx < entry_count; idx++) {
			if (is_local_entry(entries[idx]))
				continue;

			long new_size = get_remote_content_length(entries[idx]);

			if (new_size <= 0 || new_size == remote_sizes[idx]) {
				/* no change in remote content */
				if (update_pipe[1] != -1) {
					int dummy = -2;
					write(update_pipe[1], &dummy, sizeof(int));
				}
				continue;
			}

			pid_t subpid = fork();

			if (subpid == 0) {
				/* only update updates_counts skip domains_counts */
				char error_msg[CURL_ERROR_SIZE] = {0};
				char *content = download_url(entries[idx], error_msg, sizeof(error_msg));

				if (content && contains_valid_hosts_entry(content)) {
					updates_counts[idx] = count_hosts_in_content(content);
					remote_sizes[idx] = new_size;
					save_counts();
				}

				if (content)
					free(content);

				if (update_pipe[1] != -1) {
					write(update_pipe[1], &idx, sizeof(int));
				}
				_exit(0);
			}
		}

		/* wait for child processes */
		while (wait(NULL) > 0);

		/* signal to tui: all updates completed */
		if (update_pipe[1] != -1) {
			int end = -1;
			write(update_pipe[1], &end, sizeof(int));
			close(update_pipe[1]);
		}
		_exit(0);
	}
}

/* 09.00 */ static void
save_count_for_index(int index)
{
	if (index < 0 || index >= entry_count) return;

	char lines[MAX_ENTRIES][64] = {0};
	int existing_lines = 0;

	FILE *in = fopen(counts_path, "r");
	if (in) {
		while (fgets(lines[existing_lines], sizeof(lines[0]), in) && existing_lines < MAX_ENTRIES) {
			lines[existing_lines][strcspn(lines[existing_lines], "\n")] = '\0';
			existing_lines++;
		}
		fclose(in);
	}

	if (index >= existing_lines) {
		for (int i = existing_lines; i <= index; i++) {
			strcpy(lines[i], "");  /* blank line as placeholder */
		}
	}

	snprintf(lines[index], sizeof(lines[index]), "%d %ld", updates_counts[index], remote_sizes[index]);

	FILE *out = fopen(counts_path, "w");
	if (!out) return;

	for (int i = 0; i <= index; i++) {
		if (strlen(lines[i]) == 0) continue;
		fprintf(out, "%s\n", lines[i]);
	}

	fclose(out);
}

/* 10.00 */ static void
save_counts(void)
{
	FILE *f;
	int i;

	f = fopen(counts_path, "w");
	if (!f)
		return;

	for (i = 0; i < entry_count; i++)
		fprintf(f, "%d %ld\n", updates_counts[i], remote_sizes[i]);

	fclose(f);
}

/* 11.00 */ static void
load_counts(void)
{
	FILE *fp = fopen(counts_path, "r");
	if (!fp)
		return;

	for (int i = 0; i < entry_count; i++) {
		long updates = 0;
		long remote_size = 0;
		if (fscanf(fp, "%ld %ld", &updates, &remote_size) != 2)
			break;

		if (is_local_entry(entries[i])) {
			domains_counts[i] = count_hosts_in_section(i);
			updates_counts[i] = 0;
			remote_sizes[i] = 0;
		} else if (updates <= 0) {
			domains_counts[i] = -1;
			updates_counts[i] = -1;
			remote_sizes[i]   = 0;
		} else {
			domains_counts[i] = updates;
			updates_counts[i] = updates;
			remote_sizes[i]   = remote_size;
		}
	}

	fclose(fp);

	/* fetch lock control */
	if (fetch_lock_exists()) {
		FILE *fp = fopen(fetch_lock_path, "r");
		if (fp) {
			char line[1024];
			while (fgets(line, sizeof(line), fp)) {
				line[strcspn(line, "\n")] = '\0';

				for (int i = 0; i < entry_count; i++) {
					if (entries[i] && strcmp(entries[i], line) == 0) {
						if (domains_counts[i] <= 0 || updates_counts[i] <= 0) {
							domains_counts[i] = -1;
							updates_counts[i] = -1;
						}
						break;
					}
				}
			}
			fclose(fp);
		}
	}
}

/* 12.00 */ static void
update_all_sources(void)
{
	int i, total = 0, current = 0;

	if (!has_network_connection()) {
		print_footer("Error: No network connection.");
		napms(2000);
		return;
	}

	if (!check_write_hosts(true)) {
		return;
	}

	/* skips personal lists */
	for (i = 0; i < entry_count; i++) {
		if (!is_local_entry(entries[i])) {
			total++;
		}
	}

	for (i = 0; i < entry_count; i++) {
		if (is_local_entry(entries[i]))
			continue;

		if (domains_counts[i] == -1 || updates_counts[i] == -1)
			continue; /* skip lists in fetch.lock */

		current++;
		update_progress = i;
		print_footer("(%d/%d) loading %s", current, total, entries[i]);
		update_domain_count(i);
	}

	update_progress = -1;
	save_counts();
	display_entries(highlight);
}

/* 13.00 */ static void
update_selected_sources(void)
{
	int i, total = 0, current = 0;

	if (!has_network_connection()) {
		print_footer("Error: No network connection.");
		napms(2000);
		return;
	}

	for (i = 0; i < entry_count; i++) {
		if (selected[i] && !is_local_entry(entries[i]))
			total++;
	}

	for (i = 0; i < entry_count; i++) {
		if (!selected[i] || is_local_entry(entries[i]))
			continue;

		current++;
		update_progress = i;
		print_footer("(%d/%d) updating %s", current, total, entries[i]);
		update_domain_count(i);
	}

	update_progress = -1;
	save_counts();
	display_entries(highlight);
}


/* 14.00 */ static void
update_domain_count(int index)
{
	long new_size;
	char error_msg[256];
	char *content;

	if (index < 0 || index >= entry_count || !entries[index]) {
		updates_counts[index] = 0;
		return;
	}

	new_size = get_remote_content_length(entries[index]);
	if (new_size <= 0)
		return;

	if (new_size != remote_sizes[index]) {
		content = download_url(entries[index], error_msg, sizeof(error_msg));
		if (!content)
			return;

		updates_counts[index] = count_hosts_in_content(content);
		remote_sizes[index] = new_size;

		free(content);
		save_counts();
	}
}

/* 15.00 */ static int
count_hosts_in_section(int section_index)
{
	FILE *fp;
	char line[512];
	char section_header[256];
	int current_section = -1;
	int count = 0;

	fp = fopen(hosts_path, "r");
	if (!fp)
		return 0;

	snprintf(section_header, sizeof(section_header), "# %d.", section_index + 1);

	while (fgets(line, sizeof(line), fp)) {
		if (strncmp(line, "# ", 2) == 0) {
			if (strncmp(line, section_header, strlen(section_header)) == 0) {
				current_section = section_index;
				count = 0;
			} else if (current_section == section_index) {
				break;
			} else {
				current_section = -1;
			}
		} else if (current_section == section_index) {
			if (strncmp(line, "0.0.0.0 ", 8) == 0)
				count++;
		}
	}

	fclose(fp);
	return count;
}

/* 16.00 */ static void
save_entries(void)
{
	FILE *fp = fopen(urls_path, "w");
	if (!fp)
		return;

	for (int i = 0; i < entry_count; i++) {
		if (entries[i] && strlen(entries[i]) > 0) {
			fprintf(fp, "%s\n", entries[i]);
		}
	}

	fclose(fp);
}

/* 17.00 */ static void
free_entries(void)
{
	int i;

	for (i = 0; i < entry_count; i++)
		free(entries[i]);
}

/* 18.00 */ static void
display_entries(int highlight)
{
	int i, line, y, cols, url_len, lines_needed;
	int local_source_width = 13;

	int id_width = 5;
	int indent = 7;
	int local_source_start;
	int max_url_width;
	char *text, buf[32];

	clear();
	cols = getmaxx(stdscr);
	local_source_start = cols - local_source_width - 4;

	int selected_count = 0;
	for (int si = 0; si < entry_count; si++) {
		if (selected[si])
			selected_count++;
	}
	int right_col = cols - 10;

	/* header */
	{
		short fg_code = (*config.header.fg) ? get_color_code(config.header.fg) : -1;
		if (fg_code != -1)
			apply_color(&config.header, 1);
		else
			attron(COLOR_PAIR(0));

		mvhline(0, 0, ' ', cols);
		mvprintw(0, 0, "hfc %s |", HFC_VERSION);
		mvprintw(0, 12, "%-1s:%-3s", get_keys_for_action("quit"),   "quit");
		mvprintw(0, 20, "%-1s:%-3s", get_keys_for_action("add"),    "add");
		mvprintw(0, 27, "%-1s:%-3s", get_keys_for_action("remove"), "remove");
		mvprintw(0, 37, "%-1s:%-3s", get_keys_for_action("merge"),  "merge");
		mvprintw(0, 46, "%-1s:%-3s", get_keys_for_action("edit"),   "edit");
		mvprintw(0, 54, "%-1s:%-3s", get_keys_for_action("help"),   "help");

		if (selected_count > 0) {
			mvprintw(0, right_col, "*%d | %d/%d",
					 selected_count,
			(entry_count == 0) ? 0 : highlight + 1,
					 entry_count);
		} else {
			mvprintw(0, right_col, "   | %d/%d",
					 (entry_count == 0) ? 0 : highlight + 1,
					 entry_count);
		}

		if (fg_code != -1)
			remove_color(&config.header, 1);
		else
			attroff(COLOR_PAIR(0));

		/* line unter dem header */
		short line_code = get_color_code(config.header.bg);
		if (line_code != -1) {
			init_pair(10, line_code, -1);
			attron(COLOR_PAIR(10) | (config.header.bold ? A_BOLD : 0));
			mvhline(1, 0, ACS_HLINE, cols);
			attroff(COLOR_PAIR(10) | (config.header.bold ? A_BOLD : 0));
		} else {
			mvhline(1, 0, ACS_HLINE, cols);
		}
	}

	/* table header */
	if (*config.table_header.fg) {
		short fg_code = get_color_code(config.table_header.fg);
		if (fg_code != -1) {
			init_pair(21, fg_code, -1);
			attron(COLOR_PAIR(21) | (config.table_header.bold ? A_BOLD : 0));
		}
	} else {
		attron(A_BOLD);
	}

	mvprintw(2, 2, "ID");
	mvprintw(2, indent, "List");
	mvprintw(2, local_source_start, "Local/Source");

	if (*config.table_header.fg) {
		short fg_code = get_color_code(config.table_header.fg);
		if (fg_code != -1) {
			attroff(COLOR_PAIR(21) | (config.table_header.bold ? A_BOLD : 0));
		}
	} else {
		attroff(A_BOLD);
	}

	/* entries */
	if (entry_count > 0) {
		max_url_width = local_source_start - indent - 6;
		y = 3;

		for (i = 0; i < entry_count; i++) {
			text = entries[i];
			url_len = strlen(text);
			lines_needed = (url_len + max_url_width - 1) / max_url_width;
			int is_highlight = (i == highlight);

			for (line = 0; line < lines_needed; line++) {
				if (is_highlight) {
					short fg_code = get_color_code(config.entry_highlight.fg);
					short bg_code = get_color_code(config.entry_highlight.bg);

					if (fg_code != -1 || bg_code != -1) {
						int attrs = COLOR_PAIR(4);
						if (config.entry_highlight.bold)
							attrs |= A_BOLD;
						attron(attrs);
						mvhline(y, 0, ' ', cols);
					} else {
						attron(A_REVERSE);
						mvhline(y, 0, ' ', cols);
					}
				}

				if (!is_highlight && *config.entry_default.fg) {
					short fg_code = get_color_code(config.entry_default.fg);
					short bg_code = get_color_code(config.entry_default.bg);
					if (fg_code != -1 || bg_code != -1) {
						init_pair(20,
								  (fg_code != -1 ? fg_code : -1),
								  (bg_code != -1 ? bg_code : -1));
						attron(COLOR_PAIR(20) | (config.entry_default.bold ? A_BOLD : 0));
					}
				}

				if (line == 0) {
					mvprintw(y, 1, "%c", selected[i] ? '*' : ' ');
					mvprintw(y, 2, "%-*d", id_width, i + 1);
					mvprintw(y, indent, "%.*s", max_url_width, text + line * max_url_width);

					if (domains_counts[i] == -1 || updates_counts[i] == -1) {
						mvprintw(y, local_source_start, "(...)");
					} else if (is_local_entry(entries[i])) {
						snprintf(buf, sizeof(buf), "(%d)", domains_counts[i]);
						mvprintw(y, local_source_start, "%s", buf);
					} else {
						snprintf(buf, sizeof(buf), "(%d/", domains_counts[i]);
						mvprintw(y, local_source_start, "%s", buf);
						mvprintw(y, local_source_start + strlen(buf), "%d)", updates_counts[i]);
					}
				} else {
					mvprintw(y, 1, " ");
					mvprintw(y, 2, "     ");
					mvprintw(y, indent, "%.*s", max_url_width, text + line * max_url_width);
				}

				if (!is_highlight && *config.entry_default.fg) {
					short fg_code = get_color_code(config.entry_default.fg);
					short bg_code = get_color_code(config.entry_default.bg);
					if (fg_code != -1 || bg_code != -1) {
						attroff(COLOR_PAIR(20) | (config.entry_default.bold ? A_BOLD : 0));
					}
				}

				if (is_highlight) {
					short fg_code = get_color_code(config.entry_highlight.fg);
					short bg_code = get_color_code(config.entry_highlight.bg);

					if (fg_code != -1 || bg_code != -1) {
						int attrs = COLOR_PAIR(4);
						if (config.entry_highlight.bold)
							attrs |= A_BOLD;
						attroff(attrs);
					} else {
						attroff(A_REVERSE);
					}
				}
				y++;
			}
		}
	}

	short footer_line_fg = get_color_code(config.footer.bg);
	if (footer_line_fg != -1) {
		init_pair(12, footer_line_fg, -1);
		attron(COLOR_PAIR(12) | (config.footer.bold ? A_BOLD : 0));
		mvhline(LINES - 2, 0, ACS_HLINE, cols);
		attroff(COLOR_PAIR(12) | (config.footer.bold ? A_BOLD : 0));
	} else {
		mvhline(LINES - 2, 0, ACS_HLINE, cols);
	}
}

/* 19.00 */ static void
init_footer()
{
	if (footer_win) {
		delwin(footer_win);
	}
	int cols = getmaxx(stdscr);
	footer_win = newwin(1, cols, LINES - 1, 0);
}


/* 20.00 */ static void
print_footer(const char *fmt, ...)
{
	int cols = getmaxx(stdscr);

	if (*config.footer.fg) {
		apply_color(&config.footer, 2);
	}

	mvhline(LINES - 1, 0, ' ', cols);

	char buf[512];
	va_list args;
	va_start(args, fmt);
	vsnprintf(buf, sizeof(buf), fmt, args);
	va_end(args);

	mvprintw(LINES - 1, 0, "%s", buf);

	if (*config.footer.fg) {
		remove_color(&config.footer, 2);
	}

	refresh();
}

/* 21.00 */ static void
display_help(void)
{
	typedef struct {
		const char *action;
		const char *description;
	} HelpEntry;

	static HelpEntry help_entries[] = {
		{ "help",            "help" },
		{ "quit",            "quit" },
		{ "refresh",         "refresh screen" },
		{ NULL,              NULL },
		{ "down",            "down" },
		{ "up",              "up" },
		{ "edit",            "edit ($EDITOR)" },
		{ "add",             "add item" },
		{ "remove",          "remove selected" },
		{ "merge",           "merge selected" },
		{ NULL,              NULL },
		{ "select",          "select" },
		{ "unselect_all",    "unselect all" },
		{ "select_all",      "select all" },
		{ NULL,              NULL },
		{ "rename",          "rename" },
		{ "update",          "update selected" },
		{ "update_all",      "update all" },
		{ "order",           "change order" }
	};

	static const char *fallback_help[] = {
		"?                 - help",
		"q                 - quit",
		"L                 - refresh screen",
		"",
		"arrows / j,k      - scroll",
		"e                 - edit ($EDITOR)",
		"a                 - add item",
		"r                 - remove selected",
		"m                 - merge selected",
		"",
		"space             - select",
		"-                 - unselect all",
		"+                 - select all",
		"",
		"R                 - rename",
		"u                 - update selected",
		"U                 - update all",
		"o                 - change order",
	};

	int lines = sizeof(help_entries) / sizeof(help_entries[0]);
	int fallback_lines = sizeof(fallback_help) / sizeof(fallback_help[0]);

	clear();
	int cols = getmaxx(stdscr);

	/* header like in display_entries() */
	if (*config.header.fg) {
		apply_color(&config.header, 1);
		mvhline(0, 0, ' ', cols);
		mvprintw(0, 0, "hfc %s | help", HFC_VERSION);
		remove_color(&config.header, 1);
	} else {
		mvhline(0, 0, ' ', cols);
		if (config.header.bold) attron(A_BOLD);
		mvprintw(0, 0, "hfc %s | help", HFC_VERSION);
		if (config.header.bold) attroff(A_BOLD);
	}

	/* line below header */
	short fg_code = get_color_code(config.header.bg);
	if (fg_code != -1) {
		init_pair(10, fg_code, -1);
		attron(COLOR_PAIR(10) | (config.header.bold ? A_BOLD : 0));
		mvhline(1, 0, ACS_HLINE, cols);
		attroff(COLOR_PAIR(10) | (config.header.bold ? A_BOLD : 0));
	} else {
		mvhline(1, 0, ACS_HLINE, cols);
	}

	/* check if bindings present */
	int any_binding_found = 0;
	for (int i = 0; i < lines; i++) {
		if (help_entries[i].action &&
			strcmp(get_keys_for_action(help_entries[i].action), "?") != 0) {
			any_binding_found = 1;
		break;
			}
	}

	int row = 3;
	if (any_binding_found) {
		for (int i = 0; i < lines; i++) {
			if (help_entries[i].action == NULL) {
				row++;
				continue;
			}
			const char *keys = get_keys_for_action(help_entries[i].action);

			/* only font color like entry_default, without background */
			if (*config.entry_default.fg) {
				short fg_code = get_color_code(config.entry_default.fg);
				if (fg_code != -1) {
					init_pair(20, fg_code, -1);
					attron(COLOR_PAIR(20) | (config.entry_default.bold ? A_BOLD : 0));
				}
			}

			mvprintw(row++, 2, "%-18s - %s", keys, help_entries[i].description);

			if (*config.entry_default.fg) {
				short fg_code = get_color_code(config.entry_default.fg);
				if (fg_code != -1) {
					attroff(COLOR_PAIR(20) | (config.entry_default.bold ? A_BOLD : 0));
				}
			}
		}
	} else {
		for (int i = 0; i < fallback_lines; i++) {
			if (strcmp(fallback_help[i], "") == 0) {
				row++;
				continue;
			}
			if (*config.entry_default.fg) {
				short fg_code = get_color_code(config.entry_default.fg);
				if (fg_code != -1) {
					init_pair(20, fg_code, -1);
					attron(COLOR_PAIR(20) | (config.entry_default.bold ? A_BOLD : 0));
				}
			}
			mvprintw(row++, 2, "%s", fallback_help[i]);
			if (*config.entry_default.fg) {
				short fg_code = get_color_code(config.entry_default.fg);
				if (fg_code != -1) {
					attroff(COLOR_PAIR(20) | (config.entry_default.bold ? A_BOLD : 0));
				}
			}
		}
	}

	/* footer line as in display_entries() */
	short footer_line_fg = get_color_code(config.footer.bg);
	if (footer_line_fg != -1) {
		init_pair(12, footer_line_fg, -1);
		attron(COLOR_PAIR(12) | (config.footer.bold ? A_BOLD : 0));
		mvhline(LINES - 2, 0, ACS_HLINE, cols);
		attroff(COLOR_PAIR(12) | (config.footer.bold ? A_BOLD : 0));
	} else {
		mvhline(LINES - 2, 0, ACS_HLINE, cols);
	}

	/* footer text as normal in footer color */
	print_footer("Press any key to continue...");
	refresh();
}

/* 22.00 */ static void
edit_entry(int index)
{
	const char *editor = getenv("EDITOR");
	FILE *fp;
	char line[1024];
	char search_tag[64];
	char cmd[1024];
	int line_num, target_line, ret;

	if (!editor) {
		const char *env = getenv("EDITOR");
		editor = (env && *env) ? env : "vim";
	}

	if (index < 0 || index >= entry_count)
		return;

	fp = fopen(hosts_path, "r");
	if (!fp) {
		mvprintw(LINES - 1, 2, "Error: Couldn't open hosts.");
		refresh();
		napms(1500);
		return;
	}

	line_num = 0;
	target_line = -1;

	snprintf(search_tag, sizeof(search_tag), "# %d. %s", index + 1, entries[index]);

	while (fgets(line, sizeof(line), fp)) {
		line_num++;
		if (strstr(line, search_tag)) {
			target_line = line_num;
			break;
		}
	}
	fclose(fp);

	if (target_line == -1) {
		mvprintw(LINES - 1, 2, "No entry found.");
		refresh();
		napms(1500);
		return;
	}
	is_checking = 0;

	snprintf(cmd, sizeof(cmd), "%s +%d %s", editor, target_line, hosts_path);

	endwin();

	ret = system(cmd);

	refresh();
	clear();

	if (ret == 0) {
		/* full recount for all sections */
		for (int i = 0; i < entry_count; i++) {
			domains_counts[i] = count_hosts_in_section(i);
			updates_counts[i] = domains_counts[i];
		}
		save_counts();
	}
}

/* 23.00 */ static void
add_entry(void)
{
	char input[MAX_LINE_LEN] = {0};
	int pos = 0, ch, next;

	echo();
	curs_set(1);

	const char *prompt = "Url/List: ";
	print_footer("%s", prompt);

	int input_start_x = (int)strlen(prompt);
	apply_color(&config.footer, 2);
	mvhline(LINES - 1, input_start_x, ' ', MAX_LINE_LEN - 1);
	move(LINES - 1, input_start_x);

	while ((ch = getch()) != '\n' && ch != ERR) {
		if (ch == 27) {
			nodelay(stdscr, 1);
			next = getch();
			nodelay(stdscr, 0);
			if (next == ERR) goto cancel;
			else ungetch(next);
		} else if (ch == KEY_BACKSPACE || ch == 127) {
			if (pos > 0) {
				pos--;
				input[pos] = '\0';
				mvaddch(LINES - 1, input_start_x + pos, ' ');
			}
			move(LINES - 1, input_start_x + pos);
		} else if (pos < MAX_LINE_LEN - 1 && isprint(ch)) {
			input[pos++] = ch;
			input[pos] = '\0';
			mvaddch(LINES - 1, input_start_x + pos - 1, ch);
			move(LINES - 1, input_start_x + pos);
		}
		refresh();
	}

	remove_color(&config.footer, 2);

	if (pos == 0)
		goto cancel;

	noecho();
	curs_set(0);

	/* add metadata entry */
	int index = entry_count;

	if (!strchr(input, '.')) {
		/* local list → check write access */
		if (access(hosts_path, W_OK) != 0) {
			print_footer("Error: Can't open hosts for writing: permission denied.");
			refresh();
			napms(1500);
			goto cancel;
		}
		if (!save_to_hosts_file("# (manually added entry)\n", input, index + 1)) {
			print_footer("Error: Could not write to hosts file.");
			refresh();
			napms(1500);
			goto cancel;
		}

		entries[index] = strdup(input);
		domains_counts[index] = count_hosts_in_section(index);
		updates_counts[index] = 0;
		remote_sizes[index] = 0;
		entry_count++;
		save_entries();
		save_counts();
	} else {
		/* remote URL → check write access */
		if (!check_write_hosts(true)) {
			refresh();
			napms(1500);
			goto cancel;
		}

		/* add metadata entry */
		entries[index] = strdup(input);
		domains_counts[index] = -1;
		updates_counts[index] = -1;
		remote_sizes[index] = 0;
		entry_count++;

		background_fetch_entry(index);
	}

	display_entries(index);
	highlight = index;
	move(LINES - 1, 0);
	clrtoeol();
	refresh();
	return;

cancel:
	remove_color(&config.footer, 2);
	noecho();
	curs_set(0);
	move(LINES - 1, 0);
	clrtoeol();
	refresh();
	display_entries(highlight);
	return;
}

/* 24.00 */ static void
background_fetch_entry(int index)
{
	pid_t pid = fork();
	if (pid == 0) {
		setsid();
		signal(SIGHUP, SIG_IGN);
		signal(SIGPIPE, SIG_IGN);

		fclose(stdin);
		fclose(stdout);
		fclose(stderr);

		create_fetch_lock(index);

		char error_msg[CURL_ERROR_SIZE] = {0};
		char *content = download_url(entries[index], error_msg, sizeof(error_msg));

		if (!content || !contains_valid_hosts_entry(content)) {
			if (content) free(content);
			remove_index_from_lock(index);
			_exit(1);
		}

		if (!check_write_hosts(true)) {
			free(content);
			remove_index_from_lock(index);
			_exit(1);
		}

		/* count + save */
		int count = count_hosts_in_content(content);
		domains_counts[index] = count;
		updates_counts[index] = count;
		remote_sizes[index] = get_remote_content_length(entries[index]);

		/* now write to hosts + urls */
		save_to_hosts_file(content, entries[index], index + 1);
		save_entries();
		save_count_for_index(index);

		free(content);
		remove_index_from_lock(index);

		if (update_pipe[1] != -1) {
			int idx = index;
			write(update_pipe[1], &idx, sizeof(int));
		}

		_exit(0);
	}
}

/* 25.00 */ static void
remove_entry(int index)
{
	if (index < 0 || index >= entry_count || !entries[index])
		return;

	if (!check_write_hosts(true))
		return;

	const char *target_url = entries[index];
	FILE *in = fopen(hosts_path, "r");
	FILE *out = fopen("/tmp/hosts_temp", "w");

	if (!in || !out) {
		if (in) fclose(in);
		if (out) fclose(out);
		return;
	}

	char line[MAX_LINE_LEN];
	int skip_block = 0;

	while (fgets(line, sizeof(line), in)) {
		if (strncmp(line, "# ", 2) == 0) {
			/* is that a block with the url? */
			if (strstr(line, target_url)) {
				skip_block = 1;
				continue;
			} else {
				skip_block = 0;
			}
		}

		if (!skip_block)
			fputs(line, out);
	}

	fclose(in);
	fclose(out);

	rename("/tmp/hosts_temp", hosts_path);

	/* move array entries */
	free(entries[index]);
	for (int i = index; i < entry_count - 1; i++) {
		entries[i] = entries[i + 1];
		updates_counts[i] = updates_counts[i + 1];
		domains_counts[i] = domains_counts[i + 1];
		remote_sizes[i] = remote_sizes[i + 1];
		selected[i] = selected[i + 1];
	}
	entries[entry_count - 1] = NULL;
	updates_counts[entry_count - 1] = 0;
	domains_counts[entry_count - 1] = 0;
	remote_sizes[entry_count - 1] = 0;
	selected[entry_count - 1] = 0;

	entry_count--;

	save_entries();
	save_counts();
	rebuild_hostfile_headers_from_urls();
}

/* 26.00 */ static void
remove_selected_entries(void)
{
	for (int i = entry_count - 1; i >= 0; i--) {
		if (selected[i]) {
			remove_entry(i);
		}
	}

	/* reset selection */
	for (int i = 0; i < MAX_ENTRIES; i++)
		selected[i] = 0;
}

/* 27.00 */ static void
rebuild_hostfile_headers_from_urls(void)
{
	FILE *in = fopen(hosts_path, "r");
	FILE *out = fopen("/tmp/hosts_reindexed", "w");
	char line[MAX_LINE_LEN];
	int entry_idx = 0;
	int inside_block = 0;

	if (!in || !out) {
		if (in) fclose(in);
		if (out) fclose(out);
		return;
	}

	while (fgets(line, sizeof(line), in)) {
		if (strncmp(line, "# ", 2) == 0) {
			if (entry_idx < entry_count) {
				fprintf(out, "# %d. %s\n", entry_idx + 1, entries[entry_idx]);
				inside_block = 1;
				entry_idx++;
			} else {
				inside_block = 0;
			}
			continue;
		}

		if (inside_block || line[0] == '\n') {
			fputs(line, out);
		}
	}

	fclose(in);
	fclose(out);
	rename("/tmp/hosts_reindexed", hosts_path);
}

/* 28.00 */ static void
merge_entry(int index)
{
	FILE *in, *out;
	const char *url, *p, *end;
	char error_msg[CURL_ERROR_SIZE] = {0};
	char *new_content;
	char line[MAX_LINE_LEN];
	char header[MAX_LINE_LEN];
	char buffer[MAX_LINE_LEN];
	int skip;
	size_t len;

	if (index < 0 || index >= entry_count)
		return;

	if (!has_network_connection()) {
		print_footer("Error: No network connection.");
		refresh();
		napms(2000);
		return;
	}

	if (is_local_entry(entries[index]))
		return;

	if (updates_counts[index] == domains_counts[index]) {
		print_footer("Already up to date.");
		refresh();
		napms(1500);
		return;
	}

	print_footer("Merging %s ...", entries[index]);
	refresh();

	url = entries[index];
	new_content = download_url(url, error_msg, sizeof(error_msg));

	if (!new_content) {
		print_footer("Error during download: %s", error_msg);
		refresh();
		napms(2000);
		return;
	}

	if (!contains_valid_hosts_entry(new_content)) {
		print_footer("Error: No valid hosts line.");
		refresh();
		free(new_content);
		napms(2000);
		return;
	}

	if (!check_write_hosts(true)) {
		free(new_content);
		return;
	}

	in = fopen(hosts_path, "r");
	out = fopen("/tmp/hosts_merge_temp", "w");

	if (!in || !out) {
		if (in) fclose(in);
		if (out) fclose(out);
		free(new_content);
		return;
	}

	skip = 0;
	snprintf(header, sizeof(header), "# %d. %s", index + 1, url);

	while (fgets(line, sizeof(line), in)) {
		if (strncmp(line, "# ", 2) == 0) {
			if (strncmp(line, header, strlen(header)) == 0) {
				skip = 1;
				continue;
			} else {
				skip = 0;
			}
		}
		if (!skip)
			fputs(line, out);
	}

	fclose(in);

	fprintf(out, "%s\n", header);
	p = new_content;

	while (*p) {
		end = strchr(p, '\n');
		len = end ? (size_t)(end - p) : strlen(p);

		if (len > 0 && len < sizeof(buffer)) {
			memcpy(buffer, p, len);
			buffer[len] = '\0';
			if (strncmp(buffer, "0.0.0.0 ", 8) == 0)
				fprintf(out, "%s\n", buffer);
		}

		if (!end)
			break;
		p = end + 1;
	}

	fclose(out);
	rename("/tmp/hosts_merge_temp", hosts_path);
	free(new_content);

	domains_counts[index] = count_hosts_in_section(index);
	updates_counts[index] = domains_counts[index];
	remote_sizes[index]   = get_remote_content_length(entries[index]);
	save_counts();
}

/* 29.00 */  static void
merge_selected_entries(void)
{
	int i;

	if (!check_write_hosts(true))
		return;

	for (i = 0; i < entry_count; i++) {
		if (selected[i] && !is_local_entry(entries[i]))
			merge_entry(i);
	}

	for (i = 0; i < MAX_ENTRIES; i++)
		selected[i] = 0;
}

/* 30.00 */ static void
rename_entry(int index)
{
	FILE *in, *out;
	char input[MAX_LINE_LEN] = {0};
	char line[MAX_LINE_LEN];
	char old_header[MAX_LINE_LEN];
	char new_header[MAX_LINE_LEN];
	int input_start_x, pos, ch, next;

	if (index < 0 || index >= entry_count)
		return;

	if (!is_local_entry(entries[index]))
		return;

	echo();
	curs_set(1);

	/* footer-prompt */
	const char *prompt = "Rename to: ";
	print_footer("%s", prompt);

	input_start_x = (int)strlen(prompt);
	apply_color(&config.footer, 2);
	mvhline(LINES - 1, input_start_x, ' ', MAX_LINE_LEN - 1);

	strncpy(input, entries[index], MAX_LINE_LEN - 1);
	pos = strlen(input);

	mvprintw(LINES - 1, input_start_x, "%s", input);
	move(LINES - 1, input_start_x + pos);
	refresh();

	while ((ch = getch()) != '\n' && ch != ERR) {
		if (ch == 27) {
			nodelay(stdscr, 1);
			next = getch();
			nodelay(stdscr, 0);
			if (next == ERR) {
				remove_color(&config.footer, 2);
				noecho();
				curs_set(0);
				move(LINES - 1, 0);
				clrtoeol();
				refresh();
				return;
			} else {
				ungetch(next);
			}
		} else if (ch == KEY_BACKSPACE || ch == 127) {
			if (pos > 0) {
				pos--;
				input[pos] = '\0';
				mvaddch(LINES - 1, input_start_x + pos, ' ');
			}
			move(LINES - 1, input_start_x + pos);
		} else if (pos < MAX_LINE_LEN - 1 && isprint(ch)) {
			input[pos++] = ch;
			input[pos] = '\0';
			mvaddch(LINES - 1, input_start_x + pos - 1, ch);
			move(LINES - 1, input_start_x + pos);
		}
		refresh();
	}

	remove_color(&config.footer, 2);

	noecho();
	curs_set(0);
	move(LINES - 1, 0);
	clrtoeol();
	refresh();

	if (pos == 0 || strspn(input, " \t") == strlen(input))
		return;

	if (!check_write_hosts(true))
		return;

	snprintf(old_header, sizeof(old_header),
			 "# %d. %s", index + 1, entries[index]);
	snprintf(new_header, sizeof(new_header),
			 "# %d. %.220s", index + 1, input);

	in = fopen(hosts_path, "r");
	out = fopen("/tmp/hosts_rename_temp", "w");

	if (!in || !out) {
		if (in) fclose(in);
		if (out) fclose(out);
		return;
	}

	while (fgets(line, sizeof(line), in)) {
		if (strncmp(line, old_header, strlen(old_header)) == 0) {
			fprintf(out, "%s\n", new_header);
		} else {
			fputs(line, out);
		}
	}

	fclose(in);
	fclose(out);
	rename("/tmp/hosts_rename_temp", hosts_path);

	free(entries[index]);
	entries[index] = strdup(input);
	save_entries();

	display_entries(index);
}

/* 31.00 */ const char *
get_action_for_key(int key)
{
	for (int i = 0; i < keybinding_count; i++) {
		if (keybindings[i].key == key)
			return keybindings[i].action;
	}
	return NULL;
}

/* 32.00 */ static int
has_network_connection(void)
{
	struct addrinfo hints = {0}, *res = NULL;
	int result;

	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	/* try resolving google.com */
	result = getaddrinfo("google.com", NULL, &hints, &res);
	if (res)
		freeaddrinfo(res);

	return result == 0;
}

/* 33.00 */ int
main(int argc, char *argv[])
{
	int ch;
	const char *editor = getenv("EDITOR");

	/* load config file */
	load_config();

	/* resolve default config paths via XDG */
	get_config_path("counts", counts_path, sizeof(counts_path));
	get_config_path("urls", urls_path, sizeof(urls_path));
	get_config_path("fetch.lock", fetch_lock_path, sizeof(fetch_lock_path));

	/* initialize locale and curl */
	setlocale(LC_ALL, "");
	curl_global_init(CURL_GLOBAL_DEFAULT);
	update_progress = -1;

	/* load saved state */
	load_entries();
	load_counts();

	/* check for ongoing background fetches */
	if (pipe(update_pipe) < 0) {
		perror("pipe");
	} else {
		fcntl(update_pipe[0], F_SETFL, O_NONBLOCK);
		fcntl(update_pipe[1], F_SETFD, 0);
	}

	if (fetch_lock_exists() && !is_fetch_lock_empty()) {
		is_checking = 1;
		start_update_in_background();
	} else {
		is_checking = 0;
	}

	if (argc == 2 && (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))) {
		printf("Usage: hfc [OPTION]\n\n");
		printf("Options:\n");
		printf("  -h, --help              Show usage information.\n");
		printf("  -a, --add <url/list>    Add a remote URL or custom list.\n");
		printf("  -r, --remove <url/list> Remove a remote URL (https://...) or custom list.\n");
		printf("  -e, --edit <list>       Edit a local entry section with \033[1m$EDITOR\033[0m\n");
		printf("  -U, --update_all        Update all remote sources\n");
		printf("\nReport bugs via xmpp to chat@marlonivo.xyz.\n");
		return 0;
	}

	if (argc == 2 && (
		!strcmp(argv[1], "-a") || !strcmp(argv[1], "--add") ||
		!strcmp(argv[1], "-r") || !strcmp(argv[1], "--remove") ||
		!strcmp(argv[1], "-e") || !strcmp(argv[1], "--edit")
	)) {
		fprintf(stderr,
				"hosts file client\n"
				"usage: hfc '%s' <url/list>\n"
				"\n"
				"Use -h to get help or, even better, run 'man hfc'\n", argv[1]);
		return 1;
	}

	if (argc == 3 && (!strcmp(argv[1], "-a") || !strcmp(argv[1], "--add"))) {
		char *url = argv[2];

		if (!has_network_connection()) {
			fprintf(stderr, "Error: No network connection.\n");
			return 1;
		}

		char error_msg[CURL_ERROR_SIZE] = {0};
		char *content = download_url(url, error_msg, sizeof(error_msg));

		if (!content) {
			fprintf(stderr, "Download failed: %s\n", error_msg);
			return 1;
		}

		if (!contains_valid_hosts_entry(content)) {
			fprintf(stderr, "Error: No valid hosts entries found.\n");
			free(content);
			return 1;
		}

		if (entry_count >= MAX_ENTRIES) {
			fprintf(stderr, "Error: Maximum number of entries reached.\n");
			free(content);
			return 1;
		}

		if (!check_write_hosts(true)) {
			free(content);
			return 1;
		}

		entries[entry_count] = strdup(url);
		entry_count++;
		save_entries();

		if (!save_to_hosts_file(content, url, entry_count)) {
			fprintf(stderr, "Error: Could not write to hosts.\n");
			free(content);
			return 1;
		}

		int local_count = count_hosts_in_section(entry_count - 1);
		domains_counts[entry_count - 1] = local_count;
		update_domain_count(entry_count - 1);
		save_counts();
		free(content);

		printf("Entry added successfully: %s\n", url);
		return 0;
	}

	if (argc == 3 && (!strcmp(argv[1], "-r") || !strcmp(argv[1], "--remove"))) {
		char *url = argv[2];
		int found = -1;

		for (int i = 0; i < entry_count; i++) {
			if (strcmp(entries[i], url) == 0) {
				found = i;
				break;
			}
		}

		if (found == -1) {
			fprintf(stderr, "Entry not found: %s\n", url);
			return 1;
		}

		if (!check_write_hosts(true)) {
			return 1;
		}

		remove_entry(found);
		printf("Entry removed successfully: %s\n", url);
		return 0;
	}

	if (argc == 2 && (!strcmp(argv[1], "-U") || !strcmp(argv[1], "--update_all"))) {
		if (!has_network_connection()) {
			fprintf(stderr, "Error: No network connection.\n");
			return 1;
		}

		int total = 0;
		for (int i = 0; i < entry_count; i++) {
			if (!is_local_entry(entries[i])) total++;
		}

		int current = 0;
		for (int i = 0; i < entry_count; i++) {
			if (is_local_entry(entries[i])) continue;
			current++;
			printf("(%d/%d) updating %s\n", current, total, entries[i]);
			fflush(stdout);
			update_domain_count(i);
		}

		save_counts();
		printf("All sources updated.\n");
		return 0;
	}

	if (argc == 3 && (!strcmp(argv[1], "-e") || !strcmp(argv[1], "--edit"))) {
		char *url = argv[2];
		int found = -1;

		for (int i = 0; i < entry_count; i++) {
			if (strcmp(entries[i], url) == 0) {
				found = i;
				break;
			}
		}

		if (found == -1) {
			fprintf(stderr, "Entry not found: %s\n", url);
			return 1;
		}

		FILE *fp = fopen(hosts_path, "r");
		if (!fp) {
			fprintf(stderr, "Error: Could not open hosts\n");
			return 1;
		}

		char line[1024];
		int line_num = 0;
		int target_line = -1;
		char search_tag[256];
		snprintf(search_tag, sizeof(search_tag), "# %d. %s", found + 1, entries[found]);

		while (fgets(line, sizeof(line), fp)) {
			line_num++;
			if (strstr(line, search_tag)) {
				target_line = line_num;
				break;
			}
		}
		fclose(fp);

		if (target_line == -1) {
			fprintf(stderr, "Error: Entry header not found in hosts\n");
			return 1;
		}

		if (!check_write_hosts(true)) {
			return 1;
		}

		char cmd[1024];
		snprintf(cmd, sizeof(cmd), "%s +%d %s", editor, target_line, hosts_path);

		int ret = system(cmd);
		return ret;
	}

/* 34.00 */ initscr();

	/* respect terminal themes (e.g. gruvbox) */
	if (has_colors()) {
		start_color();
		use_default_colors();
		load_config();
		init_colors();
	}

	init_footer();

	/* non-blocking input */
	set_escdelay(10);
	cbreak();
	noecho();
	keypad(stdscr, TRUE);
	curs_set(0);
	timeout(100);

	/* render initial screen */
	display_entries(highlight);
	refresh();
	update_all_sources();

	while (1) {
		/* check for background fetches */
		int status;
		pid_t pid;
		while ((pid = waitpid(-1, &status, WNOHANG)) > 0) {
			load_counts();
			display_entries(highlight);
		}
		/* check update_pipe to refresh UI */
		int idx;
		while (read(update_pipe[0], &idx, sizeof(int)) > 0) {
			if (idx >= 0 && idx < entry_count) {
				display_entries(highlight);
			}
		}
		/* handle user input */
		ch = getch();

		if (ch == KEY_RESIZE) {
			endwin(); refresh(); clear();
			display_entries(highlight);
			continue;
		}

		if (ch == ERR) continue;

		/* dismiss help screen */
		if (in_help_mode) {
			in_help_mode = 0;
			display_entries(highlight);
			continue;
		}

		/* all keys */
		const char *action = get_action_for_key(ch);
		if (!action) continue;

		/* core actions */
		if (!strcmp(action, "quit")) break;
		else if (!strcmp(action, "select")) {
			selected[highlight] = !selected[highlight];
			display_entries(highlight);
		}
		else if (!strcmp(action, "select_all")) {
			for (int i = 0; i < entry_count; i++) selected[i] = 1;
			display_entries(highlight);
		}
		else if (!strcmp(action, "unselect_all")) {
			for (int i = 0; i < entry_count; i++) selected[i] = 0;
			display_entries(highlight);
		}
		else if (!strcmp(action, "up")) {
			if (highlight > 0) highlight--;
			display_entries(highlight);
		}
		else if (!strcmp(action, "down")) {
			if (highlight < entry_count - 1) highlight++;
			display_entries(highlight);
		}
		else if (!strcmp(action, "rename")) {
			if (entry_count > 0 && is_local_entry(entries[highlight])) {
				timeout(-1);
				rename_entry(highlight);
				timeout(100);
				display_entries(highlight);
			}
		}
		else if (!strcmp(action, "refresh")) {
			load_config(); init_colors();
			clear(); load_entries(); load_counts();
			if (highlight >= entry_count) highlight = entry_count - 1;
			if (highlight < 0) highlight = 0;
			display_entries(highlight);
		}
		else if (!strcmp(action, "order")) {
			if (entry_count > 1) {
				timeout(-1);

				char prompt[64];
				snprintf(prompt, sizeof(prompt), "Move to position (1-%d): ", entry_count);
				print_footer("  %s", prompt);

				int input_col = 2 + (int)strlen(prompt);
				char input[8] = {0};

				apply_color(&config.footer, 2);
				mvhline(LINES - 1, input_col, ' ', sizeof(input));

				echo();
				curs_set(1);
				int ch = getch();
				if (ch == 27) {
					noecho();
					curs_set(0);
					remove_color(&config.footer, 2);
					display_entries(highlight);
					timeout(100);
					continue;
				}
				ungetch(ch);
				mvgetnstr(LINES - 1, input_col, input, sizeof(input) - 1);
				clrtoeol();

				remove_color(&config.footer, 2);
				noecho();
				curs_set(0);

				int new_pos = atoi(input) - 1;
				if (new_pos >= 0 && new_pos < entry_count && new_pos != highlight) {
					reorder_entry(highlight, new_pos);
					highlight = new_pos;
					display_entries(highlight);
				} else {
					print_footer("Invalid position.");
					refresh();
					napms(1000);
					display_entries(highlight);
				}

				timeout(100);
			}
		}
		else if (!strcmp(action, "remove")) {
			if (entry_count > 0) {
				int selected_any = 0;
				for (int i = 0; i < entry_count; i++) {
					if (selected[i]) { selected_any = 1; break; }
				}
				timeout(-1);
				if (selected_any) {
					print_footer("Delete selected entries? (y/n): ");
				} else {
					print_footer("Remove %s? (y/n): ", entries[highlight]);
				}
				int confirm = getch();
				timeout(100);

				if (confirm == 'y' || confirm == 'Y') {
					if (selected_any) {
						print_footer("Deleting selected entries...");
						refresh();
						napms(100);
						remove_selected_entries();
						for (int i = 0; i < MAX_ENTRIES; i++) selected[i] = 0;
						highlight = 0;
					} else {
						print_footer("Deleting...");
						refresh();
						napms(100);
						remove_entry(highlight);
						if (highlight >= entry_count && highlight > 0) highlight--;
					}
					display_entries(highlight);
				} else {
					display_entries(highlight);
				}
			}
		}
		else if (!strcmp(action, "help")) {
			in_help_mode = 1;
			display_help();
		}
		else if (!strcmp(action, "add")) {
			timeout(-1);
			add_entry();
			timeout(100);
			display_entries(highlight);
		}
		else if (!strcmp(action, "edit")) {
			if (entry_count > 0) {
				edit_entry(highlight);
				display_entries(highlight);
			}
		}
		else if (!strcmp(action, "update")) {
			int any = 0;
			for (int i = 0; i < entry_count; i++) {
				if (selected[i]) { any = 1; break; }
			}
			if (!has_network_connection()) {
				print_footer("Error: No network connection.");
				napms(2000);
				display_entries(highlight);
				continue;
			}
			if (any) {
				print_footer("Updating selected entries...");
				update_selected_sources();
			} else {
				long before = remote_sizes[highlight];
				long after = get_remote_content_length(entries[highlight]);
				if (after > 0 && after != before) {
					print_footer("Updating %s...", entries[highlight]);
					update_domain_count(highlight);
					domains_counts[highlight] = count_hosts_in_section(highlight);
					updates_counts[highlight] = domains_counts[highlight];
					save_counts();
				} else {
					print_footer("No updates available.");
					napms(1500);
				}
			}
			display_entries(highlight);
		}
		else if (!strcmp(action, "update_all")) {
			if (!has_network_connection()) {
				print_footer("Error: No network connection.");
				napms(2000);
				display_entries(highlight);
				continue;
			}
			update_all_sources();
			display_entries(highlight);
		}
		else if (!strcmp(action, "merge")) {
			if (entry_count > 0 && !is_local_entry(entries[highlight])) {
				int any = 0;
				for (int i = 0; i < entry_count; i++) {
					if (selected[i]) { any = 1; break; }
				}
				if (any) {
					print_footer("Merging selected entries...");
					merge_selected_entries();
				} else {
					merge_entry(highlight);
				}
				display_entries(highlight);
			}
		}
	}

	free_entries();
	endwin();
	curl_global_cleanup();
	return 0;
}
