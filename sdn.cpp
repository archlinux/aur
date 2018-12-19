//
// sdn: simple directory navigator
//
// Copyright (c) 2017 - 2018, Přemysl Janouch <p@janouch.name>
//
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
// SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
// OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
// CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//

// May be required for ncursesw and we generally want it all anyway
#define _XOPEN_SOURCE_EXTENDED

#include <string>
#include <vector>
#include <locale>
#include <iostream>
#include <algorithm>
#include <cwchar>
#include <climits>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <map>
#include <tuple>
#include <memory>

#include <unistd.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/acl.h>
#include <fcntl.h>
#include <pwd.h>
#include <grp.h>
#include <libgen.h>

#include <sys/inotify.h>
#include <sys/xattr.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <acl/libacl.h>
#include <ncurses.h>

// Unicode is complex enough already and we might make assumptions
#ifndef __STDC_ISO_10646__
#error Unicode required for wchar_t
#endif

// Trailing return types make C++ syntax suck considerably less
#define fun static auto

#ifndef A_ITALIC
#define A_ITALIC 0
#endif

using namespace std;

// For some reason handling of encoding in C and C++ is extremely annoying
// and C++17 ironically obsoletes C++11 additions that made it less painful
fun to_wide (const string &multi) -> wstring {
	wstring wide; wchar_t w; mbstate_t mb {};
	size_t n = 0, len = multi.length () + 1;
	while (auto res = mbrtowc (&w, multi.c_str () + n, len - n, &mb)) {
		if (res == size_t (-1) || res == size_t (-2))
			return L"/invalid encoding/";

		n += res;
		wide += w;
	}
	return wide;
}

fun to_mb (const wstring &wide) -> string {
	string mb; char buf[MB_LEN_MAX + 1]; mbstate_t mbs {};
	for (size_t n = 0; n <= wide.length (); n++) {
		auto res = wcrtomb (buf, wide.c_str ()[n], &mbs);
		if (res == size_t (-1))
			throw invalid_argument ("invalid encoding");
		mb.append (buf, res);
	}
	// There's one extra NUL character added by wcrtomb()
	mb.erase (mb.length () - 1);
	return mb;
}

fun prefix_length (const wstring &in, const wstring &of) -> int {
	int score = 0;
	for (size_t i = 0; i < of.size () && in.size () >= i && in[i] == of[i]; i++)
		score++;
	return score;
}

// TODO: this omits empty elements, check usages
fun split (const string &s, const string &sep, vector<string> &out) {
	size_t mark = 0, p = s.find (sep);
	for (; p != string::npos; p = s.find (sep, (mark = p + sep.length ())))
		if (mark < p)
			out.push_back (s.substr (mark, p - mark));
	if (mark < s.length ())
		out.push_back (s.substr (mark));
}

fun split (const string &s, const string &sep) -> vector<string> {
	vector<string> result; split (s, sep, result); return result;
}

fun needs_shell_quoting (const string &v) -> bool {
	// IEEE Std 1003.1 sh + the exclamation mark because of csh/bash
	// history expansion, implicitly also the NUL character
	for (auto c : v)
		if (strchr ("|&;<>()$`\\\"' \t\n" "*?[#˜=%" "!", c))
			return true;
	return v.empty ();
}

fun shell_escape (const string &v) -> string {
	if (!needs_shell_quoting (v))
		return v;

	string result;
	for (auto c : v)
		if (c == '\'')
			result += "'\\''";
		else
			result += c;
	return "'" + result + "'";
}

fun parse_line (istream &is, vector<string> &out) -> bool {
	enum {STA, DEF, COM, ESC, WOR, QUO, STATES};
	enum {TAKE = 1 << 3, PUSH = 1 << 4, STOP = 1 << 5, ERROR = 1 << 6};
	enum {TWOR = TAKE | WOR};

	// We never transition back to the start state, so it can stay as a noop
	static char table[STATES][7] = {
	// state   EOF          SP, TAB     '     #     \     LF           default
	/* STA */ {ERROR,       DEF,        QUO,  COM,  ESC,  STOP,        TWOR},
	/* DEF */ {STOP,        0,          QUO,  COM,  ESC,  STOP,        TWOR},
	/* COM */ {STOP,        0,          0,    0,    0,    STOP,        0},
	/* ESC */ {ERROR,       TWOR,       TWOR, TWOR, TWOR, TWOR,        TWOR},
	/* WOR */ {STOP | PUSH, DEF | PUSH, QUO,  TAKE, ESC,  STOP | PUSH, TAKE},
	/* QUO */ {ERROR,       TAKE,       WOR,  TAKE, TAKE, TAKE,        TAKE},
	};

	out.clear (); string token; int state = STA;
	constexpr auto eof = istream::traits_type::eof ();
	while (1) {
		int ch = is.get (), edge = 0;
		switch (ch) {
		case eof:  edge = table[state][0]; break;
		case '\t':
		case ' ':  edge = table[state][1]; break;
		case '\'': edge = table[state][2]; break;
		case '#':  edge = table[state][3]; break;
		case '\\': edge = table[state][4]; break;
		case '\n': edge = table[state][5]; break;
		default:   edge = table[state][6]; break;
		}
		if (edge & TAKE)
			token += ch;
		if (edge & PUSH) {
			out.push_back (token);
			token.clear ();
		}
		if (edge & STOP)
			return true;
		if (edge & ERROR)
			return false;
		if (edge &= 7)
			state = edge;
	}
}

fun write_line (ostream &os, const vector<string> &in) {
	if (!in.empty ())
		os << shell_escape (in.at (0));
	for (size_t i = 1; i < in.size (); i++)
		os << " " << shell_escape (in.at (i));
	os << endl;
}

fun decode_type (mode_t m) -> wchar_t {
	if (S_ISDIR  (m)) return L'd'; if (S_ISBLK  (m)) return L'b';
	if (S_ISCHR  (m)) return L'c'; if (S_ISLNK  (m)) return L'l';
	if (S_ISFIFO (m)) return L'p'; if (S_ISSOCK (m)) return L's';
	if (S_ISREG  (m)) return L'-';
	return L'?';
}

/// Return the modes of a file in the usual stat/ls format
fun decode_mode (mode_t m) -> wstring {
	return {decode_type (m),
		L"r-"[!(m & S_IRUSR)],
		L"w-"[!(m & S_IWUSR)],
		((m & S_ISUID) ? L"sS" : L"x-")[!(m & S_IXUSR)],
		L"r-"[!(m & S_IRGRP)],
		L"w-"[!(m & S_IWGRP)],
		((m & S_ISGID) ? L"sS" : L"x-")[!(m & S_IXGRP)],
		L"r-"[!(m & S_IROTH)],
		L"w-"[!(m & S_IWOTH)],
		((m & S_ISVTX) ? L"tT" : L"x-")[!(m & S_IXOTH)]};
}

template<class T> fun shift (vector<T> &v) -> T {
	auto front = v.front (); v.erase (begin (v)); return front;
}

fun capitalize (const string &s) -> string {
	string result;
	for (auto c : s)
		result += result.empty () ? toupper (c) : tolower (c);
	return result;
}

/// Underlining for teletypes, also imitated in more(1) and less(1)
fun underline (const string& s) -> string {
	string result;
	for (auto c : s)
		result.append ({c, 8, '_'});
	return result;
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

fun xdg_config_home () -> string {
	const char *user_dir = getenv ("XDG_CONFIG_HOME");
	if (user_dir && user_dir[0] == '/')
		return user_dir;

	const char *home_dir = getenv ("HOME");
	return string (home_dir ? home_dir : "") + "/.config";
}

// In C++17 we will get <optional> but until then there's unique_ptr
fun xdg_config_find (const string &suffix) -> unique_ptr<ifstream> {
	vector<string> dirs {xdg_config_home ()};
	const char *system_dirs = getenv ("XDG_CONFIG_DIRS");
	split (system_dirs ? system_dirs : "/etc/xdg", ":", dirs);
	for (const auto &dir : dirs) {
		if (dir[0] != '/')
			continue;
		auto ifs = make_unique<ifstream>
			(dir + "/" PROJECT_NAME "/" + suffix);
		if (*ifs)
			return ifs;
	}
	return nullptr;
}

fun xdg_config_write (const string &suffix) -> unique_ptr<fstream> {
	auto dir = xdg_config_home ();
	if (dir[0] == '/') {
		auto path = dir + "/" PROJECT_NAME "/" + suffix;
		if (!fork ())
			_exit (-execlp ("mkdir", "mkdir", "-p",
				dirname (strdup (path.c_str ())), NULL));
		auto fs = make_unique<fstream>
			(path, fstream::in | fstream::out | fstream::trunc);
		if (*fs)
			return fs;
	}
	return nullptr;
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

using ncstring = basic_string<cchar_t>;

fun cchar (chtype attrs, wchar_t c) -> cchar_t {
	cchar_t ch {}; wchar_t ws[] = {c, 0};
	setcchar (&ch, ws, attrs, PAIR_NUMBER (attrs), nullptr);
	return ch;
}

fun decolor (cchar_t &ch) {
	wchar_t c[CCHARW_MAX]; attr_t attrs; short pair;
	getcchar (&ch, c, &attrs, &pair, nullptr);
	setcchar (&ch, c, attrs &~ A_REVERSE, 0, nullptr);
}

fun invert (cchar_t &ch) {
	wchar_t c[CCHARW_MAX]; attr_t attrs; short pair;
	getcchar (&ch, c, &attrs, &pair, nullptr);
	setcchar (&ch, c, attrs ^ A_REVERSE, 0, nullptr);
}

fun apply_attrs (const wstring &w, attr_t attrs) -> ncstring {
	ncstring res;
	for (auto c : w)
		res += cchar (attrs, c);
	return res;
}

fun sanitize_char (chtype attrs, wchar_t c) -> ncstring {
	if (c < 32)
		return {cchar (attrs | A_REVERSE, L'^'),
				cchar (attrs | A_REVERSE, c + 64)};
	if (!iswprint (c))
		return {cchar (attrs | A_REVERSE, L'?')};
	return {cchar (attrs, c)};
}

fun sanitize (const ncstring &nc) -> ncstring {
	ncstring out;
	for (cchar_t c : nc)
		for (size_t i = 0; i < CCHARW_MAX && c.chars[i]; i++)
			out += sanitize_char (c.attr, c.chars[i]);
	return out;
}

fun print (const ncstring &nc, int limit) -> int {
	int total_width = 0;
	for (cchar_t c : sanitize (nc)) {
		int width = wcwidth (c.chars[0]);
		if (total_width + width > limit)
			break;

		add_wch (&c);
		total_width += width;
	}
	return total_width;
}

fun compute_width (const wstring &w) -> int {
	int total = 0;
	for (const auto &c : w)
		total += wcwidth (c);
	return total;
}

fun compute_width (const ncstring &nc) -> int {
	int total = 0;
	for (const auto &c : nc)
		total += wcwidth (c.chars[0]);
	return total;
}

// TODO: maybe we need formatting for the padding passed in?
fun align (const ncstring &nc, int target) -> ncstring {
	auto current = compute_width (nc);
	auto missing = abs (target) - current;
	if (missing <= 0)
		return nc;
	return target < 0
		? nc + apply_attrs (wstring (missing, L' '), 0)
		: apply_attrs (wstring (missing, L' '), 0) + nc;
}

fun allocate_pair (short fg, short bg) -> short {
	static short counter = 1; init_pair (counter, fg, bg); return counter++;
}

fun decode_attrs (const vector<string> &attrs) -> chtype {
	chtype result = 0; int fg = -1, bg = -1, colors = 0;
	for (const auto &s : attrs) {
		char *end; auto color = strtol (s.c_str (), &end, 10);
		if (!*end && color >= -1 && color < COLORS) {
			if    (++colors == 1) fg = color;
			else if (colors == 2) bg = color;
		}
		else if (s == "bold")    result |= A_BOLD;
		else if (s == "dim")     result |= A_DIM;
		else if (s == "ul")      result |= A_UNDERLINE;
		else if (s == "blink")   result |= A_BLINK;
		else if (s == "reverse") result |= A_REVERSE;
		else if (s == "italic")  result |= A_ITALIC;
	}
	if (fg != -1 || bg != -1)
		result |= COLOR_PAIR (allocate_pair (fg, bg));
	return result;
}

// --- Application -------------------------------------------------------------

enum { ALT = 1 << 24, SYM = 1 << 25 };  // Outside the range of Unicode
#define KEY(name) (SYM | KEY_ ## name)
#define CTRL 31 &

#define ACTIONS(XX) XX(NONE) XX(HELP) XX(QUIT) XX(QUIT_NO_CHDIR) \
	XX(CHOOSE) XX(CHOOSE_FULL) XX(VIEW) XX(EDIT) XX(SORT_LEFT) XX(SORT_RIGHT) \
	XX(UP) XX(DOWN) XX(TOP) XX(BOTTOM) XX(PAGE_PREVIOUS) XX(PAGE_NEXT) \
	XX(SCROLL_UP) XX(SCROLL_DOWN) XX(CHDIR) XX(GO_START) XX(GO_HOME) \
	XX(SEARCH) XX(RENAME) XX(RENAME_PREFILL) \
	XX(TOGGLE_FULL) XX(REVERSE_SORT) XX(SHOW_HIDDEN) XX(REDRAW) XX(RELOAD) \
	XX(INPUT_ABORT) XX(INPUT_CONFIRM) XX(INPUT_B_DELETE)

#define XX(name) ACTION_ ## name,
enum action { ACTIONS(XX) ACTION_COUNT };
#undef XX

#define XX(name) #name,
static const char *g_action_names[] = {ACTIONS(XX)};
#undef XX

static map<wint_t, action> g_normal_actions {
	{ALT | '\r', ACTION_CHOOSE_FULL}, {ALT | KEY (ENTER), ACTION_CHOOSE_FULL},
	{'\r', ACTION_CHOOSE}, {KEY (ENTER), ACTION_CHOOSE},
	{KEY (F (3)), ACTION_VIEW}, {KEY (F (4)), ACTION_EDIT}, {'h', ACTION_HELP},
	{'q', ACTION_QUIT}, {ALT | 'q', ACTION_QUIT_NO_CHDIR},
	// M-o ought to be the same shortcut the navigator is launched with
	{ALT | 'o', ACTION_QUIT},
	{'<', ACTION_SORT_LEFT}, {'>', ACTION_SORT_RIGHT},
	{'k', ACTION_UP}, {CTRL 'p', ACTION_UP}, {KEY (UP), ACTION_UP},
	{'j', ACTION_DOWN}, {CTRL 'n', ACTION_DOWN}, {KEY (DOWN), ACTION_DOWN},
	{'g', ACTION_TOP}, {ALT | '<', ACTION_TOP}, {KEY (HOME), ACTION_TOP},
	{'G', ACTION_BOTTOM}, {ALT | '>', ACTION_BOTTOM}, {KEY(END), ACTION_BOTTOM},
	{KEY (PPAGE), ACTION_PAGE_PREVIOUS}, {KEY (NPAGE), ACTION_PAGE_NEXT},
	{CTRL 'y', ACTION_SCROLL_UP}, {CTRL 'e', ACTION_SCROLL_DOWN},
	{'c', ACTION_CHDIR}, {'&', ACTION_GO_START}, {'~', ACTION_GO_HOME},
	{'/', ACTION_SEARCH},  {'s', ACTION_SEARCH},
	{ALT | 'e', ACTION_RENAME_PREFILL}, {'e', ACTION_RENAME},
	{'t', ACTION_TOGGLE_FULL}, {ALT | 't', ACTION_TOGGLE_FULL},
	{'R', ACTION_REVERSE_SORT}, {ALT | '.', ACTION_SHOW_HIDDEN},
	{CTRL 'L', ACTION_REDRAW}, {'r', ACTION_RELOAD},
};
static map<wint_t, action> g_input_actions {
	{27, ACTION_INPUT_ABORT}, {CTRL 'g', ACTION_INPUT_ABORT},
	{L'\r', ACTION_INPUT_CONFIRM}, {KEY (ENTER), ACTION_INPUT_CONFIRM},
	{KEY (BACKSPACE), ACTION_INPUT_B_DELETE},
};
static const map<string, map<wint_t, action>*> g_binding_contexts {
	{"normal", &g_normal_actions}, {"input", &g_input_actions},
};

#define LS(XX) XX(NORMAL, "no") XX(FILE, "fi") XX(RESET, "rs") \
	XX(DIRECTORY, "di") XX(SYMLINK, "ln") XX(MULTIHARDLINK, "mh") \
	XX(FIFO, "pi") XX(SOCKET, "so") XX(DOOR, "do") XX(BLOCK, "bd") \
	XX(CHARACTER, "cd") XX(ORPHAN, "or") XX(MISSING, "mi") XX(SETUID, "su") \
	XX(SETGID, "sg") XX(CAPABILITY, "ca") XX(STICKY_OTHER_WRITABLE, "tw") \
	XX(OTHER_WRITABLE, "ow") XX(STICKY, "st") XX(EXECUTABLE, "ex")

#define XX(id, name) LS_ ## id,
enum { LS(XX) LS_COUNT };
#undef XX

#define XX(id, name) name,
static const char *g_ls_colors[] = {LS(XX)};
#undef XX

struct stringcaseless {
	bool operator () (const string &a, const string &b) const {
		const auto &c = locale::classic();
		return lexicographical_compare (begin (a), end (a), begin (b), end (b),
			[&](char m, char n) { return tolower (m, c) < tolower (n, c); });
	}
};

struct entry {
	string filename, target_path;
	struct stat info = {}, target_info = {};

	enum { MODES, USER, GROUP, SIZE, MTIME, FILENAME, COLUMNS };
	ncstring cols[COLUMNS];
};

struct level {
	int offset, cursor;                 ///< Scroll offset and cursor position
	string path, filename;              ///< Level path and filename at cursor
};

static struct {
	string cwd;                         ///< Current working directory
	string start_dir;                   ///< Starting directory
	vector<entry> entries;              ///< Current directory entries
	vector<level> levels;               ///< Upper directory levels
	int offset, cursor;                 ///< Scroll offset and cursor position
	bool full_view;                     ///< Show extended information
	bool gravity;                       ///< Entries are shoved to the bottom
	bool reverse_sort;                  ///< Reverse sort
	bool show_hidden;                   ///< Show hidden files
	int max_widths[entry::COLUMNS];     ///< Column widths
	int sort_column = entry::FILENAME;  ///< Sorting column
	int sort_flash_ttl;                 ///< Sorting column flash TTL

	wstring message;                    ///< Message for the user
	int message_ttl;                    ///< Time to live for the message

	string chosen;                      ///< Chosen item for the command line
	bool no_chdir;                      ///< Do not tell the shell to chdir
	bool quitting;                      ///< Whether we should quit already

	int inotify_fd, inotify_wd = -1;    ///< File watch
	bool out_of_date;                   ///< Entries may be out of date

	const wchar_t *editor;              ///< Prompt string for editing
	wstring editor_line;                ///< Current user input
	void (*editor_on_change) ();        ///< Callback on editor change
	void (*editor_on_confirm) ();       ///< Callback on editor confirmation

	enum { AT_CURSOR, AT_BAR, AT_CWD, AT_INPUT, AT_COUNT };
	chtype attrs[AT_COUNT] = {A_REVERSE, 0, A_BOLD, 0};
	const char *attr_names[AT_COUNT] = {"cursor", "bar", "cwd", "input"};

	map<int, chtype> ls_colors;         ///< LS_COLORS decoded
	map<string, chtype> ls_exts;        ///< LS_COLORS file extensions
	bool ls_symlink_as_target;          ///< ln=target in dircolors

	map<string, wint_t, stringcaseless> name_to_key;
	map<wint_t, string> key_to_name;
	string action_names[ACTION_COUNT];  ///< Stylized action names

	// Refreshed by reload():

	map<uid_t, string> unames;          ///< User names by UID
	map<gid_t, string> gnames;          ///< Group names by GID
	struct tm now;                      ///< Current local time for display
} g;

// The coloring logic has been more or less exactly copied from GNU ls,
// simplified and rewritten to reflect local implementation specifics
fun ls_is_colored (int type) -> bool {
	auto i = g.ls_colors.find (type);
	return i != g.ls_colors.end () && i->second != 0;
}

fun ls_format (const entry &e, bool for_target) -> chtype {
	int type = LS_ORPHAN;
	auto set = [&](int t) { if (ls_is_colored (t)) type = t; };

	const auto &name = for_target
		? e.target_path : e.filename;
	const auto &info =
		(for_target || (g.ls_symlink_as_target && e.target_info.st_mode))
		? e.target_info : e.info;

	if (for_target && info.st_mode == 0) {
		// This differs from GNU ls: we use ORPHAN when MISSING is not set,
		// but GNU ls colors by dirent::d_type
		set (LS_MISSING);
	} else if (S_ISREG (info.st_mode)) {
		type = LS_FILE;
		if (info.st_nlink > 1)
			set (LS_MULTIHARDLINK);
		if ((info.st_mode & (S_IXUSR | S_IXGRP | S_IXOTH)))
			set (LS_EXECUTABLE);
		if (lgetxattr (name.c_str (), "security.capability", NULL, 0) >= 0)
			set (LS_CAPABILITY);
		if ((info.st_mode & S_ISGID))
			set (LS_SETGID);
		if ((info.st_mode & S_ISUID))
			set (LS_SETUID);
	} else if (S_ISDIR (info.st_mode)) {
		type = LS_DIRECTORY;
		if ((info.st_mode & S_ISVTX))
			set (LS_STICKY);
		if ((info.st_mode & S_IWOTH))
			set (LS_OTHER_WRITABLE);
		if ((info.st_mode & S_ISVTX) && (info.st_mode & S_IWOTH))
			set (LS_STICKY_OTHER_WRITABLE);
	} else if (S_ISLNK (info.st_mode)) {
		type = LS_SYMLINK;
		if (!e.target_info.st_mode
		 && (ls_is_colored (LS_ORPHAN) || g.ls_symlink_as_target))
			type = LS_ORPHAN;
	} else if (S_ISFIFO (info.st_mode)) {
		type = LS_FIFO;
	} else if (S_ISSOCK (info.st_mode)) {
		type = LS_SOCKET;
	} else if (S_ISBLK (info.st_mode)) {
		type = LS_BLOCK;
	} else if (S_ISCHR (info.st_mode)) {
		type = LS_CHARACTER;
	}

	chtype format = 0;
	const auto x = g.ls_colors.find (type);
	if (x != g.ls_colors.end ())
		format = x->second;

	auto dot = name.find_last_of ('.');
	if (dot != string::npos && type == LS_FILE) {
		const auto x = g.ls_exts.find (name.substr (++dot));
		if (x != g.ls_exts.end ())
			format = x->second;
	}
	return format;
}

fun make_entry (const struct dirent *f) -> entry {
	entry e;
	e.filename = f->d_name;
	e.info.st_mode = DTTOIF (f->d_type);
	auto &info = e.info;

	// TODO: benchmark just readdir() vs. lstat(), also on dead mounts;
	//   it might make sense to stat asynchronously in threads
	//   http://lkml.iu.edu/hypermail//linux/kernel/0804.3/1616.html
	if (lstat (f->d_name, &info)) {
		e.cols[entry::MODES] = apply_attrs ({ decode_type (info.st_mode),
			L'?', L'?', L'?', L'?', L'?', L'?', L'?', L'?', L'?' }, 0);

		e.cols[entry::USER] = e.cols[entry::GROUP] =
		e.cols[entry::SIZE] = e.cols[entry::MTIME] = apply_attrs (L"?", 0);

		e.cols[entry::FILENAME] =
			apply_attrs (to_wide (e.filename), ls_format (e, false));
		return e;
	}

	if (S_ISLNK (info.st_mode)) {
		char buf[PATH_MAX] = {};
		auto len = readlink (f->d_name, buf, sizeof buf);
		if (len < 0 || size_t (len) >= sizeof buf) {
			e.target_path = "?";
		} else {
			e.target_path = buf;
			// If a symlink links to another symlink, we follow all the way
			(void) stat (buf, &e.target_info);
		}
	}

	auto mode = decode_mode (info.st_mode);
	// This is a Linux-only extension
	if (acl_extended_file_nofollow (f->d_name) > 0)
		mode += L"+";
	e.cols[entry::MODES] = apply_attrs (mode, 0);

	auto usr = g.unames.find (info.st_uid);
	e.cols[entry::USER] = (usr != g.unames.end ())
		? apply_attrs (to_wide (usr->second), 0)
		: apply_attrs (to_wstring (info.st_uid), 0);

	auto grp = g.gnames.find (info.st_gid);
	e.cols[entry::GROUP] = (grp != g.gnames.end ())
		? apply_attrs (to_wide (grp->second), 0)
		: apply_attrs (to_wstring (info.st_gid), 0);

	auto size = to_wstring (info.st_size);
	if      (info.st_size >> 40) size = to_wstring (info.st_size >> 40) + L"T";
	else if (info.st_size >> 30) size = to_wstring (info.st_size >> 30) + L"G";
	else if (info.st_size >> 20) size = to_wstring (info.st_size >> 20) + L"M";
	else if (info.st_size >> 10) size = to_wstring (info.st_size >> 10) + L"K";
	e.cols[entry::SIZE] = apply_attrs (size, 0);

	char buf[32] = "";
	auto tm = localtime (&info.st_mtime);
	strftime (buf, sizeof buf,
		(tm->tm_year == g.now.tm_year) ? "%b %e %H:%M" : "%b %e  %Y", tm);
	e.cols[entry::MTIME] = apply_attrs (to_wide (buf), 0);

	auto &fn = e.cols[entry::FILENAME] =
		apply_attrs (to_wide (e.filename), ls_format (e, false));
	if (!e.target_path.empty ()) {
		fn.append (apply_attrs (to_wide (" -> "), 0));
		fn.append (apply_attrs (to_wide (e.target_path), ls_format (e, true)));
	}
	return e;
}

fun inline visible_lines () -> int { return max (0, LINES - 2); }

fun update () {
	int start_column = g.full_view ? 0 : entry::FILENAME;
	static int alignment[entry::COLUMNS] = { -1, -1, -1, 1, 1, -1 };
	erase ();

	int available = visible_lines ();
	int used = min (available, int (g.entries.size ()) - g.offset);
	for (int i = 0; i < used; i++) {
		auto index = g.offset + i;
		bool selected = index == g.cursor;
		attrset (selected ? g.attrs[g.AT_CURSOR] : 0);
		move (g.gravity ? (available - used + i) : i, 0);

		auto used = 0;
		for (int col = start_column; col < entry::COLUMNS; col++) {
			const auto &field = g.entries[index].cols[col];
			auto aligned = align (field, alignment[col] * g.max_widths[col]);
			if (g.sort_flash_ttl && col == g.sort_column)
				for_each (begin (aligned), end (aligned), invert);
			if (selected)
				for_each (begin (aligned), end (aligned), decolor);
			used += print (aligned + apply_attrs (L" ", 0), COLS - used);
		}
		hline (' ', COLS - used);
	}

	auto bar = apply_attrs (to_wide (g.cwd), g.attrs[g.AT_CWD]);
	if (!g.show_hidden)
		bar += apply_attrs (L" (hidden)", 0);
	if (g.out_of_date)
		bar += apply_attrs (L" [+]", 0);

	move (LINES - 2, 0);
	attrset (g.attrs[g.AT_BAR]);
	hline (' ', COLS - print (bar, COLS));

	attrset (g.attrs[g.AT_INPUT]);
	curs_set (0);
	if (g.editor) {
		move (LINES - 1, 0);
		auto p = apply_attrs (wstring (g.editor) + L": ", 0);
		move (LINES - 1, print (p + apply_attrs (g.editor_line, 0), COLS - 1));
		curs_set (1);
	} else if (!g.message.empty ()) {
		move (LINES - 1, 0);
		print (apply_attrs (g.message, 0), COLS);
	}

	refresh ();
}

fun operator< (const entry &e1, const entry &e2) -> bool {
	auto t1 = make_tuple (e1.filename != "..",
		!S_ISDIR (e1.info.st_mode) && !S_ISDIR (e1.target_info.st_mode));
	auto t2 = make_tuple (e2.filename != "..",
		!S_ISDIR (e2.info.st_mode) && !S_ISDIR (e2.target_info.st_mode));
	if (t1 != t2)
		return t1 < t2;

	const auto &a = g.reverse_sort ? e2 : e1;
	const auto &b = g.reverse_sort ? e1 : e2;
	switch (g.sort_column) {
	case entry::MODES:
		if (a.info.st_mode != b.info.st_mode)
			return a.info.st_mode < b.info.st_mode;
		break;
	case entry::USER:
		if (a.info.st_uid != b.info.st_uid)
			return a.info.st_uid < b.info.st_uid;
		break;
	case entry::GROUP:
		if (a.info.st_gid != b.info.st_gid)
			return a.info.st_gid < b.info.st_gid;
		break;
	case entry::SIZE:
		if (a.info.st_size != b.info.st_size)
			return a.info.st_size < b.info.st_size;
		break;
	case entry::MTIME:
		if (a.info.st_mtime != b.info.st_mtime)
			return a.info.st_mtime < b.info.st_mtime;
		break;
	}
	return a.filename < b.filename;
}

fun reload (const string &old_cwd) {
	g.unames.clear();
	while (auto *ent = getpwent ())
		g.unames.emplace (ent->pw_uid, ent->pw_name);
	endpwent();

	g.gnames.clear();
	while (auto *ent = getgrent ())
		g.gnames.emplace (ent->gr_gid, ent->gr_name);
	endgrent();

	string anchor;
	if (!g.entries.empty ())
		anchor = g.entries[g.cursor].filename;

	auto now = time (NULL); g.now = *localtime (&now);
	auto dir = opendir (".");
	g.entries.clear ();
	while (auto f = readdir (dir)) {
		string name = f->d_name;
		// Two dots are for navigation but this ain't as useful
		if (name == ".")
			continue;
		if (name == ".." ? g.cwd != "/" : (name[0] != '.' || g.show_hidden))
			g.entries.push_back (make_entry (f));
	}
	closedir (dir);
	sort (begin (g.entries), end (g.entries));
	g.out_of_date = false;

	if (g.cwd == old_cwd && !anchor.empty ()) {
		for (size_t i = 0; i < g.entries.size (); i++)
			if (g.entries[i].filename == anchor)
				g.cursor = i;
	}
	for (int col = 0; col < entry::COLUMNS; col++) {
		auto &longest = g.max_widths[col] = 0;
		for (const auto &entry : g.entries)
			longest = max (longest, compute_width (entry.cols[col]));
	}

	g.cursor = min (g.cursor, int (g.entries.size ()) - 1);
	g.offset = min (g.offset, int (g.entries.size ()) - 1);

	if (g.inotify_wd != -1)
		inotify_rm_watch (g.inotify_fd, g.inotify_wd);

	// We don't show atime, so access and open are merely spam
	char buf[PATH_MAX];
	g.inotify_wd = inotify_add_watch (g.inotify_fd, buf,
		(IN_ALL_EVENTS | IN_ONLYDIR | IN_EXCL_UNLINK) & ~(IN_ACCESS | IN_OPEN));
}

fun show_message (const string &message, int ttl = 30) {
	g.message = to_wide (message);
	g.message_ttl = ttl;
}

fun run_program (initializer_list<const char*> list, const string &filename) {
	endwin ();

	switch (pid_t child = fork ()) {
		int status;
	case -1:
		break;
	case 0:
		// Put the child in a new foreground process group...
		setpgid (0, 0);
		tcsetpgrp (STDOUT_FILENO, getpgid (0));

		for (auto pager : list)
			if (pager) execl ("/bin/sh", "/bin/sh", "-c", (string (pager)
				+ " " + shell_escape (filename)).c_str (), NULL);
		_exit (EXIT_FAILURE);
	default:
		// ...and make sure of it in the parent as well
		(void) setpgid (child, child);
		waitpid (child, &status, 0);
		tcsetpgrp (STDOUT_FILENO, getpgid (0));
	}

	refresh ();
	update ();
}

fun view (const string &filename) {
	run_program ({(const char *) getenv ("PAGER"), "pager", "cat"}, filename);
}

fun edit (const string &filename) {
	run_program ({(const char *) getenv ("VISUAL"),
		(const char *) getenv ("EDITOR"), "vi"}, filename);
}

fun run_pager (FILE *contents) {
	// We don't really need to set O_CLOEXEC, so we're not going to
	rewind (contents);
	endwin ();

	switch (pid_t child = fork ()) {
		int status;
	case -1:
		break;
	case 0:
		// Put the child in a new foreground process group...
		setpgid (0, 0);
		tcsetpgrp (STDOUT_FILENO, getpgid (0));
		dup2 (fileno (contents), STDIN_FILENO);

		// Behaviour copies man-db's man(1), similar to POSIX man(1)
		for (auto pager : {(const char *) getenv ("PAGER"), "pager", "cat"})
			if (pager) execl ("/bin/sh", "/bin/sh", "-c", pager, NULL);
		_exit (EXIT_FAILURE);
	default:
		// ...and make sure of it in the parent as well
		(void) setpgid (child, child);
		waitpid (child, &status, 0);
		tcsetpgrp (STDOUT_FILENO, getpgid (0));
	}

	refresh ();
	update ();
}

fun encode_key (wint_t key) -> string {
	string encoded;
	if (key & ALT)
		encoded.append ("M-");
	wchar_t bare = key & ~ALT;
	if (g.key_to_name.count (bare))
		encoded.append (capitalize (g.key_to_name.at (bare)));
	else if (bare < 32)
		encoded.append ("C-").append ({char (tolower (bare + 64))});
	else
		encoded.append (to_mb ({bare}));
	return encoded;
}

fun show_help () {
	FILE *contents = tmpfile ();
	if (!contents)
		return;

	for (const auto &kv : g_binding_contexts) {
		fprintf (contents, "%s\n",
			underline (capitalize (kv.first + " key bindings")).c_str ());
		for (const auto &kv : *kv.second) {
			auto key = encode_key (kv.first);
			key.append (max (0, 10 - compute_width (to_wide (key))), ' ');
			fprintf (contents, "%s %s\n",
				key.c_str (), g.action_names[kv.second].c_str ());
		}
		fprintf (contents, "\n");
	}
	run_pager (contents);
	fclose (contents);
}

fun search (const wstring &needle) {
	int best = g.cursor, best_n = 0;
	for (int i = 0; i < int (g.entries.size ()); i++) {
		auto o = (i + g.cursor) % g.entries.size ();
		int n = prefix_length (to_wide (g.entries[o].filename), needle);
		if (n > best_n) {
			best = o;
			best_n = n;
		}
	}
	g.cursor = best;
}

fun fix_cursor_and_offset () {
	g.cursor = max (g.cursor, 0);
	g.cursor = min (g.cursor, int (g.entries.size ()) - 1);

	// Decrease the offset when more items can suddenly fit
	int pushable = visible_lines () - (int (g.entries.size ()) - g.offset);
	g.offset -= max (pushable, 0);

	// Make sure cursor is visible
	g.offset = max (g.offset, 0);
	g.offset = min (g.offset, int (g.entries.size ()) - 1);

	if (g.offset > g.cursor)
		g.offset = g.cursor;
	if (g.cursor - g.offset >= visible_lines ())
		g.offset = g.cursor - visible_lines () + 1;
}

fun is_ancestor_dir (const string &ancestor, const string &of) -> bool {
	if (strncmp (ancestor.c_str (), of.c_str (), ancestor.length ()))
		return false;
	return of[ancestor.length ()] == '/' || (ancestor == "/" && ancestor != of);
}

fun pop_levels () {
	string anchor; auto i = g.levels.rbegin ();
	while (i != g.levels.rend () && !is_ancestor_dir (i->path, g.cwd)) {
		if (i->path == g.cwd) {
			g.offset = i->offset;
			g.cursor = i->cursor;
			anchor = i->filename;
		}
		i++;
		g.levels.pop_back ();
	}
	fix_cursor_and_offset ();
	if (!anchor.empty () && g.entries[g.cursor].filename != anchor)
		search (to_wide (anchor));
}

fun explode_path (const string &path, vector<string> &out) {
	size_t mark = 0, p = path.find ("/");
	for (; p != string::npos; p = path.find ("/", (mark = p + 1)))
		out.push_back (path.substr (mark, p - mark));
	if (mark < path.length ())
		out.push_back (path.substr (mark));
}

fun serialize_path (const vector<string> &components) -> string {
	string result;
	for (const auto &i : components)
		result.append (i).append ("/");

	auto n = result.find_last_not_of ('/');
	if (n != result.npos)
		return result.erase (n + 1);
	return result;
}

fun absolutize (const string &abs_base, const string &path) -> string {
	if (path[0] == '/')
		return path;
	if (!abs_base.empty () && abs_base.back () == '/')
		return abs_base + path;
	return abs_base + "/" + path;
}

fun relativize (string current, const string &path) -> string {
	if (current == path)
		return ".";
	if (current.back () != '/')
		current += '/';
	if (!strncmp (current.c_str (), path.c_str (), current.length ()))
		return path.substr (current.length ());
	return path;
}

// Roughly follows the POSIX description of `cd -L` because of symlinks.
// HOME and CDPATH handling is ommitted.
fun change_dir (const string &path) {
	if (g.cwd[0] != '/') {
		show_message ("cannot figure out absolute path");
		beep ();
		return;
	}

	vector<string> in, out;
	explode_path (absolutize (g.cwd, path), in);

	// Paths with exactly two leading slashes may get special treatment
	size_t startempty = 1;
	if (in.size () >= 2 && in[1] == "" && (in.size () < 3 || in[2] != ""))
		startempty = 2;

	struct stat s{};
	for (size_t i = 0; i < in.size (); i++)
		if (in[i] == "..") {
			auto parent = relativize (g.cwd, serialize_path (out));
			if (errno = 0, !stat (parent.c_str (), &s) && !S_ISDIR (s.st_mode))
				errno = ENOTDIR;
			if (errno) {
				show_message (parent + ": " + strerror (errno));
				beep ();
				return;
			}
			if (!out.back().empty ())
				out.pop_back ();
		} else if (in[i] != "." && (!in[i].empty () || i < startempty)) {
			out.push_back (in[i]);
		}

	auto full_path = serialize_path (out);
	if (chdir (relativize (g.cwd, full_path).c_str ())) {
		show_message (strerror (errno));
		beep ();
		return;
	}

	auto old_cwd = g.cwd;
	level last {g.offset, g.cursor, old_cwd, g.entries[g.cursor].filename};
	g.cwd = full_path;
	reload (old_cwd);

	if (is_ancestor_dir (last.path, g.cwd)) {
		g.levels.push_back (last);
		g.offset = g.cursor = 0;
	} else {
		pop_levels ();
	}
}

// Roughly follows the POSIX description of the PWD environment variable
fun initial_cwd () -> string {
	char cwd[4096] = ""; getcwd (cwd, sizeof cwd);
	const char *pwd = getenv ("PWD");
	if (!pwd || pwd[0] != '/' || strlen (pwd) >= PATH_MAX)
		return cwd;

	// Extra slashes shouldn't break anything for us
	vector<string> components;
	explode_path (pwd, components);
	for (const auto &i : components) {
		if (i == "." || i == "..")
			return cwd;
	}

	// Check if it "is an absolute pathname of the current working directory."
	// This particular method won't match on bind mounts, which is desired.
	char *real = realpath (pwd, nullptr);
	bool ok = real && !strcmp (cwd, real);
	free (real);
	return ok ? pwd : cwd;
}

fun choose (const entry &entry) {
	// Dive into directories and accessible symlinks to them
	if (!S_ISDIR (entry.info.st_mode)
	 && !S_ISDIR (entry.target_info.st_mode)) {
		g.chosen = entry.filename;
		g.quitting = true;
	} else {
		change_dir (entry.filename);
	}
}

fun handle_editor (wint_t c) {
	auto i = g_input_actions.find (c);
	switch (i == g_input_actions.end () ? ACTION_NONE : i->second) {
	case ACTION_INPUT_CONFIRM:
		if (g.editor_on_confirm)
			g.editor_on_confirm ();
		// Fall-through
	case ACTION_INPUT_ABORT:
		g.editor_line.clear ();
		g.editor = 0;
		g.editor_on_change = nullptr;
		g.editor_on_confirm = nullptr;
		break;
	case ACTION_INPUT_B_DELETE:
		if (!g.editor_line.empty ())
			g.editor_line.erase (g.editor_line.length () - 1);
		break;
	default:
		if (c & (ALT | SYM)) {
			beep ();
		} else {
			g.editor_line += c;
			if (g.editor_on_change)
				g.editor_on_change ();
		}
	}
}

fun handle (wint_t c) -> bool {
	// If an editor is active, let it handle the key instead and eat it
	if (g.editor) {
		handle_editor (c);
		c = WEOF;
	}

	const auto &current = g.entries[g.cursor];
	auto i = g_normal_actions.find (c);
	switch (i == g_normal_actions.end () ? ACTION_NONE : i->second) {
	case ACTION_CHOOSE_FULL:
		g.chosen = g.cwd + "/" + current.filename;
		g.no_chdir = true;
		g.quitting = true;
		break;
	case ACTION_CHOOSE:
		choose (current);
		break;
	case ACTION_VIEW:
		view (current.filename);
		break;
	case ACTION_EDIT:
		edit (current.filename);
		break;
	case ACTION_HELP:
		show_help ();
		break;
	case ACTION_QUIT_NO_CHDIR:
		g.no_chdir = true;
		// Fall-through
	case ACTION_QUIT:
		g.quitting = true;
		break;

	case ACTION_SORT_LEFT:
		g.sort_column = (g.sort_column + entry::COLUMNS - 1) % entry::COLUMNS;
		g.sort_flash_ttl = 2;
		reload (g.cwd);
		break;
	case ACTION_SORT_RIGHT:
		g.sort_column = (g.sort_column + entry::COLUMNS + 1) % entry::COLUMNS;
		g.sort_flash_ttl = 2;
		reload (g.cwd);
		break;

	case ACTION_UP:
		g.cursor--;
		break;
	case ACTION_DOWN:
		g.cursor++;
		break;
	case ACTION_TOP:
		g.cursor = 0;
		break;
	case ACTION_BOTTOM:
		g.cursor = int (g.entries.size ()) - 1;
		break;

	case ACTION_PAGE_PREVIOUS:
		g.cursor -= LINES;
		break;
	case ACTION_PAGE_NEXT:
		g.cursor += LINES;
		break;
	case ACTION_SCROLL_DOWN:
		g.offset++;
		break;
	case ACTION_SCROLL_UP:
		g.offset--;
		break;

	case ACTION_CHDIR:
		g.editor = L"chdir";
		g.editor_on_confirm = [] {
			change_dir (to_mb (g.editor_line));
		};
		break;
	case ACTION_GO_START:
		change_dir (g.start_dir);
		break;
	case ACTION_GO_HOME:
		if (const auto *home = getenv ("HOME"))
			change_dir (home);
		else if (const auto *pw = getpwuid (getuid ()))
			change_dir (pw->pw_dir);
		break;

	case ACTION_SEARCH:
		g.editor = L"search";
		g.editor_on_change = [] {
			search (g.editor_line);
		};
		g.editor_on_confirm = [] {
			choose (g.entries[g.cursor]);
		};
		break;
	case ACTION_RENAME_PREFILL:
		g.editor_line = to_wide (current.filename);
		// Fall-through
	case ACTION_RENAME:
		g.editor = L"rename";
		g.editor_on_confirm = [] {
			auto mb = to_mb (g.editor_line);
			rename (g.entries[g.cursor].filename.c_str (), mb.c_str ());
			reload (g.cwd);
		};
		break;

	case ACTION_TOGGLE_FULL:
		g.full_view = !g.full_view;
		break;
	case ACTION_REVERSE_SORT:
		g.reverse_sort = !g.reverse_sort;
		reload (g.cwd);
		break;
	case ACTION_SHOW_HIDDEN:
		g.show_hidden = !g.show_hidden;
		reload (g.cwd);
		break;
	case ACTION_REDRAW:
		clear ();
		break;
	case ACTION_RELOAD:
		reload (g.cwd);
		break;
	default:
		if (c != KEY (RESIZE) && c != WEOF)
			beep ();
	}
	fix_cursor_and_offset ();
	update ();
	return !g.quitting;
}

fun inotify_check () {
	// Only provide simple indication that contents might have changed
	char buf[4096]; ssize_t len;
	bool changed = false;
	while ((len = read (g.inotify_fd, buf, sizeof buf)) > 0) {
		const inotify_event *e;
		for (char *ptr = buf; ptr < buf + len; ptr += sizeof *e + e->len) {
			e = (const inotify_event *) buf;
			if (e->wd == g.inotify_wd)
				changed = g.out_of_date = true;
		}
	}
	if (changed)
		update ();
}

fun decode_ansi_sgr (const vector<string> &v) -> chtype {
	vector<int> args;
	for (const auto &arg : v) {
		char *end; unsigned long ul = strtoul (arg.c_str (), &end, 10);
		if (*end != '\0' || ul > 255)
			return 0;
		args.push_back (ul);
	}
	chtype result = 0; int fg = -1, bg = -1;
	for (size_t i = 0; i < args.size (); i++) {
		auto arg = args[i];
		if (arg == 0) {
			result = 0; fg = -1; bg = -1;
		} else if (arg == 1) {
			result |= A_BOLD;
		} else if (arg == 4) {
			result |= A_UNDERLINE;
		} else if (arg == 5) {
			result |= A_BLINK;
		} else if (arg == 7) {
			result |= A_REVERSE;
		} else if (arg >= 30 && arg <= 37) {
			fg = arg - 30;
		} else if (arg >= 40 && arg <= 47) {
			bg = arg - 40;
		// Anything other than indexed colours will be rejected completely
		} else if (arg == 38 && (i += 2) < args.size ()) {
			if (args[i - 1] != 5 || (fg = args[i]) >= COLORS)
				return 0;
		} else if (arg == 48 && (i += 2) < args.size ()) {
			if (args[i - 1] != 5 || (bg = args[i]) >= COLORS)
				return 0;
		}
	}
	if (fg != -1 || bg != -1)
		result |= COLOR_PAIR (allocate_pair (fg, bg));
	return result;
}

fun load_ls_colors (vector<string> colors) {
	map<string, chtype> attrs;
	for (const auto &pair : colors) {
		auto equal = pair.find ('=');
		if (equal == string::npos)
			continue;
		auto key = pair.substr (0, equal), value = pair.substr (equal + 1);
		if (key != g_ls_colors[LS_SYMLINK]
		 || !(g.ls_symlink_as_target = value == "target"))
			attrs[key] = decode_ansi_sgr (split (value, ";"));
	}
	for (int i = 0; i < LS_COUNT; i++) {
		auto m = attrs.find (g_ls_colors[i]);
		if (m != attrs.end ())
			g.ls_colors[i] = m->second;
	}
	for (const auto &pair : attrs) {
		if (pair.first.substr (0, 2) == "*.")
			g.ls_exts[pair.first.substr (2)] = pair.second;
	}
}

fun load_colors () {
	// Bail out on dumb terminals, there's not much one can do about them
	if (!has_colors () || start_color () == ERR || use_default_colors () == ERR)
		return;
	if (const char *colors = getenv ("LS_COLORS"))
		load_ls_colors (split (colors, ":"));

	auto config = xdg_config_find ("look");
	if (!config)
		return;

	vector<string> tokens;
	while (parse_line (*config, tokens)) {
		if (tokens.empty ())
			continue;
		auto name = shift (tokens);
		for (int i = 0; i < g.AT_COUNT; i++)
			if (name == g.attr_names[i])
				g.attrs[i] = decode_attrs (tokens);
	}
}

fun read_key (wint_t &c) -> bool {
	int res = get_wch (&c);
	if (res == ERR)
		return false;

	wint_t metafied{};
	if (c == 27 && (res = get_wch (&metafied)) != ERR)
		c = ALT | metafied;
	if (res == KEY_CODE_YES)
		c |= SYM;
	return true;
}

fun parse_key (const string &key_name) -> wint_t {
	wint_t c{};
	auto p = key_name.c_str ();
	if (!strncmp (p, "M-", 2)) {
		c |= ALT;
		p += 2;
	}
	if (!strncmp (p, "C-", 2)) {
		p += 2;
		if (*p < 32) {
			cerr << "bindings: invalid combination: " << key_name << endl;
			return WEOF;
		}
		c |= CTRL *p;
		p += 1;
	} else if (g.name_to_key.count (p)) {
		return c | g.name_to_key.at (p);
	} else {
		wchar_t w; mbstate_t mb {};
		auto len = strlen (p) + 1, res = mbrtowc (&w, p, len, &mb);
		if (res == 0) {
			cerr << "bindings: missing key name: " << key_name << endl;
			return WEOF;
		}
		if (res == size_t (-1) || res == size_t (-2)) {
			cerr << "bindings: invalid encoding: " << key_name << endl;
			return WEOF;
		}
		c |= w;
		p += res;
	}
	if (*p) {
		cerr << "key name has unparsable trailing part: " << key_name << endl;
		return WEOF;
	}
	return c;
}

fun learn_named_key (const string &name, wint_t key) {
	g.name_to_key[g.key_to_name[key] = name] = key;
}

fun load_bindings () {
	learn_named_key ("space", ' ');
	learn_named_key ("escape", 0x1b);
	for (int kc = KEY_MIN; kc < KEY_MAX; kc++) {
		const char *name = keyname (kc);
		if (!name)
			continue;
		if (!strncmp (name, "KEY_", 4))
			name += 4;
		string filtered;
		for (; *name; name++) {
			if (*name != '(' && *name != ')')
				filtered += *name;
		}
		learn_named_key (filtered, SYM | kc);
	}

	auto config = xdg_config_find ("bindings");
	if (!config)
		return;

	// Stringization in the preprocessor is a bit limited, we want lisp-case
	map<string, action> actions;
	int a = 0;
	for (auto p : g_action_names) {
		string name;
		for (; *p; p++)
			name += *p == '_' ? '-' : *p + 'a' - 'A';
		g.action_names[a] = name;
		actions[name] = action (a++);
	}

	vector<string> tokens;
	while (parse_line (*config, tokens)) {
		if (tokens.empty ())
			continue;
		if (tokens.size () < 3) {
			cerr << "bindings: expected: context binding action";
			continue;
		}

		auto context = tokens[0], key_name = tokens[1], action = tokens[2];
		auto m = g_binding_contexts.find (context);
		if (m == g_binding_contexts.end ()) {
			cerr << "bindings: invalid context: " << context << endl;
			continue;
		}
		wint_t c = parse_key (key_name);
		if (c == WEOF)
			continue;
		auto i = actions.find (action);
		if (i == actions.end ()) {
			cerr << "bindings: invalid action: " << action << endl;
			continue;
		}
		(*m->second)[c] = i->second;
	}
}

fun load_history_level (const vector<string> &v) {
	if (v.size () != 7)
		return;
	// Not checking the hostname and parent PID right now since we can't merge
	g.levels.push_back ({stoi (v.at (4)), stoi (v.at (5)), v.at (3), v.at (6)});
}

fun load_config () {
	auto config = xdg_config_find ("config");
	if (!config)
		return;

	vector<string> tokens;
	while (parse_line (*config, tokens)) {
		if (tokens.empty ())
			continue;

		if      (tokens.front () == "full-view"    && tokens.size () > 1)
			g.full_view    = tokens.at (1) == "1";
		else if (tokens.front () == "gravity"      && tokens.size () > 1)
			g.gravity      = tokens.at (1) == "1";
		else if (tokens.front () == "reverse-sort" && tokens.size () > 1)
			g.reverse_sort = tokens.at (1) == "1";
		else if (tokens.front () == "show-hidden"  && tokens.size () > 1)
			g.show_hidden  = tokens.at (1) == "1";
		else if (tokens.front () == "sort-column"  && tokens.size () > 1)
			g.sort_column  = stoi (tokens.at (1));
		else if (tokens.front () == "history")
			load_history_level (tokens);
	}
}

fun save_config () {
	auto config = xdg_config_write ("config");
	if (!config)
		return;

	write_line (*config, {"full-view",    g.full_view    ? "1" : "0"});
	write_line (*config, {"gravity",      g.gravity      ? "1" : "0"});
	write_line (*config, {"reverse-sort", g.reverse_sort ? "1" : "0"});
	write_line (*config, {"show-hidden",  g.show_hidden  ? "1" : "0"});

	write_line (*config, {"sort-column",  to_string (g.sort_column)});

	char hostname[256];
	if (gethostname (hostname, sizeof hostname))
		*hostname = 0;

	auto ppid = std::to_string (getppid ());
	for (auto i = g.levels.begin (); i != g.levels.end (); i++)
		write_line (*config, {"history", hostname, ppid, i->path,
			to_string (i->offset), to_string (i->cursor), i->filename});
	write_line (*config, {"history", hostname, ppid, g.cwd,
		to_string (g.offset), to_string (g.cursor),
		g.entries[g.cursor].filename});
}

int main (int argc, char *argv[]) {
	(void) argc;
	(void) argv;

	// That bitch zle closes stdin before exec without redirection
	(void) close (STDIN_FILENO);
	if (open ("/dev/tty", O_RDWR)) {
		cerr << "cannot open tty" << endl;
		return 1;
	}

	// Save the original stdout and force ncurses to use the terminal directly
	auto output_fd = dup (STDOUT_FILENO);
	dup2 (STDIN_FILENO, STDOUT_FILENO);

	// So that the neither us nor our children stop on tcsetpgrp()
	signal (SIGTTOU, SIG_IGN);

	if ((g.inotify_fd = inotify_init1 (IN_NONBLOCK)) < 0) {
		cerr << "cannot initialize inotify" << endl;
		return 1;
	}

	locale::global (locale (""));
	load_bindings ();
	load_config ();

	if (!initscr () || cbreak () == ERR || noecho () == ERR || nonl () == ERR) {
		cerr << "cannot initialize screen" << endl;
		return 1;
	}

	load_colors ();
	g.start_dir = g.cwd = initial_cwd ();
	reload (g.cwd);
	pop_levels ();
	update ();

	// Invoking keypad() earlier would make ncurses flush its output buffer,
	// which would worsen start-up flickering
	if (halfdelay (1) == ERR || keypad (stdscr, TRUE) == ERR) {
		endwin ();
		cerr << "cannot configure input" << endl;
		return 1;
	}

	wint_t c;
	while (!read_key (c) || handle (c)) {
		inotify_check ();
		if (g.sort_flash_ttl && !--g.sort_flash_ttl)
			update ();
		if (g.message_ttl && !--g.message_ttl) {
			g.message.clear ();
			update ();
		}
	}
	endwin ();
	save_config ();

	// Presumably it is going to end up as an argument, so quote it
	if (!g.chosen.empty ())
		g.chosen = shell_escape (g.chosen);

	// We can't portably create a standard stream from an FD, so modify the FD
	dup2 (output_fd, STDOUT_FILENO);

	if (g.cwd != g.start_dir && !g.no_chdir)
		cout << "local cd=" << shell_escape (g.cwd) << endl;
	else
		cout << "local cd=" << endl;

	cout << "local insert=" << shell_escape (g.chosen) << endl;
	return 0;
}
