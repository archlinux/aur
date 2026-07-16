



#include <gtk/gtk.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
#include <glib.h>
#include <vector>
#include <string>
#include <fstream>
#include <sstream>
#include <array>
#include <algorithm>
#include <map>
#include <cctype>
#include <unistd.h>
#include <signal.h>
#include <ctime>
#include <cstdio>
#include <cstring>
#include <sys/stat.h>
#include <sys/file.h>
#include <fcntl.h>









static constexpr int MAX_PREVIEW_LINES = 3;

struct AppConfig {
    int         max_history     = 150;
    size_t      max_text_size   = 512 * 1024;
    size_t      max_img_size    = 64 * 1024 * 1024;
    int         poll_ms         = 400;
    int         win_w           = 560;
    int         win_h           = 500;
    int         preview_lines   = 3;
    int         thumb_w         = 180;
    int         thumb_h         = 80;
    std::string accent_color    = "#3d22ef";
    std::string bg_color        = "#070711";
    std::string font_family     = "\"JetBrainsMono Nerd Font\", \"JetBrains Mono\", \"Fira Code\", monospace";
    int         font_size       = 13;
    std::string language        = "auto";
};

static AppConfig g_cfg;




enum StringId {
    STR_TITLE,
    STR_HINT,
    STR_CLEAR,
    STR_ITEMS,
    STR_IMAGE
};

static std::string get_localized_string(StringId id, size_t count = 0) {
    static bool init = false;
    static bool is_ru = false;
    if (!init) {
        if (g_cfg.language == "ru") {
            is_ru = true;
        } else if (g_cfg.language == "en") {
            is_ru = false;
        } else {

            const char *lang = getenv("LANG");
            const char *lc_all = getenv("LC_ALL");
            const char *lc_msg = getenv("LC_MESSAGES");
            std::string l = lang ? lang : "";
            if (lc_all) l = lc_all;
            else if (lc_msg) l = lc_msg;
            if (l.rfind("ru", 0) == 0 || l.find("_RU") != std::string::npos) {
                is_ru = true;
            }
        }
        init = true;
    }

    if (is_ru) {
        switch (id) {
            case STR_TITLE: return "  Буфер обмена";
            case STR_HINT:  return "Enter — вставить    Del — удалить    Esc — закрыть  ";
            case STR_CLEAR: return "  Очистить историю";
            case STR_ITEMS: {
                char buf[64];
                if (count % 10 == 1 && count % 100 != 11) {
                    snprintf(buf, sizeof(buf), "%zu элемент", count);
                } else if (count % 10 >= 2 && count % 10 <= 4 && (count % 100 < 10 || count % 100 >= 20)) {
                    snprintf(buf, sizeof(buf), "%zu элемента", count);
                } else {
                    snprintf(buf, sizeof(buf), "%zu элементов", count);
                }
                return buf;
            }
            case STR_IMAGE: return "  ИЗОБРАЖЕНИЕ";
        }
    } else {
        switch (id) {
            case STR_TITLE: return "  Clipboard History";
            case STR_HINT:  return "Enter - paste    Del - delete    Esc - close  ";
            case STR_CLEAR: return "  Clear history";
            case STR_ITEMS: {
                char buf[64];
                snprintf(buf, sizeof(buf), "%zu item%s", count, count == 1 ? "" : "s");
                return buf;
            }
            case STR_IMAGE: return "  IMAGE";
        }
    }
    return "";
}

static bool has_command(const char *cmd) {
    std::string check_cmd = std::string("which ") + cmd + " >/dev/null 2>&1";
    return system(check_cmd.c_str()) == 0;
}




enum ClipType { CLIP_TEXT, CLIP_IMAGE };

struct ClipItem {
    time_t      timestamp;
    ClipType    type;
    std::string text;
    std::string img_hash;
};

static std::vector<ClipItem> history;
static GtkWidget  *list_box      = nullptr;
static std::string last_text_clip;
static std::string last_img_hash;




static std::string g_hist_dir;
static std::string g_text_file;
static std::string g_img_dir;
static std::string g_config_dir;
static std::string g_config_file;
static int         g_lock_fd = -1;

static void init_paths() {
    const char *home = getenv("HOME");
    std::string home_dir = home ? home : "/tmp";

    g_hist_dir  = home_dir + "/.cache/cliphist_history";
    g_text_file = g_hist_dir + "/text_history";
    g_img_dir   = g_hist_dir + "/images";

    const char *xdg_config = getenv("XDG_CONFIG_HOME");
    std::string config_base = (xdg_config && *xdg_config) ? xdg_config : (home_dir + "/.config");
    g_config_dir  = config_base + "/cliphist";
    g_config_file = g_config_dir + "/config.ini";
}

static void ensure_dirs() {
    mkdir(g_hist_dir.c_str(), 0700);
    mkdir(g_img_dir.c_str(),  0700);
}

static std::string img_path(const std::string &hash) {
    return g_img_dir + "/" + hash + ".png";
}




static void init_lock() {
    ensure_dirs();
    std::string lock_path = g_hist_dir + "/.lock";
    g_lock_fd = open(lock_path.c_str(), O_CREAT | O_RDWR, 0600);
}

static void lock_ex() { if (g_lock_fd >= 0) flock(g_lock_fd, LOCK_EX); }
static void lock_sh() { if (g_lock_fd >= 0) flock(g_lock_fd, LOCK_SH); }
static void unlock()  { if (g_lock_fd >= 0) flock(g_lock_fd, LOCK_UN); }

static int g_daemon_lock_fd = -1;
static bool acquire_daemon_lock() {
    ensure_dirs();
    std::string lock_path = g_hist_dir + "/.daemon.lock";
    g_daemon_lock_fd = open(lock_path.c_str(), O_CREAT | O_RDWR, 0600);
    if (g_daemon_lock_fd < 0) return false;
    if (flock(g_daemon_lock_fd, LOCK_EX | LOCK_NB) < 0) {
        close(g_daemon_lock_fd);
        g_daemon_lock_fd = -1;
        return false;
    }
    return true;
}




static std::string sha256(const std::string &data) {
    gchar *h = g_compute_checksum_for_data(
        G_CHECKSUM_SHA256,
        (const guchar *)data.data(), data.size());
    std::string result = h ? h : "";
    g_free(h);
    return result;
}




static const std::string B64 =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static std::string b64_encode(const std::string &in) {
    std::string out;
    int val = 0, valb = -6;
    for (unsigned char c : in) {
        val  = (val << 8) + c;
        valb += 8;
        while (valb >= 0) { out.push_back(B64[(val >> valb) & 0x3F]); valb -= 6; }
    }
    if (valb > -6)
        out.push_back(B64[((val << 8) >> (valb + 8)) & 0x3F]);
    while (out.size() % 4) out.push_back('=');
    return out;
}

static std::string b64_decode(const std::string &in) {
    std::string out;
    std::vector<int> T(256, -1);
    for (int i = 0; i < 64; i++) T[(unsigned char)B64[i]] = i;
    int val = 0, valb = -8;
    for (unsigned char c : in) {
        if (T[c] == -1) break;
        val  = (val << 6) + T[c];
        valb += 6;
        if (valb >= 0) { out.push_back(char((val >> valb) & 0xFF)); valb -= 8; }
    }
    return out;
}




static std::string trim(const std::string &s) {
    size_t a = s.find_first_not_of(" \t\r\n");
    if (a == std::string::npos) return "";
    size_t b = s.find_last_not_of(" \t\r\n");
    return s.substr(a, b - a + 1);
}


static std::string strip_quotes(const std::string &s) {
    if (s.size() >= 2 &&
        ((s.front() == '"' && s.back() == '"') ||
         (s.front() == '\'' && s.back() == '\''))) {
        return s.substr(1, s.size() - 2);
    }
    return s;
}

static bool is_valid_hex_color(const std::string &s) {
    if (s.size() != 7 || s[0] != '#') return false;
    for (size_t i = 1; i < s.size(); ++i)
        if (!isxdigit((unsigned char)s[i])) return false;
    return true;
}

struct RGB { int r, g, b; };

static RGB hex_to_rgb(const std::string &hex) {
    RGB c{61, 34, 239};
    if (is_valid_hex_color(hex)) {
        c.r = std::stoi(hex.substr(1, 2), nullptr, 16);
        c.g = std::stoi(hex.substr(3, 2), nullptr, 16);
        c.b = std::stoi(hex.substr(5, 2), nullptr, 16);
    }
    return c;
}



static RGB lighten(const RGB &c, double factor) {
    auto mix = [&](int ch) {
        return (int)(ch + (255 - ch) * factor);
    };
    return { mix(c.r), mix(c.g), mix(c.b) };
}

static std::string rgba_str(const RGB &c, double alpha) {
    char buf[64];
    snprintf(buf, sizeof(buf), "rgba(%d, %d, %d, %.2f)", c.r, c.g, c.b, alpha);
    return buf;
}

static std::string hex_str(const RGB &c) {
    char buf[8];
    snprintf(buf, sizeof(buf), "#%02x%02x%02x", c.r, c.g, c.b);
    return buf;
}

static const char *DEFAULT_CONFIG_TEXT =
"# config\n"
"[history]\n"
"max_history = 150\n"
"max_text_size_kb = 512\n"
"max_img_size_mb = 64\n"
"\n"
"[daemon]\n"
"poll_interval_ms = 400\n"
"\n"
"[appearance]\n"
"window_width = 560\n"
"window_height = 500\n"
"accent_color = #3d22ef\n"
"background_color = #070711\n"
"font_family = \"JetBrainsMono Nerd Font\", \"JetBrains Mono\", \"Fira Code\", monospace\n"
"font_size = 13\n"
"preview_lines = 3\n"
"thumbnail_width = 180\n"
"thumbnail_height = 80\n"
"\n"
"[general]\n"
"language = auto\n";


static void ensure_config_dir() {
    size_t pos = 0;
    while ((pos = g_config_dir.find('/', pos + 1)) != std::string::npos) {
        std::string prefix = g_config_dir.substr(0, pos);
        if (!prefix.empty()) mkdir(prefix.c_str(), 0755);
    }
    mkdir(g_config_dir.c_str(), 0755);
}

static void write_default_config() {
    ensure_config_dir();
    std::ofstream f(g_config_file, std::ios::trunc);
    if (f) f << DEFAULT_CONFIG_TEXT;
}

static void load_config() {
    ensure_config_dir();

    if (access(g_config_file.c_str(), F_OK) != 0) {
        write_default_config();
        return;
    }

    std::ifstream f(g_config_file);
    if (!f) return;

    std::map<std::string, std::string> kv;
    std::string line;
    while (std::getline(f, line)) {
        std::string s = trim(line);
        if (s.empty() || s[0] == '#' || s[0] == ';' || s[0] == '[') continue;
        size_t eq = s.find('=');
        if (eq == std::string::npos) continue;
        std::string key = trim(s.substr(0, eq));
        std::string val = strip_quotes(trim(s.substr(eq + 1)));
        if (!key.empty()) kv[key] = val;
    }

    auto get_int = [&](const char *key, int def) -> int {
        auto it = kv.find(key);
        if (it == kv.end() || it->second.empty()) return def;
        try { return std::stoi(it->second); } catch (...) { return def; }
    };
    auto get_str = [&](const char *key, const std::string &def) -> std::string {
        auto it = kv.find(key);
        if (it == kv.end() || it->second.empty()) return def;
        return it->second;
    };

    g_cfg.max_history = std::max(1, get_int("max_history", (int)g_cfg.max_history));
    g_cfg.max_text_size = (size_t)std::max(1, get_int("max_text_size_kb", 512)) * 1024;
    g_cfg.max_img_size  = (size_t)std::max(1, get_int("max_img_size_mb", 64)) * 1024 * 1024;

    g_cfg.poll_ms = std::max(50, get_int("poll_interval_ms", g_cfg.poll_ms));

    g_cfg.win_w = std::max(200, get_int("window_width", g_cfg.win_w));
    g_cfg.win_h = std::max(200, get_int("window_height", g_cfg.win_h));

    std::string accent = get_str("accent_color", g_cfg.accent_color);
    g_cfg.accent_color = is_valid_hex_color(accent) ? accent : g_cfg.accent_color;

    std::string bg = get_str("background_color", g_cfg.bg_color);
    g_cfg.bg_color = is_valid_hex_color(bg) ? bg : g_cfg.bg_color;

    g_cfg.font_family = get_str("font_family", g_cfg.font_family);
    g_cfg.font_size = std::max(8, get_int("font_size", g_cfg.font_size));

    g_cfg.preview_lines = std::min(MAX_PREVIEW_LINES, std::max(1, get_int("preview_lines", g_cfg.preview_lines)));

    g_cfg.thumb_w = std::max(32, get_int("thumbnail_width", g_cfg.thumb_w));
    g_cfg.thumb_h = std::max(32, get_int("thumbnail_height", g_cfg.thumb_h));

    std::string lang = get_str("language", g_cfg.language);
    if (lang == "auto" || lang == "en" || lang == "ru") g_cfg.language = lang;
}




static void read_history_unlocked(std::vector<ClipItem> &out) {
    out.clear();
    std::ifstream f(g_text_file);
    if (!f) return;
    std::string line;
    while (std::getline(f, line)) {
        if (line.empty()) continue;
        std::istringstream ss(line);
        time_t ts; std::string type;
        ss >> ts >> type;
        if (type == "text") {
            std::string b64; ss >> b64;
            std::string text = b64_decode(b64);
            if (!text.empty())
                out.push_back({ts, CLIP_TEXT, text, ""});
        } else if (type == "image") {
            std::string hash; ss >> hash;
            if (!hash.empty() && access(img_path(hash).c_str(), F_OK) == 0)
                out.push_back({ts, CLIP_IMAGE, "", hash});
        }
    }
}

static void write_history_unlocked(const std::vector<ClipItem> &src) {
    ensure_dirs();
    std::ofstream f(g_text_file, std::ios::trunc);
    for (const auto &item : src) {
        if (item.type == CLIP_TEXT)
            f << item.timestamp << " text "  << b64_encode(item.text) << '\n';
        else
            f << item.timestamp << " image " << item.img_hash          << '\n';
    }
    f.flush();
}

static void save_history() {
    lock_ex();
    write_history_unlocked(history);
    unlock();
}

static void load_history() {
    lock_sh();
    read_history_unlocked(history);
    unlock();
}

static void init_last_clips() {
    load_history();
    if (!history.empty()) {
        const auto &top = history[0];
        if (top.type == CLIP_TEXT) {
            last_text_clip = top.text;
            last_img_hash = "";
        } else {
            last_img_hash = top.img_hash;
            last_text_clip = "";
        }
    } else {
        last_text_clip = "";
        last_img_hash = "";
    }
}




static std::string exec_read_binary(const char *cmd) {
    std::array<char, 8192> buf;
    std::string result;
    FILE *pipe = popen(cmd, "r");
    if (!pipe) return "";
    size_t n;
    while ((n = fread(buf.data(), 1, buf.size(), pipe)) > 0)
        result.append(buf.data(), n);
    pclose(pipe);
    return result;
}

static bool clipboard_has_image() {
    std::string types = exec_read_binary("wl-paste --list-types 2>/dev/null");
    static const std::array<const char *, 4> IMAGE_TYPES = {
        "image/png", "image/jpeg", "image/jpg", "image/bmp"
    };
    for (const char *t : IMAGE_TYPES)
        if (types.find(t) != std::string::npos) return true;
    return false;
}

static std::string get_clipboard_text() {
    std::string s = exec_read_binary("wl-paste --no-newline 2>/dev/null");
    if (s.size() > g_cfg.max_text_size) s.resize(g_cfg.max_text_size);
    return s;
}

static std::string get_clipboard_image_png() {
    std::string s = exec_read_binary("wl-paste --type image/png 2>/dev/null");
    if (s.size() > g_cfg.max_img_size) s.resize(g_cfg.max_img_size);
    return s;
}

static void copy_text_to_clipboard(const std::string &text) {
    FILE *pipe = popen("wl-copy", "w");
    if (!pipe) return;
    fwrite(text.c_str(), 1, text.size(), pipe);
    pclose(pipe);
}

static void copy_image_to_clipboard(const std::string &hash) {
    FILE *pipe = popen("wl-copy --type image/png", "w");
    if (!pipe) return;
    std::ifstream f(img_path(hash), std::ios::binary);
    if (f) {
        std::array<char, 8192> buf;
        while (f.read(buf.data(), buf.size()) || f.gcount() > 0)
            fwrite(buf.data(), 1, (size_t)f.gcount(), pipe);
    }
    pclose(pipe);
}










static void push_item(ClipItem item) {
    lock_ex();


    read_history_unlocked(history);


    auto it = std::find_if(history.begin(), history.end(), [&](const ClipItem &x) {
        if (x.type != item.type) return false;
        return (item.type == CLIP_TEXT)
            ? x.text == item.text
            : x.img_hash == item.img_hash;
    });
    if (it != history.end())
        history.erase(it);

    item.timestamp = time(nullptr);
    history.insert(history.begin(), item);

    if ((int)history.size() > g_cfg.max_history)
        history.pop_back();

    write_history_unlocked(history);
    unlock();
}

static void process_image_clip(const std::string &png_data) {
    if (png_data.empty()) return;
    std::string hash = sha256(png_data);
    if (hash == last_img_hash) return;
    last_img_hash  = hash;
    last_text_clip = "";

    std::string path = img_path(hash);
    if (access(path.c_str(), F_OK) != 0) {
        ensure_dirs();
        std::ofstream f(path, std::ios::binary);
        f.write(png_data.data(), (std::streamsize)png_data.size());
    }
    push_item({time(nullptr), CLIP_IMAGE, "", hash});
}

static void process_text_clip(const std::string &text) {
    if (text.empty() || text == last_text_clip) return;
    last_text_clip = text;
    last_img_hash  = "";
    push_item({time(nullptr), CLIP_TEXT, text, ""});
}





static std::string build_css() {
    RGB accent = hex_to_rgb(g_cfg.accent_color);
    RGB bg     = hex_to_rgb(g_cfg.bg_color);

    RGB accent_light  = lighten(accent, 0.35);
    RGB accent_lighter = lighten(accent, 0.55);
    RGB row_bg = lighten(bg, 0.06);

    std::ostringstream css;
    css << "* {\n"
        << "    font-family: " << g_cfg.font_family << ";\n"
        << "    font-size: " << g_cfg.font_size << "px;\n"
        << "    font-weight: bold;\n"
        << "    border: none;\n"
        << "    border-radius: 0;\n"
        << "    min-height: 0;\n"
        << "}\n\n"

        << "window {\n"
        << "    background: " << g_cfg.bg_color << ";\n"
        << "    border: 1px solid " << rgba_str(accent, 0.70) << ";\n"
        << "    border-radius: 14px;\n"
        << "}\n\n"

        << "list {\n"
        << "    background: transparent;\n"
        << "    padding: 6px 0;\n"
        << "}\n\n"

        << "row {\n"
        << "    background: " << rgba_str(row_bg, 0.90) << ";\n"
        << "    margin: 3px 8px;\n"
        << "    border-radius: 10px;\n"
        << "    border: 1px solid " << rgba_str(accent, 0.20) << ";\n"
        << "    padding: 0;\n"
        << "    transition: background-color 100ms, border-color 100ms;\n"
        << "}\n\n"

        << "row:hover {\n"
        << "    background: " << rgba_str(accent, 0.12) << ";\n"
        << "    border-color: " << rgba_str(accent, 0.55) << ";\n"
        << "}\n\n"

        << "row:selected {\n"
        << "    background: " << rgba_str(accent, 0.22) << ";\n"
        << "    border-color: " << rgba_str(accent, 0.90) << ";\n"
        << "}\n\n"

        << "row:selected .clip-num {\n"
        << "    background: " << g_cfg.accent_color << ";\n"
        << "    color: #ffffff;\n"
        << "}\n\n"

        << ".clip-num {\n"
        << "    font-size: 11px;\n"
        << "    font-weight: bold;\n"
        << "    color: " << hex_str(accent_light) << ";\n"
        << "    background: " << rgba_str(accent, 0.15) << ";\n"
        << "    padding: 2px 7px;\n"
        << "    border-radius: 5px;\n"
        << "    min-width: 22px;\n"
        << "}\n\n"

        << ".clip-time {\n"
        << "    font-size: 10px;\n"
        << "    font-weight: bold;\n"
        << "    color: rgba(255, 255, 255, 0.28);\n"
        << "    min-width: 44px;\n"
        << "}\n\n"

        << ".clip-line-0 {\n"
        << "    font-size: " << g_cfg.font_size << "px;\n"
        << "    font-weight: bold;\n"
        << "    color: #e8e8f8;\n"
        << "}\n\n"

        << ".clip-line-1 {\n"
        << "    font-size: " << (g_cfg.font_size - 1) << "px;\n"
        << "    font-weight: bold;\n"
        << "    color: rgba(220, 220, 255, 0.55);\n"
        << "}\n\n"

        << ".clip-line-2 {\n"
        << "    font-size: " << (g_cfg.font_size - 2) << "px;\n"
        << "    font-weight: bold;\n"
        << "    color: rgba(200, 200, 240, 0.32);\n"
        << "}\n\n"

        << ".clip-badge {\n"
        << "    font-size: 9px;\n"
        << "    font-weight: bold;\n"
        << "    color: " << hex_str(accent_light) << ";\n"
        << "    background: " << rgba_str(accent, 0.12) << ";\n"
        << "    padding: 1px 5px;\n"
        << "    border-radius: 3px;\n"
        << "    border: 1px solid " << rgba_str(accent, 0.35) << ";\n"
        << "}\n\n"

        << ".clip-img-badge {\n"
        << "    font-size: 10px;\n"
        << "    font-weight: bold;\n"
        << "    color: #ffffff;\n"
        << "    background: " << g_cfg.accent_color << ";\n"
        << "    padding: 2px 8px;\n"
        << "    border-radius: 5px;\n"
        << "}\n\n"

        << ".app-header {\n"
        << "    background: " << rgba_str(accent, 0.08) << ";\n"
        << "    border-bottom: 1px solid " << rgba_str(accent, 0.35) << ";\n"
        << "    padding: 10px 16px;\n"
        << "    border-radius: 14px 14px 0 0;\n"
        << "}\n\n"

        << ".app-title {\n"
        << "    font-size: " << (g_cfg.font_size + 1) << "px;\n"
        << "    font-weight: bold;\n"
        << "    color: " << hex_str(accent_lighter) << ";\n"
        << "}\n\n"

        << ".app-hint {\n"
        << "    font-size: 10px;\n"
        << "    font-weight: bold;\n"
        << "    color: rgba(255, 255, 255, 0.25);\n"
        << "}\n\n"

        << ".app-footer {\n"
        << "    background: " << rgba_str(accent, 0.06) << ";\n"
        << "    border-top: 1px solid " << rgba_str(accent, 0.30) << ";\n"
        << "    padding: 7px 14px;\n"
        << "    border-radius: 0 0 14px 14px;\n"
        << "}\n\n"

        << ".footer-count {\n"
        << "    font-size: 11px;\n"
        << "    font-weight: bold;\n"
        << "    color: rgba(255, 255, 255, 0.30);\n"
        << "}\n\n"



        << ".btn-clear {\n"
        << "    font-size: 11px;\n"
        << "    font-weight: bold;\n"
        << "    color: rgba(255, 100, 100, 0.80);\n"
        << "    background: rgba(220, 50, 50, 0.08);\n"
        << "    border: 1px solid rgba(220, 50, 50, 0.30);\n"
        << "    border-radius: 6px;\n"
        << "    padding: 3px 12px;\n"
        << "    transition: background-color 120ms, border-color 120ms, color 120ms;\n"
        << "}\n\n"

        << ".btn-clear:hover {\n"
        << "    background: rgba(220, 50, 50, 0.18);\n"
        << "    border-color: rgba(255, 80, 80, 0.70);\n"
        << "    color: #ff6464;\n"
        << "}\n\n"

        << ".btn-clear:active {\n"
        << "    background: rgba(220, 50, 50, 0.30);\n"
        << "}\n\n"

        << "scrolledwindow { background: transparent; }\n"
        << "scrollbar { background: transparent; border: none; }\n\n"

        << "scrollbar slider {\n"
        << "    background: " << rgba_str(accent, 0.35) << ";\n"
        << "    border-radius: 4px;\n"
        << "    min-width: 4px;\n"
        << "}\n\n"

        << "scrollbar slider:hover { background: " << rgba_str(accent_light, 0.80) << "; }\n";

    return css.str();
}




static void add_class(GtkWidget *w, const char *cls) {
    gtk_style_context_add_class(gtk_widget_get_style_context(w), cls);
}

static std::vector<std::string> split_lines(const std::string &text, int max_n) {
    std::vector<std::string> out;
    std::istringstream ss(text);
    std::string line;
    while (std::getline(ss, line) && (int)out.size() < max_n) {
        size_t s = line.find_first_not_of(" \t\r");
        if (s != std::string::npos) line = line.substr(s);
        if (!line.empty()) out.push_back(line);
    }
    return out;
}

static int count_lines(const std::string &text) {
    return 1 + (int)std::count(text.begin(), text.end(), '\n');
}

static const size_t LINE_LIMIT[MAX_PREVIEW_LINES] = {68, 64, 60};
static const char  *LINE_CSS [MAX_PREVIEW_LINES]  = {"clip-line-0","clip-line-1","clip-line-2"};




static void update_footer_count();
static void do_clear_all(GtkWidget *btn, gpointer win_ptr);

static void destroy_widget(GtkWidget *widget, gpointer) {
    gtk_widget_destroy(widget);
}




static void update_ui() {
    gtk_container_foreach(GTK_CONTAINER(list_box),
                          (GtkCallback)destroy_widget, nullptr);

    for (size_t i = 0; i < history.size(); ++i) {
        const ClipItem &item = history[i];

        GtkWidget *row  = gtk_list_box_row_new();
        GtkWidget *hbox = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 8);
        gtk_widget_set_margin_start  (hbox, 10);
        gtk_widget_set_margin_end    (hbox, 10);
        gtk_widget_set_margin_top    (hbox,  9);
        gtk_widget_set_margin_bottom (hbox,  9);

        GtkWidget *num = gtk_label_new(std::to_string(i + 1).c_str());
        add_class(num, "clip-num");
        gtk_widget_set_valign(num, GTK_ALIGN_START);
        gtk_box_pack_start(GTK_BOX(hbox), num, FALSE, FALSE, 0);

        char tbuf[8];
        struct tm tm_buf;
        localtime_r(&item.timestamp, &tm_buf);
        strftime(tbuf, sizeof(tbuf), "%H:%M", &tm_buf);
        GtkWidget *tlbl = gtk_label_new(tbuf);
        add_class(tlbl, "clip-time");
        gtk_widget_set_valign(tlbl, GTK_ALIGN_START);
        gtk_box_pack_start(GTK_BOX(hbox), tlbl, FALSE, FALSE, 0);

        if (item.type == CLIP_IMAGE) {
            GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 4);
            gtk_widget_set_hexpand(vbox, TRUE);

            GdkPixbuf *pb = gdk_pixbuf_new_from_file_at_scale(
                img_path(item.img_hash).c_str(),
                g_cfg.thumb_w, g_cfg.thumb_h, TRUE, nullptr);
            if (pb) {
                GtkWidget *img = gtk_image_new_from_pixbuf(pb);
                gtk_widget_set_halign(img, GTK_ALIGN_START);
                gtk_box_pack_start(GTK_BOX(vbox), img, FALSE, FALSE, 0);
                g_object_unref(pb);
            }

            std::string img_str = get_localized_string(STR_IMAGE);
            GtkWidget *badge = gtk_label_new(img_str.c_str());
            add_class(badge, "clip-img-badge");
            gtk_widget_set_halign(badge, GTK_ALIGN_START);
            gtk_box_pack_start(GTK_BOX(vbox), badge, FALSE, FALSE, 0);
            gtk_box_pack_start(GTK_BOX(hbox), vbox, TRUE, TRUE, 0);

        } else {
            int total = count_lines(item.text);
            std::vector<std::string> lines = split_lines(item.text, g_cfg.preview_lines);

            GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 1);
            gtk_widget_set_hexpand(vbox, TRUE);
            gtk_widget_set_valign(vbox, GTK_ALIGN_CENTER);

            for (size_t j = 0; j < lines.size(); ++j) {
                std::string preview = lines[j];
                size_t lim = LINE_LIMIT[j < MAX_PREVIEW_LINES ? j : MAX_PREVIEW_LINES - 1];
                if (preview.size() > lim)
                    preview = preview.substr(0, lim) + "…";

                GtkWidget *lbl = gtk_label_new(preview.c_str());
                add_class(lbl, LINE_CSS[j < MAX_PREVIEW_LINES ? j : MAX_PREVIEW_LINES - 1]);
                gtk_label_set_xalign(GTK_LABEL(lbl), 0.0f);
                gtk_label_set_ellipsize(GTK_LABEL(lbl), PANGO_ELLIPSIZE_END);
                gtk_widget_set_hexpand(lbl, TRUE);
                gtk_box_pack_start(GTK_BOX(vbox), lbl, FALSE, FALSE, 0);
            }

            gtk_box_pack_start(GTK_BOX(hbox), vbox, TRUE, TRUE, 0);

            if (total > 1) {
                GtkWidget *badge = gtk_label_new((std::to_string(total) + "L").c_str());
                add_class(badge, "clip-badge");
                gtk_widget_set_valign(badge, GTK_ALIGN_START);
                gtk_box_pack_end(GTK_BOX(hbox), badge, FALSE, FALSE, 0);
            }
        }

        gtk_container_add(GTK_CONTAINER(row), hbox);
        gtk_widget_show_all(row);
        gtk_list_box_insert(GTK_LIST_BOX(list_box), row, -1);
    }

    GtkListBoxRow *first = gtk_list_box_get_row_at_index(GTK_LIST_BOX(list_box), 0);
    if (first) gtk_list_box_select_row(GTK_LIST_BOX(list_box), first);
    update_footer_count();
}

static GtkWidget *g_footer_count_lbl = nullptr;

static void update_footer_count() {
    if (!g_footer_count_lbl) return;
    std::string items_str = get_localized_string(STR_ITEMS, history.size());
    gtk_label_set_text(GTK_LABEL(g_footer_count_lbl), items_str.c_str());
}




static void do_select_and_quit(int index) {
    if (index >= 0 && index < (int)history.size()) {
        const ClipItem &item = history[index];
        if (item.type == CLIP_TEXT)
            copy_text_to_clipboard(item.text);
        else
            copy_image_to_clipboard(item.img_hash);
    }
    gtk_main_quit();
}

static void do_delete_selected() {
    GtkListBoxRow *row = gtk_list_box_get_selected_row(GTK_LIST_BOX(list_box));
    if (!row) return;
    int index = gtk_list_box_row_get_index(row);
    if (index < 0 || index >= (int)history.size()) return;

    if (history[index].type == CLIP_IMAGE)
        unlink(img_path(history[index].img_hash).c_str());




    if (history[index].type == CLIP_TEXT &&
        history[index].text == last_text_clip)
        last_text_clip.clear();
    if (history[index].type == CLIP_IMAGE &&
        history[index].img_hash == last_img_hash)
        last_img_hash.clear();

    history.erase(history.begin() + index);
    save_history();
    update_ui();
    update_footer_count();

    int next = index;
    if (next >= (int)history.size()) next = (int)history.size() - 1;
    if (next >= 0) {
        GtkListBoxRow *nrow = gtk_list_box_get_row_at_index(GTK_LIST_BOX(list_box), next);
        if (nrow) gtk_list_box_select_row(GTK_LIST_BOX(list_box), nrow);
    }
}

static void on_row_activated(GtkListBox *, GtkListBoxRow *row, gpointer) {
    do_select_and_quit(gtk_list_box_row_get_index(row));
}

static gboolean on_key_press(GtkWidget *, GdkEventKey *ev, gpointer) {
    switch (ev->keyval) {
    case GDK_KEY_Escape:
        gtk_main_quit();
        return TRUE;
    case GDK_KEY_Return:
    case GDK_KEY_KP_Enter: {
        GtkListBoxRow *row = gtk_list_box_get_selected_row(GTK_LIST_BOX(list_box));
        if (row) do_select_and_quit(gtk_list_box_row_get_index(row));
        return TRUE;
    }
    case GDK_KEY_Delete:
    case GDK_KEY_KP_Delete:
        if (ev->state & GDK_CONTROL_MASK) {

            GtkWidget *toplevel = gtk_widget_get_toplevel(GTK_WIDGET(list_box));
            do_clear_all(nullptr, toplevel);
        } else {
            do_delete_selected();
        }
        return TRUE;
    default:
        return FALSE;
    }
}

static void do_clear_all(GtkWidget *btn, gpointer win_ptr) {
    (void)btn;
    (void)win_ptr;

    for (const auto &item : history)
        if (item.type == CLIP_IMAGE)
            unlink(img_path(item.img_hash).c_str());

    history.clear();
    last_text_clip.clear();
    last_img_hash.clear();
    save_history();
    update_ui();
    update_footer_count();
}

static gboolean poll_clipboard(gpointer) {
    if (clipboard_has_image()) {
        std::string png = get_clipboard_image_png();
        if (!png.empty()) {
            std::string hash = sha256(png);
            if (hash != last_img_hash) {
                process_image_clip(png);
                update_ui();
            }
        }
    } else {
        std::string text = get_clipboard_text();
        if (!text.empty() && text != last_text_clip) {
            process_text_clip(text);
            update_ui();
        }
    }
    return TRUE;
}





static void show_error_dialog(const std::string &message) {
    GtkWidget *dialog = gtk_message_dialog_new(
        nullptr,
        GTK_DIALOG_MODAL,
        GTK_MESSAGE_ERROR,
        GTK_BUTTONS_CLOSE,
        "%s", message.c_str());
    gtk_window_set_title(GTK_WINDOW(dialog), "Error");
    gtk_dialog_run(GTK_DIALOG(dialog));
    gtk_widget_destroy(dialog);
}

static void run_gui(int argc, char **argv) {
    g_set_prgname("cliphist-cpp");
    g_set_application_name("cliphist-cpp");

    gtk_init(&argc, &argv);

    if (!has_command("wl-paste") || !has_command("wl-copy")) {
        show_error_dialog("The 'wl-clipboard' package (wl-paste and wl-copy) is required but was not found in PATH.\nPlease install it to use this application.");
        return;
    }

    init_lock();
    init_last_clips();

    GtkCssProvider *css = gtk_css_provider_new();
    std::string css_str = build_css();
    gtk_css_provider_load_from_data(css, css_str.c_str(), -1, nullptr);
    gtk_style_context_add_provider_for_screen(
        gdk_screen_get_default(),
        GTK_STYLE_PROVIDER(css),
        GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);

    GtkWidget *win = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title            (GTK_WINDOW(win), "cliphist-cpp");
    gtk_window_set_decorated        (GTK_WINDOW(win), FALSE);
    gtk_window_set_keep_above       (GTK_WINDOW(win), TRUE);
    gtk_window_set_skip_taskbar_hint(GTK_WINDOW(win), TRUE);
    gtk_window_set_skip_pager_hint  (GTK_WINDOW(win), TRUE);
    gtk_window_set_default_size     (GTK_WINDOW(win), g_cfg.win_w, g_cfg.win_h);
    gtk_window_set_resizable        (GTK_WINDOW(win), FALSE);
    gtk_window_set_focus_on_map     (GTK_WINDOW(win), FALSE);

    g_signal_connect(win, "destroy",         G_CALLBACK(gtk_main_quit), nullptr);
    g_signal_connect(win, "key-press-event", G_CALLBACK(on_key_press),  nullptr);

    GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_container_add(GTK_CONTAINER(win), vbox);


    GtkWidget *header = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    add_class(header, "app-header");

    GtkWidget *title = gtk_label_new(get_localized_string(STR_TITLE).c_str());
    add_class(title, "app-title");
    gtk_label_set_xalign(GTK_LABEL(title), 0.0f);
    gtk_widget_set_hexpand(title, TRUE);

    GtkWidget *hint = gtk_label_new(get_localized_string(STR_HINT).c_str());
    add_class(hint, "app-hint");

    gtk_box_pack_start(GTK_BOX(header), title, TRUE,  TRUE,  0);
    gtk_box_pack_start(GTK_BOX(header), hint,  FALSE, FALSE, 0);
    gtk_box_pack_start(GTK_BOX(vbox), header, FALSE, FALSE, 0);

    GtkWidget *scroll = gtk_scrolled_window_new(nullptr, nullptr);
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scroll),
                                   GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
    gtk_box_pack_start(GTK_BOX(vbox), scroll, TRUE, TRUE, 0);

    list_box = gtk_list_box_new();
    gtk_list_box_set_selection_mode(GTK_LIST_BOX(list_box), GTK_SELECTION_SINGLE);
    gtk_container_add(GTK_CONTAINER(scroll), list_box);

    g_signal_connect(list_box, "row-activated", G_CALLBACK(on_row_activated), nullptr);


    GtkWidget *footer = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    add_class(footer, "app-footer");

    g_footer_count_lbl = gtk_label_new("");
    add_class(g_footer_count_lbl, "footer-count");
    gtk_label_set_xalign(GTK_LABEL(g_footer_count_lbl), 0.0f);
    gtk_widget_set_hexpand(g_footer_count_lbl, TRUE);
    update_footer_count();

    GtkWidget *btn_clear = gtk_button_new_with_label(get_localized_string(STR_CLEAR).c_str());
    add_class(btn_clear, "btn-clear");
    gtk_widget_set_focus_on_click(btn_clear, FALSE);
    g_signal_connect(btn_clear, "clicked", G_CALLBACK(do_clear_all), win);

    gtk_box_pack_start(GTK_BOX(footer), g_footer_count_lbl, TRUE,  TRUE,  0);
    gtk_box_pack_start(GTK_BOX(footer), btn_clear,          FALSE, FALSE, 0);
    gtk_box_pack_start(GTK_BOX(vbox),   footer,             FALSE, FALSE, 0);

    update_ui();
    gtk_widget_show_all(win);

    g_timeout_add(g_cfg.poll_ms, poll_clipboard, nullptr);
    gtk_main();
}




static volatile sig_atomic_t g_running = 1;
static void handle_signal(int) { g_running = 0; }

static void run_daemon() {
    signal(SIGINT,  handle_signal);
    signal(SIGTERM, handle_signal);
    init_lock();
    init_last_clips();

    while (g_running) {
        bool has_image = clipboard_has_image();
        bool success = false;
        if (has_image) {
            std::string png = get_clipboard_image_png();
            if (!png.empty()) {
                process_image_clip(png);
                success = true;
            }
        } else {
            std::string text = get_clipboard_text();
            if (!text.empty()) {
                process_text_clip(text);
                success = true;
            }
        }

        if (!success) {

            load_history();
            if (!history.empty()) {
                const auto &top = history[0];
                if (top.type == CLIP_TEXT) {
                    if (last_text_clip != top.text) {
                        last_text_clip = top.text;
                        last_img_hash = "";
                    }
                    copy_text_to_clipboard(last_text_clip);
                } else {
                    if (last_img_hash != top.img_hash) {
                        last_img_hash = top.img_hash;
                        last_text_clip = "";
                    }
                    copy_image_to_clipboard(last_img_hash);
                }
            } else {
                last_text_clip = "";
                last_img_hash = "";
                system("wl-copy -c");
            }
        }
        usleep(g_cfg.poll_ms * 1000);
    }
    save_history();
}

static void print_usage(const char *prog) {
    printf("Usage: %s [options]\n\n", prog);
    printf("Options:\n");
    printf("  --daemon    Run in background daemon mode to monitor clipboard\n");
    printf("  -h, --help  Show this help message\n");
}

int main(int argc, char **argv) {
    init_paths();
    load_config();

    if (argc > 1) {
        std::string arg = argv[1];
        if (arg == "--daemon") {
            if (!has_command("wl-paste") || !has_command("wl-copy")) {
                fprintf(stderr, "Error: wl-clipboard package (wl-paste and wl-copy) is required but was not found in PATH.\n");
                return 1;
            }
            if (!acquire_daemon_lock()) {
                fprintf(stderr, "Error: Another instance of cliphist-cpp daemon is already running.\n");
                return 1;
            }
            run_daemon();
            return 0;
        } else if (arg == "--help" || arg == "-h") {
            print_usage(argv[0]);
            return 0;
        } else {
            fprintf(stderr, "Unknown option: %s\n", argv[1]);
            print_usage(argv[0]);
            return 1;
        }
    }

    run_gui(argc, argv);
    return 0;
}
