#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <ctype.h>


#define MAX_LINES 10000
#define MAX_LINE_LENGTH 4096

// --- Utility Functions ---
int fileExists(const char *filename) {
    struct stat buffer;
    return (stat(filename, &buffer) == 0);
}

char **loadFile(const char *filename, int *line_count) {
    struct stat st;
    FILE *fp = fopen(filename, "rb");
    *line_count = 0;

    if (!fp) {
        char **lines = malloc(sizeof(char*) * 4);
        lines[0] = strdup("");
        *line_count = 1;
        return lines;
    }

    if (fstat(fileno(fp), &st) != 0 || st.st_size == 0) {
        // empty file
        fclose(fp);
        char **lines = malloc(sizeof(char*) * 4);
        lines[0] = strdup("");
        *line_count = 1;
        return lines;
    }

    off_t size = st.st_size;
    char *filebuf = malloc(size + 1);
    if (!filebuf) {
        fclose(fp);
        char **lines = malloc(sizeof(char*) * 4);
        lines[0] = strdup("");
        *line_count = 1;
        return lines;
    }

    size_t read = fread(filebuf, 1, size, fp);
    fclose(fp);
    filebuf[read] = '\0';


    size_t est = 1;
    for (size_t i = 0; i < read; i++) if (filebuf[i] == '\n') est++;
    char **lines = malloc(sizeof(char*) * (est + 2));
    size_t idx = 0;

    char *start = filebuf;
    for (size_t i = 0; i < read; ++i) {
        char c = filebuf[i];
        if (c == '\r') {
            filebuf[i] = '\0';
        } else if (c == '\n') {
            filebuf[i] = '\0';
            size_t len = start ? strlen(start) : 0;
            char *line = malloc(len + 1);
            if (line) memcpy(line, start, len + 1);
            else line = strdup("");
            lines[idx++] = line;
            start = filebuf + i + 1;
        }
    }

    // trailing data after last newline
    if (start <= filebuf + read) {
        size_t len = strlen(start);
        char *line = malloc(len + 1);
        if (line) memcpy(line, start, len + 1);
        else line = strdup("");
        lines[idx++] = line;
    }

    free(filebuf);

    if (idx == 0) {
        lines[0] = strdup("");
        idx = 1;
    }

    *line_count = (int)idx;
    return lines;
}

int confirmOverwrite(const char *filename, int max_col) {
    char prompt[256];
    snprintf(prompt, sizeof(prompt), "File '%s' exists! Overwrite? (y/n): ", filename);
    mvhline(LINES-2, 0, ' ', max_col);
    mvprintw(LINES-2, 0, "%s", prompt);
    refresh();

    int ch;
    while (1) {
        ch = getch();
        if (ch == 'y' || ch == 'Y') return 1;
        if (ch == 'n' || ch == 'N') return 0;
    }
}

void saveFile(const char *filename, char **lines, int line_count) {
    int max_row, max_col;
    getmaxyx(stdscr, max_row, max_col);

    if (fileExists(filename)) {
        if (!confirmOverwrite(filename, max_col)) {
            return;
        }
    }

    // compute total size and build a single buffer to minimize I/O calls
    size_t total = 0;
    for (int i = 0; i < line_count; i++) {
        total += strlen(lines[i]);
        total += 1; // newline
    }

    char *outbuf = malloc(total + 1);
    if (!outbuf) return;

    char *p = outbuf;
    for (int i = 0; i < line_count; i++) {
        size_t len = strlen(lines[i]);
        memcpy(p, lines[i], len);
        p += len;
        *p++ = '\n';
    }
    *p = '\0';

    FILE *fp = fopen(filename, "wb");
    if (!fp) {
        free(outbuf);
        return;
    }

    // set full buffering for fewer system calls
    static char filebuf[8192];
    setvbuf(fp, filebuf, _IOFBF, sizeof(filebuf));

    fwrite(outbuf, 1, total, fp);
    fclose(fp);
    free(outbuf);
}

// --- Syntax Highlighting ---

typedef struct {
    const char *word;
    int color;
} KeywordColor;

KeywordColor keyword_colors[] = {
    {"int", 3}, {"char", 3}, {"return", 4}, {"if", 4}, {"else", 4},
    {"for", 4}, {"while", 4}, {"break", 4}, {"continue", 4}, {"void", 3},
    {"double", 3}, {"float", 3}, {"struct", 5}, {"typedef", 3},
    {"include", 6},{"main", 6}, {"define", 6}, {"NULL", 3}, {"static", 3},
    {"const", 3}, {"unsigned", 3}, {"signed", 3}, {"sizeof", 3},
    {"printf", 6}, {"scanf", 6}, {"malloc", 6}, {"free", 6},
    {"switch", 4}, {"case", 4}, {"default", 4}, {"do", 4},
    {"long", 3}, {"short", 3}, {"volatile", 3}, {"extern", 3}, {"inline", 3},
    {"register", 3}, {"auto", 3}, {"goto", 4}, {"enum", 5}, {"union", 5},
    {"asm", 6}, {"_Bool", 3}, {"true", 3}, {"false", 3}, {"pragma", 6},
    {"strcpy", 6}, {"strncpy", 6}, {"memcpy", 6}, {"memset", 6}, {"memcmp", 6},
    {"fopen", 6}, {"fclose", 6}, {"fread", 6}, {"fwrite", 6}, {"fseek", 6},
    {"(", 6}, {")", 6}, {"{", 4}, {"}", 4},
    {"ftell", 6}, {"fprintf", 6}, {"sprintf", 6}, {"sscanf", 6},
    {NULL, 0}
};

int getKeywordColor(const char *word) {
    for (int i = 0; keyword_colors[i].word != NULL; i++) {
        if (strcmp(word, keyword_colors[i].word) == 0)
            return keyword_colors[i].color;
    }
    return 0;
}

void printHighlightedLine(WINDOW *pad, int y, int x, const char *line) {
    int i = 0;
    int len = strlen(line);
    while (i < len) {
        // Comment
        if (line[i] == '/' && i+1 < len && line[i+1] == '/') {
            wattron(pad, COLOR_PAIR(8));
            mvwprintw(pad, y, x+i, "%s", line+i);
            wattroff(pad, COLOR_PAIR(8));
            break;
        }

        // String literal
        if (line[i] == '"') {
            int start = i++;
            while (i < len && (line[i] != '"' || line[i-1] == '\\')) i++;
            if (i < len) i++;
            wattron(pad, COLOR_PAIR(7));
            mvwprintw(pad, y, x+start, "%.*s", i-start, line+start);
            wattroff(pad, COLOR_PAIR(7));
            continue;
        }

        // Number
        if (isdigit(line[i]) && (i == 0 || !isalnum(line[i-1]))) {
            int start = i;
            while (i < len && (isdigit(line[i]) || line[i]=='.')) i++;
            wattron(pad, COLOR_PAIR(7));
            mvwprintw(pad, y, x+start, "%.*s", i-start, line+start);
            wattroff(pad, COLOR_PAIR(7));
            continue;
        }

        // Word (potential keyword)
        if (isalpha(line[i]) || line[i]=='_') {
            int start = i;
            while (i < len && (isalnum(line[i]) || line[i]=='_')) i++;
            char word[128];
            int wlen = i-start;
            strncpy(word, line+start, wlen);
            word[wlen] = 0;
            int color = getKeywordColor(word);
            if (color) wattron(pad, COLOR_PAIR(color));
            mvwprintw(pad, y, x+start, "%s", word);
            if (color) wattroff(pad, COLOR_PAIR(color));
            continue;
        }

        // Regular char
        mvwaddch(pad, y, x+i, line[i]);
        i++;
    }
}

// --- Status Bar ---
void drawStatusBar(const char *filename, int modified, int row, int col, int max_col, const char *msg) {
    attron(A_REVERSE);
    mvhline(LINES-1, 0, ' ', max_col);

    
    char left_status[256];
    snprintf(left_status, sizeof(left_status), " %s %s", 
             filename, modified ? "[Modified]" : "[Saved]");
    mvprintw(LINES-1, 0, "%s", left_status);

    
    char shortcuts[256];
    snprintf(shortcuts, sizeof(shortcuts), 
             "| ^S Save | ^Q Quit | ^F Find | ^G Goto | ^X Exit |");
    mvprintw(LINES-1, (max_col - strlen(shortcuts)) / 2, "%s", shortcuts);

    
    char right_status[256];
    snprintf(right_status, sizeof(right_status), "Ln %d, Col %d ", row+1, col+1);
    mvprintw(LINES-1, max_col - strlen(right_status), "%s", right_status);

    
    if (msg && strlen(msg) > 0) {
        mvprintw(LINES-1, max_col - strlen(msg) - strlen(right_status) - 1, "%s", msg);
    }

    attroff(A_REVERSE);
    refresh();
}
void ensure_lines_capacity(char ***lines_ptr, int *capacity, int min_needed) {
    if (*capacity >= min_needed) return;
    int newcap = *capacity ? *capacity : 1024;
    while (newcap < min_needed) newcap *= 2;
    char **tmp = realloc(*lines_ptr, sizeof(char*) * newcap);
    if (tmp) {
        *lines_ptr = tmp;
        *capacity = newcap;
    } else {
        // allocation failure: keep old capacity (best-effort)
    }
}

void nanoEditor(const char *filename) {
    int line_count;
    char **lines = loadFile(filename, &line_count);

    // ensure we have headroom for editing
    int lines_capacity = line_count + 256;
    if (lines_capacity < 1024) lines_capacity = 1024;
    char **tmp = realloc(lines, sizeof(char*) * lines_capacity);
    if (tmp) lines = tmp; // if realloc failed, keep original (low-memory fallback)

    int row = 0, col = 0, scroll_offset = 0;
    int modified = 0;
    char status_msg[128] = "";

    initscr();
    start_color();
    noecho();
    raw();
    keypad(stdscr, TRUE);
    set_escdelay(25);
    init_pair(1, COLOR_CYAN, COLOR_BLACK);
    init_pair(2, COLOR_WHITE, COLOR_BLACK);
    init_pair(3, COLOR_YELLOW, COLOR_BLACK);
    init_pair(4, COLOR_GREEN, COLOR_BLACK);
    init_pair(5, COLOR_MAGENTA, COLOR_BLACK);
    init_pair(6, COLOR_CYAN, COLOR_BLACK);
    init_pair(7, COLOR_RED, COLOR_BLACK);
    init_pair(8, COLOR_BLUE, COLOR_BLACK);

    int max_row, max_col;
    getmaxyx(stdscr, max_row, max_col);
    WINDOW *pad = newpad(MAX_LINES, max_col);

    while (1) {
        werase(pad);
        for (int i = scroll_offset; i < line_count && i - scroll_offset < max_row - 1; i++) {
            wattron(pad, COLOR_PAIR(1));
            mvwprintw(pad, i - scroll_offset, 0, "%3d ", i + 1);
            wattroff(pad, COLOR_PAIR(1));
            printHighlightedLine(pad, i - scroll_offset, 4, lines[i]);
        }
        prefresh(pad, 0, 0, 0, 0, max_row - 2, max_col - 1);
        drawStatusBar(filename, modified, row, col, max_col, status_msg);
        move(row - scroll_offset, col + 4);
        refresh();

        int ch = getch();

        if (ch == 24) { // ^X exit (as in original)
            saveFile(filename, lines, line_count);
            break;
        }
        if (ch == 19) { // ^S
            saveFile(filename, lines, line_count);
            modified = 0;
            strcpy(status_msg, "Saved!");
            continue;
        }
        if (ch == 17) { // ^Q
            if (modified) {
                strcpy(status_msg, "Unsaved changes! Press Ctrl+Q again to quit.");
                int confirm = getch();
                if (confirm == 17) break;
                continue;
            }
            break;
        }
        if (ch == 6) { // ^F search
            char query[256] = "";
            echo();
            mvhline(LINES-1, 0, ' ', max_col);
            mvprintw(LINES-1, 0, "Search: ");
            refresh();
            mvgetnstr(LINES-1, 8, query, sizeof(query)-1);
            noecho();
            if (strlen(query) == 0) {
                strcpy(status_msg, "Search cancelled");
                continue;
            }
            int found = 0;
            for (int pass = 0; pass < 2 && !found; pass++) {
                int start = (pass == 0) ? row : 0;
                int end = (pass == 0) ? line_count : row;
                for (int i = start; i < end; i++) {
                    char *p = strstr(lines[i], query);
                    if (p) {
                        row = i;
                        col = p - lines[i];
                        if (col > (int)strlen(lines[row])) col = strlen(lines[row]);
                        if (row < scroll_offset) scroll_offset = row;
                        else if (row - scroll_offset >= max_row - 1) scroll_offset = row - (max_row - 2);
                        snprintf(status_msg, sizeof(status_msg), "Found at Ln %d, Col %d", row+1, col+1);
                        found = 1;
                        break;
                    }
                }
            }
            if (!found) {
                snprintf(status_msg, sizeof(status_msg), "Not found: %s", query);
            }
            continue;
        }
        if (ch == 7) { // ^G goto
            char buf[32] = "";
            echo();
            mvhline(LINES-1, 0, ' ', max_col);
            mvprintw(LINES-1, 0, "Goto line: ");
            refresh();
            mvgetnstr(LINES-1, 11, buf, sizeof(buf)-1);
            noecho();
            int target = atoi(buf);
            if (target <= 0 || target > line_count) {
                snprintf(status_msg, sizeof(status_msg), "Invalid line: %s", buf);
                continue;
            }
            row = target - 1;
            if (col > (int)strlen(lines[row])) col = strlen(lines[row]);
            if (row < scroll_offset) scroll_offset = row;
            else if (row - scroll_offset >= max_row - 1) scroll_offset = row - (max_row - 2);
            snprintf(status_msg, sizeof(status_msg), "Jumped to line %d", target);
            continue;
        }

        switch (ch) {
            case KEY_UP:
                if (row > 0) row--;
                if (col > (int)strlen(lines[row])) col = strlen(lines[row]);
                if (row < scroll_offset) scroll_offset--;
                break;
            case KEY_DOWN:
                if (row < line_count - 1) row++;
                if (col > (int)strlen(lines[row])) col = strlen(lines[row]);
                if (row - scroll_offset >= max_row - 1) scroll_offset++;
                break;
            case KEY_LEFT:
                if (col > 0) col--;
                else if (row > 0) {
                    row--;
                    col = strlen(lines[row]);
                    if (row < scroll_offset) scroll_offset--;
                }
                break;
            case KEY_RIGHT:
                if (col < (int)strlen(lines[row])) col++;
                else if (row < line_count - 1) {
                    row++;
                    col = 0;
                    if (row - scroll_offset >= max_row - 1) scroll_offset++;
                }
                break;
            case 8: case 127: case KEY_BACKSPACE:
                if (col > 0) {
                    size_t cur_len = strlen(lines[row]);
                    memmove(&lines[row][col-1], &lines[row][col], cur_len - col + 1);
                    col--;
                    modified = 1;
                } else if (row > 0) {
                    int prev_len = strlen(lines[row-1]);
                    size_t newlen = prev_len + strlen(lines[row]) + 1;
                    char *merged = realloc(lines[row-1], newlen);
                    if (merged) {
                        lines[row-1] = merged;
                        strcat(lines[row-1], lines[row]);
                    } else {
                        // fall back: try to allocate a fresh buffer
                        char *tmpbuf = malloc(newlen);
                        if (tmpbuf) {
                            strcpy(tmpbuf, lines[row-1]);
                            strcat(tmpbuf, lines[row]);
                            free(lines[row-1]);
                            lines[row-1] = tmpbuf;
                        }
                    }
                    free(lines[row]);
                    for (int i = row; i < line_count - 1; i++) lines[i] = lines[i+1];
                    line_count--;
                    row--;
                    col = prev_len;
                    modified = 1;
                }
                break;
            case '\n': {
                // Create tail first
                char *tail = strdup(lines[row] + col);
                if (!tail) tail = strdup("");
                lines[row][col] = '\0';

                // make room
                line_count++;
                ensure_lines_capacity(&lines, &lines_capacity, line_count + 1);

                // shift down entries to make slot at row+1
                for (int i = line_count - 1; i > row + 1; i--) {
                    lines[i] = lines[i-1];
                }
                lines[row+1] = tail;
                row++;
                col = 0;
                modified = 1;
                break;
            }
            default:
                if (ch >= 32 && ch <= 126) {
                    size_t len = strlen(lines[row]);
                    int newlen = (int)len + 1;
                    char *new_line = malloc(newlen + 1);
                    if (new_line) {
                        // copy left part
                        if (col > 0) memcpy(new_line, lines[row], col);
                        // insert char
                        new_line[col] = (char)ch;
                        // copy right part including null terminator
                        memcpy(new_line + col + 1, lines[row] + col, len - col + 1);
                        free(lines[row]);
                        lines[row] = new_line;
                        col++;
                        modified = 1;
                    }
                }
                break;
        }
    }

    delwin(pad);
    endwin();

    for (int i = 0; i < line_count; i++) free(lines[i]);
    free(lines);
}

// --- Main ---
int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: quill <filename>\n");
        printf("       quill uninstall    (uninstalls quill)\n");
        printf("       quill update       (updates quill)\n");
        return 1;
    }

    if (strcmp(argv[1], "uninstall") == 0) {
        system("sudo rm -f /usr/local/bin/quill");
        printf("Quill has been uninstalled.\n");
        return 0;
    }

    if (strcmp(argv[1], "update") == 0) {
        system("bash update.sh");
        printf("Quill has been updated.\n");
        return 0;
    }

    nanoEditor(argv[1]);
    return 0;
}
