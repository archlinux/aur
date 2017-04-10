/*
 ⋅ ⋅⋅ ” ’ ♯ ☢ ☍ ⌘ ✰ ⣿ ⚡ ☯ ⚑ ↺ ⤴ ⤵ ∆ ⌚ ≀∇ ✇ ⚠ ◔ ⚡ ↯ ¿ ⨂ ✖ ⇣ ⇡  ⠁ ⠉ ⠋ ⠛ ⠟ ⠿ ⡿ ⣿ ☹ ➀ ➁ ➂ ➃ ➄ ➅ ➆ ➇ ➈ ➉ ▹ ╍ ▪ ⚯ ⚒ ◌ ⇅ ↡ ↟ ⊛ ♺

 ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳


python -c 'print u"\u22c5 \u22c5\u22c5 \u201d \u2019 \u266f \u2622 \u260d \u2318 \u2730 " \
    u"\u28ff \u26a1 \u262f \u2691 \u21ba \u2934 \u2935 \u2206 \u231a \u2240\u2207 \u2707 " \
    u"\u26a0\xa0\u25d4 \u26a1\xa0\u21af \xbf \u2a02 \u2716 \u21e3 \u21e1  \u2801 \u2809 " \
    u"\u280b \u281b \u281f \u283f \u287f \u28ff \u2639 \u2780 \u2781 \u2782 \u2783 \u2784 " \
    u"\u2785 \u2786 \u2787 \u2788 \u2789 \u25b9\xa0\u254d \u25aa \u26af \u2692 \u25cc " \
    u"\u21c5 \u21a1 \u219f \u229b \u267a ".encode("utf8")'
*/

#include "ui_pyroscope.h"

#include "config.h"
#include "globals.h"

#include <cstdio>
#include <cwchar>
#include <list>
#include <stdlib.h>
#include <unistd.h>

#include <rak/algorithm.h>

#include "core/view.h"
#include "core/manager.h"
#include "core/download.h"
#include "torrent/tracker.h"
#include "torrent/rate.h"
#include "display/window.h"
#include "display/canvas.h"
#include "display/utils.h"
#include "ui/root.h"
#include "ui/download_list.h"

#include "control.h"
#include "command_helpers.h"

#if (RT_HEX_VERSION >= 0x000901)
    #define _cxxstd_ tr1
#else
    #define _cxxstd_ std
#endif

#define D_INFO(item) (item->info())
#include "rpc/object_storage.h"

// from command_pyroscope.cc
extern torrent::Tracker* get_active_tracker(torrent::Download* item);
extern std::string get_active_tracker_domain(torrent::Download* item);


#define TRACKER_LABEL_WIDTH 20U

// definition from display/window_download_list.cc that is not in the header file
typedef std::pair<core::View::iterator, core::View::iterator> Range;

// display attribute map (normal, even, odd)
static unsigned long attr_map[3 * ps::COL_MAX] = {0};

// color indices for progress indication
int ratio_col[] = {
    ps::COL_PROGRESS0, ps::COL_PROGRESS20, ps::COL_PROGRESS40, ps::COL_PROGRESS60, ps::COL_PROGRESS80,
    ps::COL_PROGRESS100, ps::COL_PROGRESS120,
};

// basic color names
static const char* color_names[] = {
    "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white"
};

// list of color configuration variables, the order MUST correspond to the ColorKind enum
static const char* color_vars[ps::COL_MAX] = {
    0,
    "ui.color.progress0",
    "ui.color.progress20",
    "ui.color.progress40",
    "ui.color.progress60",
    "ui.color.progress80",
    "ui.color.progress100",
    "ui.color.progress120",
    "ui.color.complete",
    "ui.color.seeding",
    "ui.color.stopped",
    "ui.color.queued",
    "ui.color.incomplete",
    "ui.color.leeching",
    "ui.color.alarm",
    "ui.color.title",
    "ui.color.footer",
    "ui.color.label",
    "ui.color.odd",
    "ui.color.even",
    "ui.color.info",
    "ui.color.focus",
};

// collapsed state of views (default is false)
static std::map<std::string, bool> is_collapsed;

// tracker aliases map
typedef std::map<std::string, std::string> string_kv_map;
static string_kv_map tracker_aliases;

// Traffic history
static int network_history_depth = 0;
static uint32_t network_history_count = 0;
static uint32_t* network_history_up = 0;
static uint32_t* network_history_down = 0;
static std::string network_history_up_str;
static std::string network_history_down_str;


// Chop off an UTF-8 string
std::string u8_chop(const std::string& text, size_t glyphs) {
    std::mbstate_t mbs = std::mbstate_t();
    int bytes = 0, skip;
    const char* pos = text.c_str();

    while (*pos && glyphs-- > 0 && (skip = std::mbrlen(pos, text.length() - bytes, &mbs)) > 0) {
        pos += skip;
        bytes += skip;
    }

    return bytes < text.length() ? text.substr(0, bytes) : text;
}


// get custom field contaioning a long (time_t)
unsigned long get_custom_long(core::Download* d, const char* name) {
    try {
        return atol(d->bencode()->get_key("rtorrent").get_key("custom").get_key_string(name).c_str());
    } catch (torrent::bencode_error& e) {
        return 0UL;
    }
}


// get custom field contaioning a string
std::string get_custom_string(core::Download* d, const char* name) {
    try {
        return d->bencode()->get_key("rtorrent").get_key("custom").get_key_string(name);
    } catch (torrent::bencode_error& e) {
        return "";
    }
}


// convert absolute timestamp to approximate human readable time diff (5 chars wide)
std::string elapsed_time(unsigned long dt)  {
    if (dt == 0) return std::string("⋅ ⋅⋅ ");

    const char* unit[] = {"”", "’", "h", "d", "w", "m", "y"};
    unsigned long threshold[] = {1, 60, 3600, 86400, 7*86400, 30*86400, 365*86400, 0};

    int dim = 0;
    dt = time(NULL) - dt;
    while (threshold[dim] && dt >= threshold[dim]) ++dim;
    if (dim) --dim;
    float val = float(dt) / float(threshold[dim]);

    char buffer[15];
    if (val < 10.0 && dim) {
        snprintf(buffer, sizeof(buffer), "%1d%s%2d%s", int(val), unit[dim],
            int(dt % threshold[dim] / threshold[dim-1]), unit[dim-1]);
    } else {
        snprintf(buffer, sizeof(buffer), "%4d%s", int(val), unit[dim]);
    }
    return std::string(buffer);
}


// return 2-digits number, or digit + dimension indicator
std::string num2(int64_t num) {
    if (num < 0 || 10*1000*1000 <= num) return std::string("♯♯");
    if (!num) return std::string(" ·");

    char buffer[10];
    if (num < 100) {
        snprintf(buffer, sizeof(buffer), "%2d", int(num));
    } else {
        // Roman numeral multipliers 10, 100, 1000, 10x1000, 100x1000, 1000x1000
        const char* roman = " xcmXCM";
        int dim = 0;
        while (num > 9) { ++dim; num /= 10; }
        snprintf(buffer, sizeof(buffer), "%1d%c", int(num), roman[dim]);
    }

    return std::string(buffer);
}


namespace display {


// function wrapper for what possibly is a macro
static int get_colors() {
    return COLORS;
}


// format byte size for humans, if format = 0 use 6 chars (one decimal place),
// if = 1 just print the rounded value (4 chars), if = 2 combine the two formats
// into 4 chars by rounding for values >= 9.95.
// set bit 8 of format and 0 values will return a whitespace string of the correct length.
std::string human_size(int64_t bytes, unsigned int format=0) {
    if (format & 8 && bytes <= 0) return std::string((format & 7) ? 4 : 6, ' ');
    format &= 7;

    int exp;
    char unit;

    if (bytes < (int64_t(1000) << 10))          { exp = 10; unit = 'K'; }
    else if (bytes < (int64_t(1000) << 20))     { exp = 20; unit = 'M'; }
    else if (bytes < (int64_t(1000) << 30))     { exp = 30; unit = 'G'; }
    else                                        { exp = 40; unit = 'T'; }

    char buffer[48];
    double value = double(bytes) / (int64_t(1) << exp);
    const char* formats[] = {"%5.1f%c", "%3.0f%c", "%3.1f%c"};

    if (format > 2) format = 0;
    if (format == 2 and value >= 9.949999) format = 1;
    if (format == 1) value = int(value + 0.50002);
    snprintf(buffer, sizeof(buffer), formats[format], value, unit);

    return std::string(buffer);
}


// split a given string into words separated by delim, and add them to the provided vector
void split(std::vector<std::string>& words, const char* str, char delim = ' ') {
    do {
        const char* begin = str;
        while (*str && *str != delim) str++;
        words.push_back(std::string(begin, str));
    } while (*str++);
}


void ui_pyroscope_canvas_init(); // forward
static bool color_init_recursion = false;

// create color map from configuration strings
void ui_pyroscope_colormap_init() {
    // if in early startup stage (configuration), then init the screen so we can query system constants
    if (!get_colors()) {
        if (color_init_recursion) {
            color_init_recursion = false;
            control->core()->push_log("Terminal color initialization failed, does your terminal have none?!");
        } else {
            color_init_recursion = true;
            initscr();
            ui_pyroscope_canvas_init(); // this calls us again!
        }
        return;
    }
    color_init_recursion = false;

    // Those hold the background colors of "odd" and "even"
    int bg_odd = -1;
    int bg_even = -1;

    // read the definition for basic colors from configuration
    for (int k = 1; k < ps::COL_MAX; k++) {
        init_pair(k, -1, -1);
        std::string col_def = rpc::call_command_string(color_vars[k]);
        if (col_def.empty()) continue; // use terminal default if definition is empty

        std::vector<std::string> words;
        split(words, col_def.c_str());

        short col[2] = {-1, -1}; // fg, bg
        short col_idx = 0; // 0 = fg; 1 = bg
        short bright = 0;
        unsigned long attr = A_NORMAL;
        for (int i = 0; i < words.size(); i++) { // look at all the words
            if (words[i] == "bold") attr |= A_BOLD;
            else if (words[i] == "standout") attr |= A_STANDOUT;
            else if (words[i] == "underline") attr |= A_UNDERLINE;
            else if (words[i] == "reverse") attr |= A_REVERSE;
            else if (words[i] == "blink") attr |= A_BLINK;
            else if (words[i] == "dim") attr |= A_DIM;
            else if (words[i] == "on") { col_idx = 1; bright = 0; } // switch to background color
            else if (words[i] == "gray") col[col_idx] = bright ? 7 : 8; // bright gray is white
            else if (words[i] == "bright") bright = 8;
            else if (words[i].find_first_not_of("0123456789") == std::string::npos) {
                // handle numeric index
                short c = -1;
                sscanf(words[i].c_str(), "%hd", &c);
                col[col_idx] = c;
            } else for (short c = 0; c < 8; c++) { // check for basic color names
                if (words[i] == color_names[c]) {
                    col[col_idx] = bright + c;
                    break;
                }
            }
        }

        // check that fg & bg color index is valid
        if (col[0] != -1 && col[0] >= get_colors() || col[1] != -1 && col[1] >= get_colors()) {
            char buf[33];
            sprintf(buf, "%d", get_colors());
            Canvas::cleanup();
            throw torrent::input_error(col_def + ": your terminal only supports " + buf + " colors.");
        }

        // store the parsed color definition
        attr_map[k] = attr;
        init_pair(k, col[0], col[1]);
        if (k == ps::COL_EVEN) bg_even = col[1];
        if (k == ps::COL_ODD)  bg_odd  = col[1];
    }

    // now make copies of the basic colors with the "odd" and "even" definitions mixed in
    for (int k = 1; k < ps::COL_MAX; k++) {
        short fg, bg;
        pair_content(k, &fg, &bg);

        // replace the background color, and mix in the attributes
        attr_map[k + 1 * ps::COL_MAX] = attr_map[k] | attr_map[ps::COL_EVEN];
        attr_map[k + 2 * ps::COL_MAX] = attr_map[k] | attr_map[ps::COL_ODD];
        init_pair(k + 1 * ps::COL_MAX, fg, bg == -1 ? bg_even : bg);
        init_pair(k + 2 * ps::COL_MAX, fg, bg == -1 ? bg_odd  : bg);
    }
}


// add color handling to canvas initialization
void ui_pyroscope_canvas_init() {
    start_color();
    use_default_colors();
    ui_pyroscope_colormap_init();
}


// offset into the color index table, depending on whether this is an odd or even item
static int row_offset(core::View* view, Range& range) {
    return (((range.first - view->begin_visible()) & 1) + 1) * ps::COL_MAX;
}


static void decorate_download_title(Window* window, display::Canvas* canvas, core::View* view, int pos, Range& range) {
    int offset = row_offset(view, range);
    core::Download* item = *range.first;
    bool active = item->is_open() && item->is_active();

    // download title color
    int title_col;
    unsigned long focus_attr = range.first == view->focus() ? attr_map[ps::COL_FOCUS] : 0;
    if ((*range.first)->is_done())
        title_col = (active ? D_INFO(item)->up_rate()->rate() ?
                     ps::COL_SEEDING : ps::COL_COMPLETE : ps::COL_STOPPED) + offset;
    else
        title_col = (active ? D_INFO(item)->down_rate()->rate() ?
                     ps::COL_LEECHING : ps::COL_INCOMPLETE : ps::COL_QUEUED) + offset;
    canvas->set_attr(2, pos, -1, attr_map[title_col] | focus_attr, title_col);

    // show label for active tracker (a/k/a in focus tracker)
    std::string url = get_active_tracker_domain((*range.first)->download());
    if (!url.empty()) {
        std::string alias = tracker_aliases[url];
        if (!alias.empty()) url = alias;

        // shorten label if too long
        int len = url.length();
        if (len > TRACKER_LABEL_WIDTH) {
            url = "…" + url.substr(len - TRACKER_LABEL_WIDTH);
            len = TRACKER_LABEL_WIDTH + 1;
        }

        // print it right-justified and in braces
        int td_col = ps::COL_INFO;
        //int td_col = active ? ps::COL_INFO : (*range.first)->is_done() ? ps::COL_STOPPED : ps::COL_QUEUED;
        int xpos = canvas->width() - len - 2;
        canvas->print(xpos, pos, "{%s}", url.c_str());
        canvas->set_attr(xpos + 1, pos, len, attr_map[td_col + offset] | focus_attr, td_col + offset);
        canvas->set_attr(xpos, pos, 1, (attr_map[td_col + offset] | focus_attr) ^ A_BOLD, td_col + offset);
        canvas->set_attr(canvas->width() - 1, pos, 1, (attr_map[td_col + offset] | focus_attr) ^ A_BOLD, td_col + offset);
    }
}


// show ratio progress by color (ratio is scaled x1000)
static int ratio_color(int ratio) {
    int rcol = sizeof(ratio_col) / sizeof(*ratio_col) - 1;
    return ratio_col[std::min(rcol, ratio * rcol / 1200)];
}


// patch hook for download list canvas redraw of a single item; "pos" is placed AFTER the item
void ui_pyroscope_download_list_redraw_item(Window* window, display::Canvas* canvas, core::View* view, int pos, Range& range) {
    int offset = row_offset(view, range);
    torrent::Download* item = (*range.first)->download();

    pos -= 3;

    // is this the item in focus?
    if (range.first == view->focus()) {
        for (int i = 0; i < 3; i++ ) {
            canvas->set_attr(0, pos+i, 1, attr_map[ps::COL_FOCUS], ps::COL_FOCUS);
        }
    }

    decorate_download_title(window, canvas, view, pos, range);

    // better handling for trail of line 2 (ratio etc.)
    int status_pos = 91;
    int ratio = rpc::call_command_value("d.ratio", rpc::make_target(*range.first));

    if (status_pos < canvas->width()) {
        canvas->print(status_pos, pos+1, "R:%6.2f [%c%c] %-4.4s  ",
            float(ratio) / 1000.0,
            rpc::call_command_string("d.tied_to_file", rpc::make_target(*range.first)).empty() ? ' ' : 'T',
            (rpc::call_command_value("d.ignore_commands", rpc::make_target(*range.first)) == 0) ? ' ' : 'I',
            (*range.first)->priority() == 2 ? "" :
                rpc::call_command_string("d.priority_str", rpc::make_target(*range.first)).c_str()
        );
        status_pos += 9 + 5 + 5;
    }

    // if space is left, show throttle name
    if (status_pos < canvas->width()) {
        std::string item_status;

        if (!(*range.first)->bencode()->get_key("rtorrent").get_key_string("throttle_name").empty()) {
            //item_status += "T=";
            item_status += rpc::call_command_string("d.throttle_name", rpc::make_target(*range.first)) + ' ';
        }

        // left-justifying this also overwrites any junk from the original display that we overwrite
        int chars_left = canvas->width() - status_pos - item_status.length();
        if (chars_left < 0) {
            item_status = item_status.substr(0, 1-chars_left) + "…";
        } else if (chars_left > 0) {
            item_status = std::string(chars_left, ' ') + item_status;
        }
        canvas->print(status_pos, pos+1, "%s", item_status.c_str());
    }

    //.........1.........2.........3.........4.........5.........6.........7.........8.........9.........0.........1
    //12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
    // [CLOSED]     0,0 /   15,9 MB Rate:   0,0 /   0,0 KB Uploaded:     0,0 MB [ 0%] --d --:-- R:nnnnnn [TI]
    // [CLOSED]    0.0K /   0.0K     U/D:   0.0K /   0.0K  Uploaded:   0.0K                     R:  0.00 [T ]
    int label_pos[] = {19, 1, 31, 5, 44, 1, 54, 9, 75, 1, 79, 1, 91, 2, 100, 1, 103, 1};
    const char* labels[sizeof(label_pos) / sizeof(int) / 2] = {0, " U/D:"};
    int col_active = ps::COL_INFO;
    //int col_active = item->is_open() && item->is_active() ? ps::COL_INFO : (*range.first)->is_done() ? ps::COL_STOPPED : ps::COL_QUEUED;

    // apply basic "info" style, and then revert static text to "label"
    canvas->set_attr(2, pos+1, canvas->width() - 1, attr_map[col_active + offset], col_active + offset);
    for (int label_idx = 0; label_idx < sizeof(label_pos) / sizeof(int); label_idx += 2) {
        if (labels[label_idx/2]) canvas->print(label_pos[label_idx], pos+1, labels[label_idx/2]);
        canvas->set_attr(label_pos[label_idx], pos+1, label_pos[label_idx+1], attr_map[ps::COL_LABEL + offset], ps::COL_LABEL + offset);
    }

    // apply progress color to completion indicator
    int pcol = ratio_color(item->file_list()->completed_chunks() * 1000 / item->file_list()->size_chunks());
    canvas->set_attr(76, pos+1, 3, attr_map[pcol + offset], pcol + offset);

    // show ratio progress by color
    int rcol = ratio_color(ratio);
    canvas->set_attr(93, pos+1, 6, attr_map[rcol + offset], rcol + offset);

    // mark active up / down ("focus", plus "seeding" or "leeching"), and dim inactive numbers (i.e. 0)
    canvas->set_attr(37, pos+1, 6, attr_map[ps::COL_SEEDING + offset] | (D_INFO(item)->up_rate()->rate() ? attr_map[ps::COL_FOCUS] : 0),
        (D_INFO(item)->up_rate()->rate() ? ps::COL_SEEDING : ps::COL_LABEL) + offset);
    canvas->set_attr(46, pos+1, 6, attr_map[ps::COL_LEECHING + offset] | (D_INFO(item)->down_rate()->rate() ? attr_map[ps::COL_FOCUS] : 0),
        (D_INFO(item)->down_rate()->rate() ? ps::COL_LEECHING : ps::COL_LABEL) + offset);

    // mark non-trivial messages
    if (!(*range.first)->message().empty() && (*range.first)->message().find("Tried all trackers") == std::string::npos) {
        canvas->set_attr(1, pos, 1, attr_map[ps::COL_ALARM + offset], ps::COL_ALARM + offset);
        canvas->set_attr(1, pos+1, 1, attr_map[ps::COL_ALARM + offset], ps::COL_ALARM + offset);
        canvas->set_attr(1, pos+2, -1, attr_map[ps::COL_ALARM + offset], ps::COL_ALARM + offset);
    }
}


// Render columns from `column_defs`, return total length
int render_columns(bool headers, rpc::target_type target,
                   display::Canvas* canvas, int column, int pos,
                   const torrent::Object::map_type& column_defs) {
    torrent::Object::map_const_iterator cols_itr, last_col = column_defs.end();
    int total = 0;

    for (cols_itr = column_defs.begin(); cols_itr != last_col; ++cols_itr) {
        // Skip sort key (format is "sort:len:title")
        size_t header_colon = cols_itr->first.find(':');
        if (header_colon == std::string::npos) continue;

        // Parse header length
        const char* header_pos = cols_itr->first.c_str() + header_colon + 1;
        char* header_text = 0;
        int header_len = (int)strtol(header_pos, &header_text, 10);
        if (*header_text++ != ':') continue;

        // Render title text, or the result of the column command
        if (headers) {
            canvas->print(column, pos, " %s", header_text);
        } else {
            std::string text = rpc::call_object_nothrow(cols_itr->second, target).as_string();
            //std::string text = rpc::call_command_string(cols_itr->second.as_string().c_str(), target);
            canvas->print(column, pos, " %s", u8_chop(text, header_len).c_str());
        }

        // Advance posiiton
        column += header_len + 1;
        total += header_len + 1;
    }
    return total;
}


// patch hook for download list canvas redraw; if this returns true, the calling
// function is left immediately (i.e. true indicates we took over ALL redrawing)
bool ui_pyroscope_download_list_redraw(Window* window, display::Canvas* canvas, core::View* view) {
    // show "X of Y"
    if (canvas->width() > 16) {
        int item_idx = view->focus() - view->begin_visible();
        if (item_idx == view->size())
            canvas->print(canvas->width() - 16, 0, "[ none of %-5d]", view->size());
        else
            canvas->print(canvas->width() - 16, 0, "[%5d of %-5d]", item_idx + 1, view->size());
    }
    canvas->set_attr(0, 0, -1, attr_map[ps::COL_TITLE], ps::COL_TITLE);

    if (is_collapsed.find(view->name()) == is_collapsed.end() || !is_collapsed[view->name()])
        return false; // continue in calling function

    if (view->empty_visible() || canvas->width() < 5 || canvas->height() < 2)
        return true;

    // show column headers
    const torrent::Object::map_type& column_defs = control->object_storage()->get_str("ui.column.render").as_map();
    // x_base value depends on the static headers below!
    int pos = 1, x_base = 31, column = x_base;

    canvas->print(2, pos, " ⣿ ⚡ ☯ ⚑  ↺  ⤴  ⤵   ∆   ⌚ ≀∇ ");
    column += render_columns(true, rpc::make_target(), canvas, column, pos, column_defs);
    canvas->print(column, pos, " Name "); column += 6;
    if (canvas->width() - column > TRACKER_LABEL_WIDTH) {
        canvas->print(canvas->width() - 14, 1, "Tracker Domain");
    }
    canvas->set_attr(0, pos, -1, attr_map[ps::COL_LABEL], ps::COL_LABEL);

    // network traffic
    int network_history_lines = 0;
    if (network_history_depth) {
        network_history_lines = 2;
        pos = canvas->height() - 2;

        canvas->print(0, pos, "%s", network_history_up_str.c_str());
        canvas->set_attr(0, pos, -1, attr_map[ps::COL_SEEDING], ps::COL_SEEDING);
        canvas->print(0, pos+1, "%s", network_history_down_str.c_str());
        canvas->set_attr(0, pos+1, -1, attr_map[ps::COL_LEECHING], ps::COL_LEECHING);
    }

    // Styles
    #define PROGRESS_STEPS 9
    const char* progress[3][PROGRESS_STEPS] = {
        {},
        {"⠀ ", "⠁ ", "⠉ ", "⠋ ", "⠛ ", "⠟ ", "⠿ ", "⡿ ", "⣿ "},
        {"⠀ ", "▁ ", "▂ ", "▃ ", "▄ ", "▅ ", "▆ ", "▇ ", "█ "},
    };
    unsigned int progress_style = std::min<unsigned int>(rpc::call_command_value("ui.style.progress"), 2);
    #define YING_YANG_STEPS 11
    const char* ying_yang[4][YING_YANG_STEPS] = {
        {},
        {"☹ ", "➀ ", "➁ ", "➂ ", "➃ ", "➄ ", "➅ ", "➆ ", "➇ ", "➈ ", "➉ "},
        {"☹ ", "① ", "② ", "③ ", "④ ", "⑤ ", "⑥ ", "⑦ ", "⑧ ", "⑨ ", "⑩ "},
        {"☹ ", "➊ ", "➋ ", "➌ ", "➍ ", "➎ ", "➏ ", "➐ ", "➑ ", "➒ ", "➓ "},
    };
    unsigned int ying_yang_style = std::min<unsigned int>(rpc::call_command_value("ui.style.ratio"), 3);

    // define iterator range
    Range range = rak::advance_bidirectional(
            view->begin_visible(),
            view->focus() != view->end_visible() ? view->focus() : view->begin_visible(),
            view->end_visible(),
            canvas->height()-2-2-network_history_lines);

    pos = 2;
    while (range.first != range.second) {
        core::Download* d = *range.first;
        core::Download* item = d;
        torrent::Tracker* tracker = get_active_tracker((*range.first)->download());
        int ratio = rpc::call_command_value("d.ratio", rpc::make_target(d));
        bool has_msg = !d->message().empty();
        bool has_alert = has_msg && d->message().find("Tried all trackers") == std::string::npos;
        int offset = row_offset(view, range);
        int col_active = ps::COL_INFO;
        //int col_active = item->is_open() && item->is_active() ? ps::COL_INFO : d->is_done() ? ps::COL_STOPPED : ps::COL_QUEUED;

        const char* alert = "⚠ ";
        if (has_alert) {
            if (d->message().find("Timeout was reached") != std::string::npos
                        || d->message().find("Timed out") != std::string::npos)
                alert = "◔ ";
            else if (d->message().find("Connecting to") != std::string::npos)
                alert = "⚡ ";
            else if (d->message().find("Could not parse bencoded data") != std::string::npos
                        || d->message().find("Failed sending data") != std::string::npos
                        || d->message().find("Server returned nothing") != std::string::npos
                        || d->message().find("Couldn't connect to server") != std::string::npos)
                alert = "↯ ";
            else if (d->message().find("not registered") != std::string::npos
                        || d->message().find("torrent cannot be found") != std::string::npos
                        || d->message().find("unregistered") != std::string::npos)
                alert = "¿?";
            else if (d->message().find("not authorized") != std::string::npos
                        || d->message().find("blocked from") != std::string::npos
                        || d->message().find("denied") != std::string::npos
                        || d->message().find("limit exceeded") != std::string::npos
                        || d->message().find("active torrents are enough") != std::string::npos)
                alert = "⨂ ";
        }

        std::string displayname = get_custom_string(d, "displayname");
        int is_tagged = rpc::commands.call_command_d("d.views.has", d, torrent::Object("tagged")).as_value() == 1;
        uint32_t down_rate = D_INFO(item)->down_rate()->rate();

        char progress_str[6] = "##";
        char ying_yang_str[6] = "##";
        if (progress_style == 0) {
            sprintf(progress_str, item->file_list()->completed_chunks() ? "%2.2d" : "--",
                item->file_list()->completed_chunks() * 100 / item->file_list()->size_chunks());
        }
        if (ying_yang_style == 0 && ratio < 9949) {
            sprintf(ying_yang_str, ratio ? "%2.2d" : "--", ratio / 100);
        }

        canvas->print(0, pos, "%s  %s%s%s%s %s %s %s %s %s%s ",
            range.first == view->focus() ? "»" : " ",
            d->is_done() ? "✔ " : progress_style == 0 ? progress_str : progress[progress_style][
                item->file_list()->completed_chunks() * PROGRESS_STEPS
                / item->file_list()->size_chunks()],
            D_INFO(item)->down_rate()->rate() ?
                (D_INFO(item)->up_rate()->rate() ? "⇅ " : "↡ ") :
                (D_INFO(item)->up_rate()->rate() ? "↟ " : "  "),
            ying_yang_style == 0 ? ying_yang_str :
                ratio >= YING_YANG_STEPS * 1000 ? "⊛ " : ying_yang[ying_yang_style][ratio / 1000],
            has_msg ? has_alert ? alert : "♺ " : is_tagged ? "⚑ " : "  ",
            tracker ? num2(tracker->scrape_downloaded()).c_str() : "  ",
            tracker ? num2(tracker->scrape_complete()).c_str() : "  ",
            tracker ? num2(tracker->scrape_incomplete()).c_str() : "  ",
            human_size(D_INFO(item)->up_rate()->rate(), 2 | 8).c_str(),
            d->is_done() || !down_rate ? "" : " ",
            d->is_done() ? elapsed_time(get_custom_long(d, "tm_completed")).c_str() :
            !down_rate   ? elapsed_time(get_custom_long(d, "tm_loaded")).c_str() :
                           human_size(down_rate, 2 | 8).c_str()
        );

        // Render custom columns
        column = x_base;
        int custom_len = render_columns(false, rpc::make_target(d), canvas, column, pos, column_defs);
        canvas->set_attr(column, pos, custom_len, attr_map[ps::COL_DEFAULT], ps::COL_DEFAULT);
        column += custom_len;
        int x_name = column + 1;

        // Render name
        canvas->print(column, pos, " %s", u8_chop(
            displayname.empty() ? d->info()->name() : displayname.c_str(),
            canvas->width() - x_name - 1).c_str());

        int x_scrape = 3 + 4*2 + 1; // lead, 4 status columns, gap
        int x_rate = x_scrape + 3*3; // skip 3 scrape columns
        //int x_name = x_rate + 3*5 + 1; // skip 3 rate/size columns
        decorate_download_title(window, canvas, view, pos, range);
        canvas->set_attr(2, pos, x_name-2, attr_map[col_active + offset], col_active + offset);
        if (has_alert) canvas->set_attr(x_scrape-3, pos, 2, attr_map[ps::COL_ALARM + offset], ps::COL_ALARM + offset);

        // apply progress color to completion indicator
        int pcol = ratio_color(item->file_list()->completed_chunks() * 1000 / item->file_list()->size_chunks());
        canvas->set_attr(x_scrape-9, pos, 2, attr_map[pcol + offset], pcol + offset);

        // show ratio progress by color
        int rcol = ratio_color(ratio);
        canvas->set_attr(x_scrape-5, pos, 2, attr_map[rcol + offset], rcol + offset);

        // color up/down rates
        canvas->set_attr(x_rate+0, pos, 4, attr_map[ps::COL_SEEDING + offset], ps::COL_SEEDING + offset);
        if (d->is_done() || !down_rate) {
            // time display
            int tm_color = (d->is_done() ? ps::COL_SEEDING : ps::COL_INCOMPLETE) + offset;
            canvas->set_attr(x_rate+5+1, pos, 1, attr_map[tm_color], tm_color);
            canvas->set_attr(x_rate+5+4, pos, 1, attr_map[tm_color], tm_color);
        } else {
            // down rate
            canvas->set_attr(x_rate+5, pos, 5, attr_map[ps::COL_LEECHING + offset], ps::COL_LEECHING + offset);
        }

        // is this the item in focus?
        if (range.first == view->focus()) {
            canvas->set_attr(0, pos, 1, attr_map[ps::COL_FOCUS], ps::COL_FOCUS);
        }

        ++pos;
        ++range.first;
    }

    if (view->focus() != view->end_visible()) {
        char buffer[canvas->width() + 1];
        char* last = buffer + canvas->width() + 1;

        pos = canvas->height() - 2 - network_history_lines;
        print_download_info(buffer, last, *view->focus());
        canvas->print(3, pos, "%s", buffer);
        canvas->set_attr(0, pos, -1, attr_map[ps::COL_LABEL], ps::COL_LABEL);
        print_download_status(buffer, last, *view->focus());
        canvas->print(3, pos+1, "%s", buffer);
        canvas->set_attr(0, pos+1, -1, attr_map[ps::COL_LABEL], ps::COL_LABEL);
    }

    return true;
}


// patch hook for window title canvas redraw
void ui_pyroscope_statusbar_redraw(Window* window, display::Canvas* canvas) {
    canvas->set_attr(0, 0, -1, attr_map[ps::COL_FOOTER], ps::COL_FOOTER);
}


} // namespace


torrent::Object cmd_view_collapsed_toggle(const torrent::Object::string_type& args) {
    std::string view_name = args;

    if (view_name.empty()) {
        view_name = control->ui()->download_list()->current_view()->name();
    }

    is_collapsed[view_name] = is_collapsed.find(view_name) == is_collapsed.end() ? true : !is_collapsed[view_name];

    return is_collapsed[view_name];
}


// implementation of method we patched into rpc::object_storage
const torrent::Object& rpc::object_storage::set_color_string(const torrent::raw_string& key, const std::string& object) {
    const torrent::Object& result = rpc::object_storage::set_string(key, object);
    display::ui_pyroscope_colormap_init();
    return result;
}


// Traffic history
int network_history_depth_get() {
    return network_history_depth;
}

torrent::Object network_history_depth_set(int arg) {
    if (network_history_depth) {
        delete[] network_history_up;
        delete[] network_history_down;
        network_history_up = network_history_down = 0;
    }

    network_history_depth = arg;
    network_history_count = 0;

    if (network_history_depth) {
        network_history_up   = new uint32_t[network_history_depth];
        network_history_down = new uint32_t[network_history_depth];
    }

    return torrent::Object();
}


void network_history_format(std::string& buf, char kind, uint32_t* data) {
    uint32_t samples = std::min(network_history_count, (uint32_t) network_history_depth);
    uint32_t min_rate = *std::min_element(data, data + samples);
    uint32_t max_rate = *std::max_element(data, data + samples);
    char buffer[80];

    snprintf(buffer, sizeof(buffer), "%c ⌈%s⌉⌊%s⌋%s", kind,
        display::human_size(max_rate, 0).c_str(), display::human_size(min_rate, 0).c_str(),
        rpc::call_command_value("network.history.auto_scale") ? "↨ " : "  ");
    buf = buffer;

    if (max_rate > 102) {
        const char* meter[] = {"⠀", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"};
        uint32_t base = rpc::call_command_value("network.history.auto_scale") ? min_rate : 0;
        for (int i = 1; i <= samples; ++i) {
            uint32_t idx = (network_history_count - i) % network_history_depth;
            if (max_rate > base)
                buf += meter[std::min(8U, (data[idx] - base) * 9 / (max_rate - base))];
            else
                buf += " ";
        }
    }
    buf += " ";
}


// You MUST call this after changing the auto_scale flag, to see any changes immediately!
torrent::Object network_history_refresh() {
    if (network_history_depth) {
        network_history_format(network_history_up_str, 'U', network_history_up);
        network_history_format(network_history_down_str, 'D', network_history_down);
    }

    return torrent::Object();
}


torrent::Object network_history_sample() {
    if (network_history_depth) {
        network_history_up[network_history_count % network_history_depth] = torrent::up_rate()->rate();
        network_history_down[network_history_count % network_history_depth] = torrent::down_rate()->rate();
        ++network_history_count;
    }

    return network_history_refresh();
}


torrent::Object cmd_trackers_alias_set_key(rpc::target_type target, const torrent::Object::list_type& args) {
    torrent::Object::list_const_iterator itr = args.begin();
    if (args.size() != 2) {
        throw torrent::input_error("trackers.alias.set_key: expecting two arguments!");
    }
    std::string domain = (itr++)->as_string();
    std::string alias  = (itr++)->as_string();

    tracker_aliases[domain] = alias;

    return torrent::Object();
}


torrent::Object cmd_trackers_alias_items(rpc::target_type target) {
    torrent::Object rawResult = torrent::Object::create_list();
    torrent::Object::list_type& result = rawResult.as_list();

    for (string_kv_map::const_iterator itr = tracker_aliases.begin(), last = tracker_aliases.end(); itr != last; itr++) {
        std::string mapping = itr->first + "=" + itr->second;
        result.push_back(mapping);
    }

    return rawResult;
}


torrent::Object apply_human_size(const torrent::Object::list_type& args) {
    if (args.size() != 1 && args.size() != 2)
        throw torrent::input_error("convert.human_size takes 1 or 2 arguments!");

    torrent::Object::value_type bytes = args.front().as_value();
    torrent::Object::value_type format = args.size() > 1 ? args.back().as_value() : 2;

    return display::human_size(bytes, format);
}


torrent::Object apply_magnitude(const torrent::Object::list_type& args) {
    if (args.size() != 1)
        throw torrent::input_error("convert.magnitude takes 1 value argument!");

    return num2(args.front().as_value());
}


// register our commands
void initialize_command_ui_pyroscope() {
    #define PS_VARIABLE_COLOR(key, value) \
        control->object_storage()->insert_c_str(key, value, rpc::object_storage::flag_string_type); \
        CMD2_ANY(key, _cxxstd_::bind(&rpc::object_storage::get, control->object_storage(),   \
            torrent::raw_string::from_c_str(key)));  \
        CMD2_ANY_STRING(key ".set", _cxxstd_::bind(&rpc::object_storage::set_color_string, control->object_storage(), \
            torrent::raw_string::from_c_str(key), _cxxstd_::placeholders::_2));

    #define PS_CMD_ANY_FUN(key, func) \
        CMD2_ANY(key, _cxxstd_::bind(&func))

    CMD2_ANY        ("network.history.depth",      _cxxstd_::bind(&network_history_depth_get));
    CMD2_ANY_VALUE_V("network.history.depth.set",  _cxxstd_::bind(&network_history_depth_set, _cxxstd_::placeholders::_2));
    CMD2_ANY        ("network.history.refresh",    _cxxstd_::bind(&network_history_refresh));
    CMD2_ANY        ("network.history.sample",     _cxxstd_::bind(&network_history_sample));
    CMD2_VAR_BOOL   ("network.history.auto_scale", true);

    CMD2_ANY_STRING("view.collapsed.toggle", _cxxstd_::bind(&cmd_view_collapsed_toggle, _cxxstd_::placeholders::_2));

    CMD2_ANY_LIST("trackers.alias.set_key", &cmd_trackers_alias_set_key);
    CMD2_ANY("trackers.alias.items", _cxxstd_::bind(&cmd_trackers_alias_items, _cxxstd_::placeholders::_1));

    CMD2_VAR_VALUE("ui.style.progress", 1);
    CMD2_VAR_VALUE("ui.style.ratio", 1);

    PS_VARIABLE_COLOR("ui.color.progress0",     "red");
    PS_VARIABLE_COLOR("ui.color.progress20",    "bold bright red");
    PS_VARIABLE_COLOR("ui.color.progress40",    "bold bright magenta");
    PS_VARIABLE_COLOR("ui.color.progress60",    "yellow");
    PS_VARIABLE_COLOR("ui.color.progress80",    "bold bright yellow");
    PS_VARIABLE_COLOR("ui.color.progress100",   "green");
    PS_VARIABLE_COLOR("ui.color.progress120",   "bold bright green");
    PS_VARIABLE_COLOR("ui.color.complete",      "bright green");
    PS_VARIABLE_COLOR("ui.color.seeding",       "bold bright green");
    PS_VARIABLE_COLOR("ui.color.stopped",       "blue");
    PS_VARIABLE_COLOR("ui.color.queued",        "magenta");
    PS_VARIABLE_COLOR("ui.color.incomplete",    "yellow");
    PS_VARIABLE_COLOR("ui.color.leeching",      "bold bright yellow");
    PS_VARIABLE_COLOR("ui.color.alarm",         "bold white on red");
    PS_VARIABLE_COLOR("ui.color.title",         "bold bright white on blue");
    PS_VARIABLE_COLOR("ui.color.footer",        "bold bright cyan on blue");
    PS_VARIABLE_COLOR("ui.color.label",         "gray");
    PS_VARIABLE_COLOR("ui.color.odd",           "");
    PS_VARIABLE_COLOR("ui.color.even",          "");
    PS_VARIABLE_COLOR("ui.color.info",          "white");
    PS_VARIABLE_COLOR("ui.color.focus",         "reverse");

    PS_CMD_ANY_FUN("system.colors.max",         display::get_colors);
    PS_CMD_ANY_FUN("system.colors.enabled",     has_colors);
    PS_CMD_ANY_FUN("system.colors.rgb",         can_change_color);

    CMD2_ANY_LIST("convert.human_size",         _cxxstd_::bind(&apply_human_size, _cxxstd_::placeholders::_2));
    CMD2_ANY_LIST("convert.magnitude",          _cxxstd_::bind(&apply_magnitude, _cxxstd_::placeholders::_2));

    rpc::parse_command_multiple
        (rpc::make_target(),
        "method.insert = ui.column.render, multi|rlookup|static\n"
    );
}
