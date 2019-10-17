/*
 ⋅ ” ’ ♯ ☢ ☍ ⌘ ✰ ⋮ ☯ ⚑ ↺ ⤴ ⤵ ∆ ∇ ⚠ ◔ ↯ ¿ ⨂ ✖ ⇣ ⇡ ▹ ╍ ▪ ⚯ ⚒ ◌ ⇅ ↡ ↟ ⊛ ♺ ⋆ … ⇳ ⌈ ⌉ ⌊ ⌋ ⊘
 ∞ ↨ ❢ ʘ ⇕ ⋫ ☡ ↕ ℞ ⟲ ◷ Σ ⇈ ✔ ⛁ ☹ ➀ ➁ ➂ ➃ ➄ ➅ ➆ ➇ ➈ ➉ ⠁ ⠉ ⠋ ⠛ ⠟ ⠿ ⡿ ⣿ ❚ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █

python -c 'print u"\u22c5 \u201d \u2019 \u266f \u2622 \u260d \u2318 \u2730 " \
    u"\u22ee \u262f \u2691 \u21ba \u2934 \u2935 \u2206 \u2207 \u26a0 \u25d4 " \
    u"\u21af \u00bf \u2a02 \u2716 \u21e3 \u21e1 \u25b9 \u254d \u25aa \u26af " \
    u"\u2692 \u25cc \u21c5 \u21a1 \u219f \u229b \u267a \u22c6 \u2026 \u21f3 " \
    u"\u2308 \u2309 \u230a \u230b \u2298 \u221e \u21a8 \u2762 \u0298 \u21d5 " \
    u"\u22eb \u2621 \u2195 \u211e \u27f2 \u25f7 \u03a3 \u21c8 \u2714 \u26c1 " \
    u"\u2639 \u2780 \u2781 \u2782 \u2783 \u2784 \u2785 \u2786 \u2787 \u2788 \u2789 " \
    u"\u2801 \u2809 \u280b \u281b \u281f \u283f \u287f \u28ff \u275a " \
    u"\u2581 \u2582 \u2583 \u2584 \u2585 \u2586 \u2587 \u2588 ".encode("utf8")'
*/

#include "ui_pyroscope.h"

#include "config.h"
#include "globals.h"

#include <climits>
#include <cstdio>
#include <cwchar>
#include <set>
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

#if (RT_HEX_VERSION <= 0x000906)
    #define _cxxstd_ tr1
#else
    #define _cxxstd_ std
#endif

#define D_INFO(item) (item->info())
#include "rpc/object_storage.h"
#include "rpc/parse.h"

// from command_pyroscope.cc
extern torrent::Tracker* get_active_tracker(torrent::Download* item);
extern std::string get_active_tracker_domain(torrent::Download* item);

#define CANVAS_POS_1ST_ITEM 2
#define X_OF_Y_CANVAS_MIN_WIDTH 28
#define NAME_RESERVED_WIDTH 6
#define TRACKER_LABEL_WIDTH 20

// definition from display/window_download_list.cc that is not in the header file
typedef std::pair<core::View::iterator, core::View::iterator> Range;

// display attribute map (normal, even, odd)
static unsigned long attr_map[3 * ps::COL_MAX] = {0};

// color indices for progress indication
int ratio_col[] = {
    ps::COL_PROGRESS0, ps::COL_PROGRESS20, ps::COL_PROGRESS40, ps::COL_PROGRESS60, ps::COL_PROGRESS80,
    ps::COL_PROGRESS100, ps::COL_PROGRESS120,
};

// ps::COL_PRIO
static int col_idx_prio[] = {
    ps::COL_PROGRESS0, ps::COL_PROGRESS60, ps::COL_INFO, ps::COL_PROGRESS120
};

// ps::COL_STATE
static int col_idx_state[] = {
    ps::COL_PROGRESS0, ps::COL_PROGRESS0, ps::COL_PROGRESS80, ps::COL_PROGRESS100
};

// ps::COL_UNSAFE_DATA
static int col_idx_unsafe[] = {
    ps::COL_PROGRESS100, ps::COL_PROGRESS80, ps::COL_PROGRESS40
};

// ps::COL_THROTTLE_CH
static int col_idx_throttle_ch[] = {
    ps::COL_PROGRESS0, ps::COL_PROGRESS20, ps::COL_PROGRESS60, ps::COL_PROGRESS100
};

// basic color names
static const char* color_names[] = {
    "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white"
};

// color value for custom column rendering
static std::string ui_canvas_color;

// list of color configuration variables, the order MUST correspond to the ColorKind enum
static const char* color_vars[ps::COL_MAX] = {
    0,
    "ui.color.custom1",
    "ui.color.custom2",
    "ui.color.custom3",
    "ui.color.custom4",
    "ui.color.custom5",
    "ui.color.custom6",
    "ui.color.custom7",
    "ui.color.custom8",
    "ui.color.custom9",
    "ui.color.progress0", // 10
    "ui.color.progress20",
    "ui.color.progress40",
    "ui.color.progress60",
    "ui.color.progress80",
    "ui.color.progress100",
    "ui.color.progress120",
    "ui.color.title",
    "ui.color.footer",
    "ui.color.focus",
    "ui.color.label", // 20
    "ui.color.info",
    "ui.color.alarm",
    "ui.color.complete",
    "ui.color.seeding",
    "ui.color.stopped",
    "ui.color.queued",
    "ui.color.incomplete",
    "ui.color.leeching",
    "ui.color.odd",
    "ui.color.even",
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


// get a value from arg, either parsing from a string, or arg already being a value
int64_t parse_value_arg(const torrent::Object& arg) {
    if (arg.is_string()) {
        int64_t result;
        rpc::parse_whole_value(arg.as_string().c_str(), &result);
        return result;
    }
    return arg.as_value();  // this will throw if other types than string/value are passed
}


// convert absolute timestamp to approximate human readable time diff (5 chars wide)
std::string elapsed_time(unsigned long dt, unsigned long t0) {
    if (dt == 0) return std::string("⋆ ⋆⋆ ");

    const char* unit[] = {"”", "’", "h", "d", "w", "m", "y"};
    unsigned long threshold[] = {1, 60, 3600, 86400, 7*86400, 30*86400, 365*86400, 0};

    int dim = 0;
    dt = std::labs((t0 ? t0 : time(NULL)) - dt);
    if (dt == 0) return std::string("⋅ ⋅⋅ ");
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
    if (!num) return std::string(" ⋅");

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

// Visibility of canvas columns
static std::set<int> column_hidden;


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
        for (size_t i = 0; i < words.size(); i++) { // look at all the words
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
        if ((col[0] != -1 && col[0] >= get_colors()) || (col[1] != -1 && col[1] >= get_colors())) {
            char buf[33];
            sprintf(buf, "%d", get_colors());
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


torrent::Object ui_canvas_color_get() {
    return ::ui_canvas_color;
}


torrent::Object ui_canvas_color_set(const torrent::Object::string_type& arg) {
    ::ui_canvas_color = arg;
    return torrent::Object();
}


int64_t cmd_d_message_alert(core::Download* d) {
    int64_t alert = ps::ALERT_NORMAL;
    const std::string& msg = d->message();

    if (!msg.empty()) {
        alert = ps::ALERT_GENERIC;

        if (msg.find("Tried all trackers") != std::string::npos)
            alert = ps::ALERT_NORMAL_CYCLING;
        else if (msg.find("no data") != std::string::npos)
            alert = ps::ALERT_NORMAL_GHOST;
        else if (msg.find("Timeout was reached") != std::string::npos
                    || msg.find("Timed out") != std::string::npos)
            alert = ps::ALERT_TIMEOUT;
        else if (msg.find("Connecting to") != std::string::npos)
            alert = ps::ALERT_CONNECT;
        else if (msg.find("Could not parse bencoded data") != std::string::npos
                    || msg.find("Failed sending data") != std::string::npos
                    || msg.find("Server returned nothing") != std::string::npos
                    || msg.find("Couldn't connect to server") != std::string::npos)
            alert = ps::ALERT_REQUEST;
        else if (msg.find("not registered") != std::string::npos
                    || msg.find("torrent cannot be found") != std::string::npos
                    || msg.find("nregistered") != std::string::npos)
            alert = ps::ALERT_GONE;
        else if (msg.find("not authorized") != std::string::npos
                    || msg.find("blocked from") != std::string::npos
                    || msg.find("denied") != std::string::npos
                    || msg.find("limit exceeded") != std::string::npos
                    || msg.find("active torrents are enough") != std::string::npos)
            alert = ps::ALERT_PERMS;
        else if (msg.find("tracker is down") != std::string::npos)
            alert = ps::ALERT_DOWN;
        else if (msg.find("n't resolve host name") != std::string::npos)
            alert = ps::ALERT_DNS;
    }

    return alert;
}


unsigned long cmd_d_eta_seconds(core::Download* d) {
  uint32_t rate = d->info()->down_rate()->rate();

#if RT_HEX_VERSION <= 0x000906
  if (d->is_done())
#else
  if (d->data()->is_partially_done())
#endif
    return 0UL;

  if (rate < 512)
    return ULONG_MAX;

#if RT_HEX_VERSION <= 0x000906
  unsigned long remaining = (d->download()->file_list()->size_bytes() - d->download()->bytes_done()) / (rate & ~(uint32_t)(512 - 1));
#else
  unsigned long remaining = (d->download()->file_list()->selected_size_bytes() - d->download()->bytes_done()) / (rate & ~(uint32_t)(512 - 1));
#endif

  return remaining;
}


torrent::Object cmd_d_eta_time(core::Download* d) {
  std::string eta_time = "⋆ ⋆⋆ ";
  unsigned long remaining = cmd_d_eta_seconds(d);

  if (remaining > 0 && remaining < ULONG_MAX) {
    eta_time = elapsed_time(rpc::call_command_value("system.time") + remaining, 0L);
  }

  return eta_time;
}


std::string get_active_tracker_alias(torrent::Download* item) {
    std::string url = get_active_tracker_domain(item);
    if (!url.empty()) {
        std::string alias = tracker_aliases[url];
        if (!alias.empty()) url = alias;
    }

    return url;
}


torrent::Object cmd_d_tracker_alias(core::Download* download) {
    return get_active_tracker_alias(download->download());
}


static void decorate_download_title(Window* window, display::Canvas* canvas, core::View* view,
                                    int pos, Range& range, int x_title, size_t hilite, size_t hilen) {
    int offset = row_offset(view, range);
    core::Download* item = *range.first;
    bool active = item->is_open() && item->is_active();

    if (int(canvas->width()) <= x_title) return;

    // download title color
    int title_col;
    unsigned long focus_attr = range.first == view->focus() ? attr_map[ps::COL_FOCUS] : 0;
#if RT_HEX_VERSION <= 0x000906
    if ((*range.first)->is_done())
#else
    if ((*range.first)->data()->is_partially_done())
#endif
        title_col = (active ? D_INFO(item)->up_rate()->rate() ?
                     ps::COL_SEEDING : ps::COL_COMPLETE : ps::COL_STOPPED) + offset;
    else
        title_col = (active ? D_INFO(item)->down_rate()->rate() ?
                     ps::COL_LEECHING : ps::COL_INCOMPLETE : ps::COL_QUEUED) + offset;
    canvas->set_attr(x_title, pos, -1, attr_map[title_col] | focus_attr, title_col);
    if (hilen && hilite != std::string::npos && x_title + hilite < int(canvas->width())) {
        canvas->set_attr(x_title + hilite, pos, std::min(hilen, int(canvas->width()) - x_title - hilite),
                         (attr_map[title_col] | focus_attr | A_REVERSE) ^ A_BOLD, title_col);
    }

    // show label for active tracker (a/k/a in focus tracker)
    if (int(canvas->width()) <= x_title + NAME_RESERVED_WIDTH + 3) return;
    std::string url = get_active_tracker_alias((*range.first)->download());
    if (url.empty()) return;

    // shorten label if too long
    int max_len = std::min(TRACKER_LABEL_WIDTH,
                           int(canvas->width()) - x_title - NAME_RESERVED_WIDTH - 3);
    if (max_len > 0) {
        int len = url.length();
        if (len > max_len) {
            url = "…" + url.substr(len - max_len);
            len = max_len + 1;
        }

        // print it right-justified and in braces
        int td_col = ps::COL_INFO;
        //int td_col = active ? ps::COL_INFO : (*range.first)->is_done() ? ps::COL_STOPPED : ps::COL_QUEUED;
        int xpos = canvas->width() - len - 2;
        canvas->print(xpos, pos, "{%s}", url.c_str());
        canvas->set_attr(xpos + 1, pos, len, attr_map[td_col + offset] | focus_attr, td_col + offset);
        canvas->set_attr(xpos, pos, 1, (attr_map[td_col + offset] | focus_attr) ^ A_BOLD, td_col + offset);
        canvas->set_attr(canvas->width() - 1, pos, 1,
                         (attr_map[td_col + offset] | focus_attr) ^ A_BOLD, td_col + offset);
    }
}


// show ratio progress by color (ratio is scaled x1000)
static int ratio_color(int ratio) {
    int rcol = sizeof(ratio_col) / sizeof(*ratio_col) - 1;
    return ratio_col[std::min(rcol, std::max(0, ratio) * rcol / 1200)];
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

    decorate_download_title(window, canvas, view, pos, range, 2, -1, 0);

    // better handling for trail of line 2 (ratio etc.)
    int status_pos = 91;
    int ratio = rpc::call_command_value("d.ratio", rpc::make_target(*range.first));

    if (status_pos < int(canvas->width())) {
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
    if (status_pos < int(canvas->width())) {
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
    for (size_t label_idx = 0; label_idx < sizeof(label_pos) / sizeof(int); label_idx += 2) {
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


torrent::Object ui_column_spec(rpc::target_type target, const torrent::Object::list_type& args) {
    if (args.size() != 1) {
        throw torrent::input_error("ui.column.spec takes exactly one argument!");
    }
    int64_t colidx_wanted = parse_value_arg(*args.begin());
    std::string spec;

    const torrent::Object::map_type& column_defs = control->object_storage()->get_str("ui.column.render").as_map();
    torrent::Object::map_const_iterator cols_itr, last_col = column_defs.end();

    for (cols_itr = column_defs.begin(); cols_itr != last_col; ++cols_itr) {
        char* header_pos = 0;
        int64_t colidx = strtol(cols_itr->first.c_str(), &header_pos, 10);
        if (header_pos[0] == ':' && colidx == colidx_wanted)
            spec = cols_itr->first;
    }

    return spec;
}


torrent::Object ui_column_hide(rpc::target_type target, const torrent::Object::list_type& args) {
    for(torrent::Object::list_const_iterator itr = args.begin(), last = args.end(); itr != last; ++itr) {
        int64_t colidx = parse_value_arg(*itr);
        column_hidden.insert(colidx);
    }

    return torrent::Object();
}


torrent::Object ui_column_show(rpc::target_type target, const torrent::Object::list_type& args) {
    for(torrent::Object::list_const_iterator itr = args.begin(), last = args.end(); itr != last; ++itr) {
        int64_t colidx = parse_value_arg(*itr);
        column_hidden.erase(colidx);
    }

    return torrent::Object();
}


torrent::Object ui_column_is_hidden(rpc::target_type target, const torrent::Object::list_type& args) {
    if (args.size() != 1) {
        throw torrent::input_error("ui.column.is_hidden takes exactly one argument!");
    }
    int64_t colidx = parse_value_arg(*args.begin());

    return (int64_t) column_hidden.count(colidx);
}


torrent::Object ui_column_hidden_list() {
    torrent::Object result = torrent::Object::create_list();
    torrent::Object::list_type& resultList = result.as_list();

    for (std::set<int>::const_iterator itr = column_hidden.begin(); itr != column_hidden.end(); itr++) {
       resultList.push_back(*itr);
    }

    return result;
}


torrent::Object ui_column_sacrificial_list() {
    torrent::Object result = torrent::Object::create_list();
    torrent::Object::list_type& resultList = result.as_list();

    const torrent::Object::map_type& column_defs = control->object_storage()->get_str("ui.column.render").as_map();
    torrent::Object::map_const_iterator cols_itr, last_col = column_defs.end();

    for (cols_itr = column_defs.begin(); cols_itr != last_col; ++cols_itr) {
        char* header_pos = 0;
        int64_t colidx = strtol(cols_itr->first.c_str(), &header_pos, 10);
        if (header_pos[0] == ':' && header_pos[1] == '?')
            resultList.push_back(colidx);
    }

    return result;
}


// Render columns from `column_defs`, return total length
int render_columns(bool headers, bool narrow, rpc::target_type target, core::Download* item,
                   display::Canvas* canvas, int column, int pos, int offset,
                   const torrent::Object::map_type& column_defs) {
    torrent::Object::map_const_iterator cols_itr, last_col = column_defs.end();
    int total = 0;

    for (cols_itr = column_defs.begin(); cols_itr != last_col; ++cols_itr) {
        // Handle index / sort key (format is "sort:len:title")
        char* header_pos = 0;
        int colidx = (int)strtol(cols_itr->first.c_str(), &header_pos, 10);
        if (*header_pos++ != ':') continue;  // 2nd field is missing
        if (column_hidden.count(colidx)) continue;  // column is hidden

        // Check for 'sacrificial' marker
        if (*header_pos == '?') {
            if (narrow) continue; // skip this column
            ++header_pos;
        }

        // Parse header length
        char* header_text = 0;
        int header_len = (int)strtol(header_pos, &header_text, 10);

        // Check available space
        if (int(canvas->width()) - NAME_RESERVED_WIDTH < column + header_len) {
            if (!narrow && headers) return -1; // trigger narrow mode
            break; // all the space we have used up, get us out of here
        }

        // Do we have a colordef?
        std::string color_def;
        if (*header_text == 'C') {
            int x = 0;
            while (header_text[x] && header_text[x] != ':') x++;
            color_def.assign(header_text, x);
            header_text += x;
        }
        if (*header_text++ != ':') continue; // Header text is missing

        // Render title text, or the result of the column command
        ui_canvas_color = color_def;
        if (headers) {
            std::string header_str = u8_chop(header_text, header_len);
            canvas->print(column, pos, "%s", header_str.c_str());
        } else {
            std::string text;
            try {
                text = rpc::call_object(cols_itr->second, target).as_string();
            } catch (torrent::input_error& e) {
                // Rows will rotate through the error string (assuming it is thrown for each row)
                char buf[10];
                int what_pos = *e.what() ? (pos - CANVAS_POS_1ST_ITEM) * header_len % strlen(e.what()) : 0;
                snprintf(buf, sizeof(buf), "C22/%d", header_len);
                ui_canvas_color = buf;
                text = std::string(e.what()).substr(what_pos, header_len);
            }
            canvas->print(column, pos, "%s", u8_chop(text, header_len).c_str());
            //canvas->print(column, pos, " %s ", ui_canvas_color);  // debug: print color index

            // apply colorization
            if (ui_canvas_color.empty()) {
                canvas->set_attr(column, pos, header_len,
                                 attr_map[ps::COL_INFO + offset], ps::COL_INFO + offset);
            } else {
                int attr_col = column;
                for (const char* ptr = ui_canvas_color.c_str(); *ptr && *ptr++ == 'C'; ) {
                    char* next = 0;
                    int attr_idx = (int)strtol(ptr, &next, 10); if (next == ptr) break; ptr = next;
                    if (*ptr != '/') continue;

                    // System colors – these are mapped to a 'normal' color index
                    if (item) {
                        const char* c_down = "C28/4C27/1";             // leeching + incomplete
                        const char* c_seed = "C24/4C23/1";             // seeding + complete
                        const char* c_done = "C21/1C24/1C21/2C24/1";   // info + seeding (is_done)
                        const char* c_part = "C21/1C27/1C21/2C27/1";   // info + incomplete
                        const char* c_queu = "C21/1C26/1C21/2C26/1";   // info + queued
                        const char* c_eta  = "C21/1C28/1C21/2C28/1";   // info + leeching
                        const char* c_xfer = "C21/1C13/1C21/2C13/1";   // info + progress60

                        switch (attr_idx) {
                            case ps::COL_DOWN_TIME:  // C90/5
#if RT_HEX_VERSION <= 0x000906
                                ptr = item->is_done()                   ? c_done :
#else
                                ptr = item->data()->is_partially_done() ? c_done :
#endif
                                      D_INFO(item)->down_rate()->rate() ? c_down : c_part;
                                continue; // with new color definition
                            case ps::COL_UP_TIME:  // C96/5
                                ptr = D_INFO(item)->up_rate()->rate()   ? c_seed :
#if RT_HEX_VERSION <= 0x000906
                                      item->is_done()                   ? c_done : c_part;
#else
                                      item->data()->is_partially_done() ? c_done : c_part;
#endif
                                continue; // with new color definition
                            case ps::COL_ACTIVE_TIME:  // C70/5
                                ptr = D_INFO(item)->up_rate()->rate()   ? c_seed : c_queu;
                                continue; // with new color definition
                            case ps::COL_ETA_TIME:     // C73/5
#if RT_HEX_VERSION <= 0x000906
                                ptr = item->is_done()                   ? c_xfer : c_eta;
#else
                                ptr = item->data()->is_partially_done() ? c_xfer : c_eta;
#endif
                                continue; // with new color definition
                            case ps::COL_PRIO:
                                attr_idx = col_idx_prio[std::min(3U, (uint32_t) item->priority())];
                                break;
                            case ps::COL_STATE:
                                attr_idx = col_idx_state[(item->is_open() << 1) | item->is_active()];
                                break;
                            case ps::COL_RATIO:
                                attr_idx = ratio_color(rpc::call_command_value("d.ratio", target));
                                break;
                            case ps::COL_PROGRESS:
                                attr_idx = ratio_color(item->file_list()->completed_chunks() * 1000 /
                                                       item->file_list()->size_chunks());
                                break;
                            case ps::COL_UNSAFE_DATA:
                                attr_idx = col_idx_unsafe[std::min(2U, (uint32_t) get_custom_long(item, "unsafe_data"))];
                                break;
                            case ps::COL_THROTTLE_CH:
                                {
                                    std::string throttlename = "";
                                    if (!item->bencode()->get_key("rtorrent").get_key_string("throttle_name").empty()) {
                                        throttlename = rpc::call_command_string("d.throttle_name", rpc::make_target(item)).c_str();
                                    }
                                    attr_idx = col_idx_throttle_ch[(!throttlename.empty() ? (throttlename == "NULL" ? 3 : (throttlename == "slowup" ? 2 : 1)) : 0)];
                                }
                                break;
                            case ps::COL_ALERT: // COL_ALARM is the actual color, this is the dynamic one
                                {
                                    bool has_alert = !item->message().empty()
                                                  && item->message().find("Tried all trackers") == std::string::npos;
                                    bool no_data = item->message().find("no data") != std::string::npos;
                                    attr_idx = no_data ? ps::COL_PROGRESS0 : has_alert ? ps::COL_ALARM : ps::COL_INFO;
                                }
                                break;
                        }
                    }

                    // Get color area length, if both pos/len are ok, do it
                    int attr_len = (int)strtol(ptr + 1, &next, 10); if (next == ptr) break; ptr = next;
                    if (attr_idx && attr_len) {
                        if (attr_idx >= ps::COL_MAX) attr_idx = ps::COL_ALARM;
                        canvas->set_attr(attr_col, pos, attr_len, attr_map[attr_idx + offset], attr_idx + offset);
                        attr_col += attr_len;
                    }
                }
            }
        }

        // Advance canvas column position, and add to length
        column += header_len + 1;
        total += header_len + 1;
    }

    return total;
}


// patch hook for download list canvas redraw; if this returns true, the calling
// function is left immediately (i.e. true indicates we took over ALL redrawing)
bool ui_pyroscope_download_list_redraw(Window* window, display::Canvas* canvas, core::View* view) {
    // show "X of Y"
    if (canvas->width() >= X_OF_Y_CANVAS_MIN_WIDTH) {
        size_t item_idx = view->focus() - view->begin_visible();
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

    // Prepare rendering
    const torrent::Object::map_type& column_defs = control->object_storage()->get_str("ui.column.render").as_map();
    int pos = 1, x_base = 2, column = x_base;
    bool narrow = false;
    std::string find_term = rpc::call_command_string("ui.find.term");
    std::transform(find_term.begin(), find_term.end(), find_term.begin(), ::tolower);

    // Render header line
    canvas->print(0, pos, "⇳ ");
    int custom_width = render_columns(true, narrow, rpc::make_target(), 0, canvas, column, pos, 0, column_defs);
    if (custom_width < 0) { // enter narrow mode
        canvas->print(x_base, pos, "%s", std::string(canvas->width() - x_base, ' ').c_str()); // clean slate
        narrow = true;
        custom_width = render_columns(true, narrow, rpc::make_target(), 0, canvas, column, pos, 0, column_defs);
    }
    column += custom_width; canvas->print(column, pos, "Name   "); column += NAME_RESERVED_WIDTH;
    if (int(canvas->width()) - 8 > column)
        canvas->print(canvas->width() - 8, pos, " Tracker");
    canvas->set_attr(0, pos, -1, attr_map[ps::COL_LABEL], ps::COL_LABEL); // header line unicolor

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

    // define iterator range
    Range range = rak::advance_bidirectional(
            view->begin_visible(),
            view->focus() != view->end_visible() ? view->focus() : view->begin_visible(),
            view->end_visible(),
            canvas->height()-2-2-network_history_lines);

    pos = CANVAS_POS_1ST_ITEM;
    while (range.first != range.second) {
        core::Download* d = *range.first;
        int offset = row_offset(view, range);
        int col_active = ps::COL_INFO;

        // Render focus marker
        canvas->print(0, pos, range.first == view->focus() ? "> " : "  ");

        // Render custom columns
        canvas->set_attr(1, pos, -1, attr_map[col_active + offset], col_active + offset); // base color, whole line
        column = x_base;
        render_columns(false, narrow, rpc::make_target(d), d, canvas, column, pos, offset, column_defs);
        column += custom_width;

        // Render name + tracker
        if (int(canvas->width()) > column) {
            std::string displayname = get_custom_string(d, "displayname");
            canvas->print(column, pos, "%s",
                u8_chop(displayname.empty() ? d->info()->name() : displayname.c_str(),
                        canvas->width() - column - 1).c_str());
            size_t hilite = std::string::npos;
            if (!find_term.empty()) {
                if (displayname.empty()) displayname = d->info()->name();
                std::transform(displayname.begin(), displayname.end(), displayname.begin(), ::tolower);
                hilite = displayname.find(find_term);
            }
            decorate_download_title(window, canvas, view, pos, range, column, hilite, find_term.length());
        }

        // Colorize focus marker
        if (range.first == view->focus()) {
            canvas->set_attr(0, pos, 1, attr_map[ps::COL_FOCUS], ps::COL_FOCUS);
        }

        // Advance to next item
        ++pos;
        ++range.first;
    }

    if (view->focus() != view->end_visible()) {
        char buffer[canvas->width() + 1];
        char* last = buffer + canvas->width() + 1;

        pos = canvas->height() - 2 - network_history_lines;
#if RT_HEX_VERSION <= 0x000906
        print_download_info(buffer, last, *view->focus());
#else
        print_download_info_full(buffer, last, *view->focus());
#endif
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
        for (uint32_t i = 1; i <= samples; ++i) {
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


torrent::Object apply_time_delta(const torrent::Object::list_type& args) {
    if (args.size() != 1 && args.size() != 2)
        throw torrent::input_error("convert.time_delta takes 1 or 2 arguments!");
    if (!args.front().is_value())
        throw torrent::input_error("convert.time_delta: time argument must be a value!");
    if (args.size() == 2 && !args.back().is_value())
        throw torrent::input_error("convert.time_delta: time-base argument must be a value!");

    return elapsed_time(args.front().as_value(), args.size() == 2 ? args.back().as_value() : 0L);
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


torrent::Object ui_find_next() {
    std::string term = rpc::call_command_string("ui.find.term");
    if (term.empty())
        return torrent::Object();  // no current search term set
    std::transform(term.begin(), term.end(), term.begin(), ::tolower);

    ui::DownloadList* dl_list = control->ui()->download_list();
    core::View* dl_view = dl_list->current_view();

    if (dl_view->empty_visible()) {
        control->core()->push_log("This view is empty, nothing to find!");
    } else {
        core::View::iterator itr = dl_view->focus() == dl_view->end_visible() ?
            dl_view->begin_visible() : dl_view->focus();
        bool found = false;

        do {
            if (++itr == dl_view->end_visible())
                itr = dl_view->begin_visible();

            // In C++11, this can be done more efficiently using std::search;
            // we only use this interactively, so meh.
            std::string name = get_custom_string(*itr, "displayname");
            if (name.empty()) name = (*itr)->info()->name();
            std::transform(name.begin(), name.end(), name.begin(), ::tolower);
            found = name.find(term) != std::string::npos;
        } while (!found && itr != (dl_view->focus() == dl_view->end_visible() ? dl_view->begin_visible() : dl_view->focus()));

        if (!found) {
            control->core()->push_log(("Cannot find anything matching '" + term + "'").c_str());
        } else if (itr != dl_view->focus()) {
            dl_view->set_focus(itr);
            dl_view->set_last_changed();
        }
    }

    return torrent::Object();
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
    CMD2_DL("d.tracker_alias", _cxxstd_::bind(&display::cmd_d_tracker_alias, _cxxstd_::placeholders::_1));

    CMD2_DL("d.message.alert", _cxxstd_::bind(&display::cmd_d_message_alert, _cxxstd_::placeholders::_1));

    CMD2_DL("d.eta.seconds", _cxxstd_::bind(&display::cmd_d_eta_seconds, _cxxstd_::placeholders::_1));
    CMD2_DL("d.eta.time", _cxxstd_::bind(&display::cmd_d_eta_time, _cxxstd_::placeholders::_1));

    CMD2_ANY        ("ui.canvas_color",         _cxxstd_::bind(&display::ui_canvas_color_get));
    CMD2_ANY_STRING ("ui.canvas_color.set",     _cxxstd_::bind(&display::ui_canvas_color_set, _cxxstd_::placeholders::_2));

    CMD2_ANY_LIST("ui.column.spec", &display::ui_column_spec);
    CMD2_ANY_LIST("ui.column.hide", &display::ui_column_hide);
    CMD2_ANY_LIST("ui.column.show", &display::ui_column_show);
    CMD2_ANY_LIST("ui.column.is_hidden", &display::ui_column_is_hidden);
    CMD2_ANY("ui.column.hidden.list", _cxxstd_::bind(&display::ui_column_hidden_list));
    CMD2_ANY("ui.column.sacrificial.list", _cxxstd_::bind(&display::ui_column_sacrificial_list));
    CMD2_VAR_VALUE("ui.column.sacrificed", 0);

    CMD2_ANY       ("ui.find.next", _cxxstd_::bind(&ui_find_next));
    CMD2_VAR_STRING("ui.find.term", "");

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
    PS_VARIABLE_COLOR("ui.color.custom1",       "");
    PS_VARIABLE_COLOR("ui.color.custom2",       "");
    PS_VARIABLE_COLOR("ui.color.custom3",       "");
    PS_VARIABLE_COLOR("ui.color.custom4",       "");
    PS_VARIABLE_COLOR("ui.color.custom5",       "");
    PS_VARIABLE_COLOR("ui.color.custom6",       "");
    PS_VARIABLE_COLOR("ui.color.custom7",       "");
    PS_VARIABLE_COLOR("ui.color.custom8",       "");
    PS_VARIABLE_COLOR("ui.color.custom9",       "");

    PS_CMD_ANY_FUN("system.colors.max",         display::get_colors);
    PS_CMD_ANY_FUN("system.colors.enabled",     has_colors);
    PS_CMD_ANY_FUN("system.colors.rgb",         can_change_color);

    CMD2_ANY_LIST("convert.time_delta",         _cxxstd_::bind(&apply_time_delta, _cxxstd_::placeholders::_2));
    CMD2_ANY_LIST("convert.human_size",         _cxxstd_::bind(&apply_human_size, _cxxstd_::placeholders::_2));
    CMD2_ANY_LIST("convert.magnitude",          _cxxstd_::bind(&apply_magnitude, _cxxstd_::placeholders::_2));


    // Set some defaults by executing an in-memory script
    std::string init_commands;
    for (int colidx = ps::COL_DEFAULT + 1; colidx < ps::COL_MAX; colidx++) {
        char cmdbuf[80];
        snprintf(cmdbuf, sizeof(cmdbuf),
                 "method.insert = %s.index, private|value|const, %d\n",
                 color_vars[colidx], colidx);
        init_commands.append(cmdbuf);
    }


    init_commands.append(
        // Multi-method to store column definitions
        "method.insert = ui.column.render, multi|rlookup|static\n"

        // Toggle sacrificial columns manually (bound to '/' key)
        "method.insert = ui.column.sacrificed.toggle, simple, \""
            "branch = (ui.column.sacrificed), ((ui.column.sacrificed.set, 0)), ((ui.column.sacrificed.set, 1)) ; "
            "branch = (ui.column.sacrificed),"
            "   \\\"ui.column.show = (ui.column.sacrificial.list)\\\","
            "   \\\"ui.column.hide = (ui.column.sacrificial.list)\\\" ; "
            "ui.current_view.set = (ui.current_view)\"\n"
        "schedule2 = column_sacrificed_toggle, 0, 0, ((ui.bind_key,download_list,/,ui.column.sacrificed.toggle=))\n"

        // Bind '*' to toggle between collapsed and expanded display
        "schedule2 = collapsed_view_toggle, 0, 0, ((ui.bind_key, download_list, *, \""
            "view.collapsed.toggle= ; ui.current_view.set = (ui.current_view)\"))\n"

        // Bind F3 to find the next item for 'ui.find.term'
        "schedule2 = ui_find_next_f3, 0, 0, ((ui.bind_key, download_list, 0413, \"ui.find.next=\"))\n"

        // Collapse built-in views
        "view.collapsed.toggle = main\n"
        "view.collapsed.toggle = name\n"
        "view.collapsed.toggle = started\n"
        "view.collapsed.toggle = stopped\n"
        "view.collapsed.toggle = complete\n"
        "view.collapsed.toggle = incomplete\n"
        "view.collapsed.toggle = hashing\n"
        "view.collapsed.toggle = seeding\n"
        "view.collapsed.toggle = leeching\n"
        "view.collapsed.toggle = active\n"

        //  1:    COL_CUSTOM1
        //  …
        //  9:    COL_CUSTOM9
        // 10:    COL_PROGRESS0
        // 11:    COL_PROGRESS20
        // 12:    COL_PROGRESS40
        // 13:    COL_PROGRESS60
        // 14:    COL_PROGRESS80
        // 15:    COL_PROGRESS100
        // 16:    COL_PROGRESS120
        // 17:    COL_TITLE
        // 18:    COL_FOOTER
        // 19:    COL_FOCUS
        // 20:    COL_LABEL
        // 21:    COL_INFO
        // 22:    COL_ALARM
        // 23:    COL_COMPLETE
        // 24:    COL_SEEDING
        // 25:    COL_STOPPED
        // 26:    COL_QUEUED
        // 27:    COL_INCOMPLETE
        // 28:    COL_LEECHING
        // 29:    COL_ODD
        // 30:    COL_EVEN

        // 70:    COL_ACTIVE_TIME
        // 71:    COL_UNSAFE_DATA
        // 72:    COL_THROTTLE_CH
        // 73:    COL_ETA_TIME

        // 90:    COL_DOWN_TIME
        // 91:    COL_PRIO
        // 92:    COL_STATE
        // 93:    COL_RATIO
        // 94:    COL_PROGRESS
        // 95:    COL_ALERT
        // 96:    COL_UP_TIME

        // Status flags (❢ ☢ ☍ ⌘)
        "method.set_key = ui.column.render, \"100:1C95/1:❢\","
        "    ((array.at, {\" \", \"♺\", \"ʘ\", \"⚠\", \"◔\", \"⇕\", \"↯\", \"¿\","
        "                 \"⨂\", \"⋫\", \"☡\"}, ((d.message.alert)) ))\n"
        "method.set_key = ui.column.render, \"110:?1C92/1:☢\","
        "    ((string.map, ((cat, ((d.is_open)), ((d.is_active)))), {00, \"▪\"}, {01, \"▪\"}, {10, \"╍\"}, {11, \"▹\"}))\n"
        "method.set_key = ui.column.render, \"120:?1:☍\","
        "    ((array.at, {\"⚯\", \" \"}, ((not, ((d.tied_to_file)) )) ))\n"
        "method.set_key = ui.column.render, \"130:?1:⌘\","
        "    ((array.at, {\"⚒\", \"◌\"}, ((d.ignore_commands)) ))\n"

        // Scrape info (↺ ⤴ ⤵)
        "method.set_key = ui.column.render, \"200:?2C23/2: ↺\", ((convert.magnitude, ((d.tracker_scrape.downloaded)) ))\n"
        "method.set_key = ui.column.render, \"210:?2C15/2: ⤴\", ((convert.magnitude, ((d.tracker_scrape.complete)) ))\n"
        "method.set_key = ui.column.render, \"220:?2C14/2: ⤵\", ((convert.magnitude, ((d.tracker_scrape.incomplete)) ))\n"

        // Traffic indicator (↕)
        "method.set_key = ui.column.render, \"300:?1:↕\","
        "    ((string.map, ((cat, ((not, ((d.up.rate)) )), ((not, ((d.down.rate)) )) )),"
        "                  {00, \"⇅\"}, {01, \"↟\"}, {10, \"↡\"}, {11, \" \"} ))\n"

        // Number of connected peers (℞)
        "method.set_key = ui.column.render, \"400:?2C28/2: ℞\", ((convert.magnitude, ((d.peers_connected)) ))\n"

        // Up|Last Active Time (∆⋮ ⟲)
        "method.set_key = ui.column.render, \"500:5C70/5: ∆⋮ ⟲\","
        "    ((if, ((d.up.rate)),"
        "        ((cat, \" \", ((convert.human_size, ((d.up.rate)), ((value, 10)) )) )),"
        "        ((if, ((d.peers_connected)), ((cat, \"   0”\")),"
        "                                     ((convert.time_delta, ((value, ((d.custom, last_active)) )) )) ))"
        "    ))\n"

        // Upload total (Σ⇈)
        "method.set_key = ui.column.render, \"600:?6C23/5C21/1:  Σ⇈  \","
        "    ((if, ((d.up.total)),"
        "        ((convert.human_size, ((d.up.total)), (value, 0))),"
        "        ((cat, \"   ⋅  \"))"
        "    ))\n"

        // Down|Completion or Loaded Time (∇⋮ ◷)
        // TODO: Could use "d.timestamp.started" and "d.timestamp.finished" here, but need to check
        //       when they were introduced, and if they're always set (e.g. what about fast-resumed items?)
        "method.set_key = ui.column.render, \"700:5C90/5: ∇⋮ ◷\","
        "    ((if, ((d.down.rate)),"
        "        ((cat, \" \", ((convert.human_size, ((d.down.rate)), ((value, 10)) )) )),"
        "        ((convert.time_delta, ((value, ((d.custom.if_z, tm_completed, ((d.custom, tm_loaded)) )) )) ))"
        "    ))\n"

        // Data size (⛁)
        "method.set_key = ui.column.render, \"800:4C15/3C21/1:  ⛁ \","
#if RT_HEX_VERSION <= 0x000906
        "    ((convert.human_size, ((d.size_bytes)) ))\n"
#else
        "    ((convert.human_size, ((d.selected_size_bytes)) ))\n"
#endif

        // Progress (⣿)
        "method.set_key = ui.column.render, \"900:1C94/1:⣿\","
        "    ((string.substr, \" ⠁⠉⠋⠛⠟⠿⡿⣿❚\", ((math.div, ((math.mul, ((d.completed_chunks)), 10)), ((math.add, ((d.completed_chunks)), ((d.wanted_chunks)))) )), 1, \"✔\"))\n"
        // " ⠁⠉⠋⠛⠟⠿⡿⣿❚"
        //⠀" ▁▂▃▄▅▆▇█❚"

        // Ratio (☯)
        "method.set_key = ui.column.render, \"920:1C93/1:☯\","
        "    ((string.substr, \"☹➀➁➂➃➄➅➆➇➈➉\", ((math.div, ((d.ratio)), 1000)), 1, \"⊛\"))\n"
        // "☹➀➁➂➃➄➅➆➇➈➉"
        // "☹①②③④⑤⑥⑦⑧⑨⑩"
        // "☹➊➋➌➍➎➏➐➑➒➓"

        // Explicitly managed status (✰ = prio; ⊘ = throttle name; ⚑ = tagged)
        "method.set_key = ui.column.render, \"940:1C91/1:✰\","
        "    ((array.at, {\"✖\", \"⇣\", \" \", \"⇡\"}, ((d.priority)) ))\n"
        "method.set_key = ui.column.render, \"950:1:⊘\","
        "    {(branch, ((equal,((d.throttle_name)),((cat,NULL)))), ((cat, \"∞\")), ((d.throttle_name)) )}\n"
        "method.set_key = ui.column.render, \"980:1C16/1:⚑\","
        "    ((array.at, {\" \", \"⚑\"}, ((d.views.has, tagged)) ))\n"
    );

    //printf("%s", init_commands.c_str());
    rpc::parse_command_multiple(rpc::make_target(), init_commands.c_str());
}
