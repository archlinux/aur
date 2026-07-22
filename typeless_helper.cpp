#include <X11/Xatom.h>
#include <X11/XKBlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/extensions/record.h>
#include <X11/keysym.h>
#include <atspi/atspi.h>

#include <fcntl.h>
#include <linux/input.h>
#include <poll.h>
#include <spawn.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>

#include <algorithm>
#include <atomic>
#include <chrono>
#include <cstdlib>
#include <cstring>
#include <deque>
#include <filesystem>
#include <fstream>
#include <map>
#include <mutex>
#include <sstream>
#include <string>
#include <thread>
#include <vector>

extern char **environ;

#define EXPORT extern "C" __attribute__((visibility("default")))

namespace {

using KeyboardCallback = bool (*)(int32_t, int32_t, int32_t, char *);
using StringCallback = void (*)(const char *);

std::atomic<bool> keyboard_running{false};
// Keep the thread object off the DSO static-destructor list. Electron can unload
// this helper while the child process is shutting down; a still-joinable static
// std::thread would call std::terminate before our DSO destructor gets a chance
// to stop it.
std::thread *keyboard_thread = nullptr;
std::mutex keyboard_lifecycle_mutex;
std::mutex keyboard_mutex;
KeyboardCallback keyboard_callback = nullptr;
std::map<int, std::string> pressing_keys;
struct PendingKeyboardEvent {
  int code;
  bool down;
  std::string pressing_keys_json;
};
std::deque<PendingKeyboardEvent> pending_keyboard_events;
double watcher_interval_ms = 5.0;
std::atomic<Display *> record_control_display{nullptr};
std::atomic<XRecordContext> record_context{0};
std::string shared_result;
std::once_flag atspi_init_once;
bool atspi_available = false;
std::mutex atspi_mutex;

std::string json_escape(const std::string &input) {
  std::ostringstream out;
  for (unsigned char c : input) {
    switch (c) {
      case '"': out << "\\\""; break;
      case '\\': out << "\\\\"; break;
      case '\b': out << "\\b"; break;
      case '\f': out << "\\f"; break;
      case '\n': out << "\\n"; break;
      case '\r': out << "\\r"; break;
      case '\t': out << "\\t"; break;
      default:
        if (c < 0x20) {
          static const char hex[] = "0123456789abcdef";
          out << "\\u00" << hex[c >> 4] << hex[c & 15];
        } else {
          out << static_cast<char>(c);
        }
    }
  }
  return out.str();
}

bool command_exists(const char *name) {
  const char *path = std::getenv("PATH");
  if (!path) return false;
  std::stringstream paths(path);
  std::string dir;
  while (std::getline(paths, dir, ':')) {
    std::filesystem::path candidate = std::filesystem::path(dir) / name;
    if (::access(candidate.c_str(), X_OK) == 0) return true;
  }
  return false;
}

int run_command(const std::vector<std::string> &args) {
  if (args.empty()) return -1;
  std::vector<char *> argv;
  argv.reserve(args.size() + 1);
  for (const auto &arg : args) argv.push_back(const_cast<char *>(arg.c_str()));
  argv.push_back(nullptr);
  pid_t pid = -1;
  if (posix_spawnp(&pid, argv[0], nullptr, nullptr, argv.data(), environ) != 0) return -1;
  int status = 0;
  while (waitpid(pid, &status, 0) < 0 && errno == EINTR) {}
  return WIFEXITED(status) ? WEXITSTATUS(status) : -1;
}

std::string run_capture(const std::vector<std::string> &args) {
  if (args.empty()) return {};
  int pipefd[2];
  if (pipe(pipefd) != 0) return {};
  std::vector<char *> argv;
  for (const auto &arg : args) argv.push_back(const_cast<char *>(arg.c_str()));
  argv.push_back(nullptr);
  posix_spawn_file_actions_t actions;
  posix_spawn_file_actions_init(&actions);
  posix_spawn_file_actions_adddup2(&actions, pipefd[1], STDOUT_FILENO);
  posix_spawn_file_actions_addclose(&actions, pipefd[0]);
  posix_spawn_file_actions_addclose(&actions, pipefd[1]);
  pid_t pid = -1;
  int rc = posix_spawnp(&pid, argv[0], &actions, nullptr, argv.data(), environ);
  posix_spawn_file_actions_destroy(&actions);
  close(pipefd[1]);
  if (rc != 0) { close(pipefd[0]); return {}; }
  std::string output;
  char buffer[4096];
  ssize_t count;
  while ((count = read(pipefd[0], buffer, sizeof(buffer))) > 0) output.append(buffer, count);
  close(pipefd[0]);
  int status = 0;
  while (waitpid(pid, &status, 0) < 0 && errno == EINTR) {}
  return output;
}

bool is_wayland() {
  const char *value = std::getenv("WAYLAND_DISPLAY");
  return value && *value;
}

bool ydotool_ready() {
  if (!command_exists("ydotool")) return false;
  const char *configured = std::getenv("YDOTOOL_SOCKET");
  std::filesystem::path socket_path;
  if (configured && *configured) {
    socket_path = configured;
  } else if (const char *runtime = std::getenv("XDG_RUNTIME_DIR"); runtime && *runtime) {
    socket_path = std::filesystem::path(runtime) / ".ydotool_socket";
  } else {
    socket_path = "/run/user/" + std::to_string(getuid()) + "/.ydotool_socket";
  }
  struct stat info{};
  return ::stat(socket_path.c_str(), &info) == 0 && S_ISSOCK(info.st_mode);
}

std::string evdev_key_name(unsigned code) {
  if (code >= KEY_A && code <= KEY_Z) return std::string(1, static_cast<char>('A' + code - KEY_A));
  if (code >= KEY_1 && code <= KEY_9) return std::string(1, static_cast<char>('1' + code - KEY_1));
  if (code == KEY_0) return "0";
  if (code >= KEY_F1 && code <= KEY_F10) return "F" + std::to_string(code - KEY_F1 + 1);
  if (code == KEY_F11) return "F11";
  if (code == KEY_F12) return "F12";
  switch (code) {
    case KEY_LEFTSHIFT: return "LeftShift";
    case KEY_RIGHTSHIFT: return "RightShift";
    case KEY_LEFTCTRL: return "LeftCtrl";
    case KEY_RIGHTCTRL: return "RightCtrl";
    case KEY_LEFTALT: return "LeftAlt";
    case KEY_RIGHTALT: return "RightAlt";
    case KEY_LEFTMETA: return "LeftCmd";
    case KEY_RIGHTMETA: return "RightCmd";
    case KEY_SPACE: return "Space";
    case KEY_ENTER: return "Enter";
    case KEY_TAB: return "Tab";
    case KEY_ESC: return "Escape";
    case KEY_BACKSPACE: return "Backspace";
    case KEY_DELETE: return "Delete";
    case KEY_UP: return "Up";
    case KEY_DOWN: return "Down";
    case KEY_LEFT: return "Left";
    case KEY_RIGHT: return "Right";
    case KEY_HOME: return "Home";
    case KEY_END: return "End";
    case KEY_PAGEUP: return "PageUp";
    case KEY_PAGEDOWN: return "PageDown";
    case KEY_CAPSLOCK: return "CapsLock";
    case KEY_MINUS: return "-";
    case KEY_EQUAL: return "=";
    case KEY_LEFTBRACE: return "[";
    case KEY_RIGHTBRACE: return "]";
    case KEY_SEMICOLON: return ";";
    case KEY_APOSTROPHE: return "'";
    case KEY_GRAVE: return "`";
    case KEY_BACKSLASH: return "\\";
    case KEY_COMMA: return ",";
    case KEY_DOT: return ".";
    case KEY_SLASH: return "/";
    case KEY_VOLUMEUP: return "VolumeUp";
    case KEY_VOLUMEDOWN: return "VolumeDown";
    case KEY_MUTE: return "Mute";
    default: return "Key" + std::to_string(code);
  }
}

std::string keysym_name(KeySym symbol, unsigned keycode) {
  switch (symbol) {
    case XK_Shift_L: return "LeftShift";
    case XK_Shift_R: return "RightShift";
    case XK_Control_L: return "LeftCtrl";
    case XK_Control_R: return "RightCtrl";
    case XK_Alt_L: return "LeftAlt";
    case XK_Alt_R: case XK_ISO_Level3_Shift: return "RightAlt";
    case XK_Super_L: case XK_Meta_L: return "LeftCmd";
    case XK_Super_R: case XK_Meta_R: return "RightCmd";
    case XK_space: return "Space";
    case XK_Return: return "Enter";
    case XK_Tab: return "Tab";
    case XK_Escape: return "Escape";
    case XK_BackSpace: return "Backspace";
    case XK_Delete: return "Delete";
    case XK_Left: return "Left";
    case XK_Right: return "Right";
    case XK_Up: return "Up";
    case XK_Down: return "Down";
    default: break;
  }
  const char *name = XKeysymToString(symbol);
  if (name && std::strlen(name) == 1) {
    char c = name[0];
    if (c >= 'a' && c <= 'z') c -= 32;
    return std::string(1, c);
  }
  if (name && name[0] == 'F') return name;
  return "Key" + std::to_string(keycode);
}

std::string pressed_json_locked() {
  std::ostringstream out;
  out << '[';
  bool first = true;
  for (const auto &[code, name] : pressing_keys) {
    if (!first) out << ',';
    first = false;
    out << "{\"keyCode\":" << code << ",\"keyName\":\"" << json_escape(name)
        << "\",\"enKeyName\":\"" << json_escape(name) << "\"}";
  }
  out << ']';
  return out.str();
}

void emit_keyboard(int code, bool down, const std::string &name) {
  {
    std::lock_guard<std::mutex> lock(keyboard_mutex);
    if (down) pressing_keys[code] = name;
    else pressing_keys.erase(code);
    pending_keyboard_events.push_back({code, down, pressed_json_locked()});
    // Avoid unbounded growth if the JS process is temporarily busy.
    if (pending_keyboard_events.size() > 1024) pending_keyboard_events.pop_front();
  }
}

bool is_keyboard_device(int fd) {
  unsigned long bits[(KEY_MAX + sizeof(unsigned long) * 8) / (sizeof(unsigned long) * 8)]{};
  if (ioctl(fd, EVIOCGBIT(EV_KEY, sizeof(bits)), bits) < 0) return false;
  const size_t index = KEY_A / (sizeof(unsigned long) * 8);
  const unsigned long mask = 1UL << (KEY_A % (sizeof(unsigned long) * 8));
  return (bits[index] & mask) != 0;
}

std::vector<int> open_keyboards() {
  std::vector<int> result;
  std::error_code ec;
  if (!std::filesystem::exists("/dev/input", ec)) return result;
  for (const auto &entry : std::filesystem::directory_iterator("/dev/input", ec)) {
    std::string name = entry.path().filename().string();
    if (name.rfind("event", 0) != 0) continue;
    int fd = open(entry.path().c_str(), O_RDONLY | O_NONBLOCK | O_CLOEXEC);
    if (fd >= 0 && is_keyboard_device(fd)) result.push_back(fd);
    else if (fd >= 0) close(fd);
  }
  return result;
}

void run_evdev(std::vector<int> fds) {
  std::vector<pollfd> polls;
  for (int fd : fds) polls.push_back({fd, POLLIN, 0});
  while (keyboard_running) {
    int timeout = std::max(1, static_cast<int>(watcher_interval_ms));
    if (poll(polls.data(), polls.size(), timeout) <= 0) continue;
    for (auto &item : polls) {
      if (!(item.revents & POLLIN)) continue;
      input_event event{};
      while (read(item.fd, &event, sizeof(event)) == sizeof(event)) {
        if (event.type == EV_KEY && (event.value == 0 || event.value == 1)) {
          emit_keyboard(event.code, event.value == 1, evdev_key_name(event.code));
        }
      }
    }
  }
  for (int fd : fds) close(fd);
}

void record_callback(XPointer, XRecordInterceptData *data) {
  if (!data) return;
  if (data->category == XRecordFromServer && data->data_len >= 2) {
    const unsigned char type = data->data[0] & 0x7f;
    const unsigned keycode = data->data[1];
    if (type == KeyPress || type == KeyRelease) {
      Display *display = record_control_display.load();
      KeySym symbol = display ? XkbKeycodeToKeysym(display, keycode, 0, 0) : NoSymbol;
      emit_keyboard(keycode, type == KeyPress, keysym_name(symbol, keycode));
    }
  }
  XRecordFreeData(data);
}

void run_xrecord() {
  XInitThreads();
  XSetErrorHandler([](Display *, XErrorEvent *) { return 0; });
  Display *control = XOpenDisplay(nullptr);
  Display *data = XOpenDisplay(nullptr);
  if (!control || !data) {
    if (control) XCloseDisplay(control);
    if (data) XCloseDisplay(data);
    keyboard_running = false;
    return;
  }
  int major = 0, minor = 0;
  if (!XRecordQueryVersion(control, &major, &minor)) {
    XCloseDisplay(data); XCloseDisplay(control); keyboard_running = false; return;
  }
  XRecordRange *range = XRecordAllocRange();
  range->device_events.first = KeyPress;
  range->device_events.last = KeyRelease;
  XRecordClientSpec clients = XRecordAllClients;
  XRecordContext context = XRecordCreateContext(control, 0, &clients, 1, &range, 1);
  XFree(range);
  record_control_display.store(control);
  record_context.store(context);
  if (context) XRecordEnableContext(data, context, record_callback, nullptr);
  if (context) XRecordFreeContext(control, context);
  record_context.store(0);
  record_control_display.store(nullptr);
  XCloseDisplay(data);
  XCloseDisplay(control);
  keyboard_running = false;
}

std::string get_x_property(Display *display, Window window, Atom property) {
  Atom type = None;
  int format = 0;
  unsigned long count = 0, remaining = 0;
  unsigned char *data = nullptr;
  if (XGetWindowProperty(display, window, property, 0, 4096, False, AnyPropertyType,
                         &type, &format, &count, &remaining, &data) != Success || !data) return {};
  std::string result(reinterpret_cast<char *>(data), format == 8 ? count : 0);
  XFree(data);
  return result;
}

Window active_window(Display *display) {
  Window root = DefaultRootWindow(display);
  Atom property = XInternAtom(display, "_NET_ACTIVE_WINDOW", True);
  Atom type = None;
  int format = 0;
  unsigned long count = 0, remaining = 0;
  unsigned char *data = nullptr;
  if (property == None || XGetWindowProperty(display, root, property, 0, 1, False, XA_WINDOW,
      &type, &format, &count, &remaining, &data) != Success || !data) return None;
  Window result = *reinterpret_cast<Window *>(data);
  XFree(data);
  return result;
}

std::string focused_app_json() {
  Display *display = XOpenDisplay(nullptr);
  if (!display) return "{\"appName\":\"Desktop App\",\"processId\":0,\"bundleId\":\"-1\",\"editable\":true}";
  Window window = active_window(display);
  if (!window) { XCloseDisplay(display); return "{}"; }
  Atom title_atom = XInternAtom(display, "_NET_WM_NAME", False);
  std::string title = get_x_property(display, window, title_atom);
  if (title.empty()) {
    char *legacy = nullptr;
    if (XFetchName(display, window, &legacy) && legacy) { title = legacy; XFree(legacy); }
  }
  XClassHint hint{};
  std::string app_name = "Desktop App", class_name;
  if (XGetClassHint(display, window, &hint)) {
    if (hint.res_class) class_name = hint.res_class;
    if (hint.res_name) app_name = hint.res_name;
    if (!class_name.empty()) app_name = class_name;
    if (hint.res_name) XFree(hint.res_name);
    if (hint.res_class) XFree(hint.res_class);
  }
  Atom pid_atom = XInternAtom(display, "_NET_WM_PID", False);
  Atom type = None;
  int format = 0;
  unsigned long count = 0, remaining = 0;
  unsigned char *pid_data = nullptr;
  unsigned long pid = 0;
  if (XGetWindowProperty(display, window, pid_atom, 0, 1, False, XA_CARDINAL, &type, &format,
      &count, &remaining, &pid_data) == Success && pid_data) {
    pid = *reinterpret_cast<unsigned long *>(pid_data); XFree(pid_data);
  }
  std::string executable;
  if (pid) {
    char path[4096];
    std::string proc = "/proc/" + std::to_string(pid) + "/exe";
    ssize_t length = readlink(proc.c_str(), path, sizeof(path) - 1);
    if (length > 0) { path[length] = 0; executable = path; }
  }
  XWindowAttributes attributes{};
  XGetWindowAttributes(display, window, &attributes);
  int x = 0, y = 0;
  Window child = None;
  XTranslateCoordinates(display, window, DefaultRootWindow(display), 0, 0, &x, &y, &child);
  XCloseDisplay(display);
  std::ostringstream out;
  out << "{\"appName\":\"" << json_escape(app_name) << "\",\"processId\":" << pid
      << ",\"bundleId\":\"" << json_escape(class_name) << "\",\"executablePath\":\""
      << json_escape(executable) << "\",\"bundlePath\":\"\",\"windowTitle\":\""
      << json_escape(title) << "\",\"windowId\":" << window
      << ",\"windowBounds\":{\"x\":" << x << ",\"y\":" << y << ",\"width\":"
      << attributes.width << ",\"height\":" << attributes.height << "},\"webTitle\":\"\","
      << "\"webURL\":\"\",\"isWebBrowser\":false,\"className\":\""
      << json_escape(class_name) << "\",\"isVisible\":true,\"isActive\":true,"
      << "\"isHidden\":false,\"isTerminated\":false,\"activationPolicy\":0}";
  return out.str();
}

std::string machine_id() {
  std::ifstream file("/etc/machine-id");
  std::string id;
  std::getline(file, id);
  return id;
}

void clear_atspi_error(GError **error) {
  if (error && *error) g_clear_error(error);
}

bool accessible_has_state(AtspiAccessible *accessible, AtspiStateType state) {
  AtspiStateSet *states = atspi_accessible_get_state_set(accessible);
  const bool present = states && atspi_state_set_contains(states, state);
  if (states) g_object_unref(states);
  return present;
}

bool selected_text_from_focused_accessible(AtspiAccessible *accessible,
                                           std::string &result,
                                           int depth,
                                           int &remaining_nodes) {
  if (!accessible || depth > 32 || remaining_nodes-- <= 0) return false;

  GError *error = nullptr;
  const bool focused = accessible_has_state(accessible, ATSPI_STATE_FOCUSED);

  if (focused) {
    AtspiText *text = atspi_accessible_get_text_iface(accessible);
    if (text) {
      const gint selection_count = atspi_text_get_n_selections(text, &error);
      if (error) clear_atspi_error(&error);
      if (selection_count > 0) {
        AtspiRange *range = atspi_text_get_selection(text, 0, &error);
        if (!error && range && range->end_offset > range->start_offset) {
          gchar *selected = atspi_text_get_text(
              text, range->start_offset, range->end_offset, &error);
          if (!error && selected) result.assign(selected);
          if (selected) g_free(selected);
        }
        if (range) g_boxed_free(ATSPI_TYPE_RANGE, range);
        if (error) clear_atspi_error(&error);
        g_object_unref(text);
        return true;
      }
      g_object_unref(text);
      // This is the focused text object. No selection is a valid result, so do
      // not continue walking what may be a very large browser/terminal tree.
      return true;
    }
    // A focused container may own the actual focused text object below it.
  }

  const gint child_count = atspi_accessible_get_child_count(accessible, &error);
  if (error) {
    clear_atspi_error(&error);
    return false;
  }
  for (gint index = 0; index < child_count; ++index) {
    AtspiAccessible *child =
        atspi_accessible_get_child_at_index(accessible, index, &error);
    if (error) clear_atspi_error(&error);
    if (!child) continue;
    const bool found = selected_text_from_focused_accessible(
        child, result, depth + 1, remaining_nodes);
    g_object_unref(child);
    if (found) return true;
  }
  return false;
}

std::string get_selected_text_atspi() {
  std::lock_guard<std::mutex> lock(atspi_mutex);
  std::call_once(atspi_init_once, [] { atspi_available = atspi_init() == 0; });
  if (!atspi_available || atspi_get_desktop_count() <= 0) return {};

  AtspiAccessible *desktop = atspi_get_desktop(0);
  if (!desktop) return {};
  std::string result;
  bool searched_active_window = false;
  GError *error = nullptr;
  const gint application_count =
      atspi_accessible_get_child_count(desktop, &error);
  if (error) clear_atspi_error(&error);
  for (gint app_index = 0; app_index < application_count && !searched_active_window;
       ++app_index) {
    AtspiAccessible *application =
        atspi_accessible_get_child_at_index(desktop, app_index, &error);
    if (error) clear_atspi_error(&error);
    if (!application) continue;
    const gint window_count =
        atspi_accessible_get_child_count(application, &error);
    if (error) clear_atspi_error(&error);
    for (gint window_index = 0; window_index < window_count; ++window_index) {
      AtspiAccessible *window =
          atspi_accessible_get_child_at_index(application, window_index, &error);
      if (error) clear_atspi_error(&error);
      if (!window) continue;
      if (accessible_has_state(window, ATSPI_STATE_ACTIVE)) {
        int remaining_nodes = 2048;
        selected_text_from_focused_accessible(
            window, result, 0, remaining_nodes);
        searched_active_window = true;
      }
      g_object_unref(window);
      if (searched_active_window) break;
    }
    g_object_unref(application);
  }
  if (!searched_active_window) {
    // Some toolkits do not expose an active top-level window. Keep a bounded
    // fallback for them rather than scanning an unlimited accessibility tree.
    int remaining_nodes = 512;
    selected_text_from_focused_accessible(desktop, result, 0, remaining_nodes);
  }
  g_object_unref(desktop);
  return result;
}

enum class TextEditKind { Insert, DeleteBackward };

bool edit_focused_accessible(AtspiAccessible *accessible,
                             TextEditKind kind,
                             const char *text,
                             int32_t delete_count,
                             int depth,
                             int &remaining_nodes) {
  if (!accessible || depth > 32 || remaining_nodes-- <= 0) return false;

  if (accessible_has_state(accessible, ATSPI_STATE_FOCUSED)) {
    AtspiEditableText *editable =
        atspi_accessible_get_editable_text_iface(accessible);
    AtspiText *text_iface = atspi_accessible_get_text_iface(accessible);
    if (editable && text_iface) {
      GError *error = nullptr;
      const gint caret = atspi_text_get_caret_offset(text_iface, &error);
      bool success = false;
      if (!error && caret >= 0) {
        if (kind == TextEditKind::Insert) {
          const size_t byte_length = std::strlen(text ? text : "");
          if (byte_length <= static_cast<size_t>(G_MAXINT)) {
            success = atspi_editable_text_insert_text(
                editable, caret, text ? text : "",
                static_cast<gint>(byte_length), &error);
          }
        } else {
          const gint start = std::max<gint>(0, caret - std::max(0, delete_count));
          success = start == caret || atspi_editable_text_delete_text(
              editable, start, caret, &error);
        }
      }
      if (error) clear_atspi_error(&error);
      g_object_unref(text_iface);
      g_object_unref(editable);
      return success;
    }
    if (text_iface) g_object_unref(text_iface);
    if (editable) g_object_unref(editable);
  }

  GError *error = nullptr;
  const gint child_count = atspi_accessible_get_child_count(accessible, &error);
  if (error) {
    clear_atspi_error(&error);
    return false;
  }
  for (gint index = 0; index < child_count; ++index) {
    AtspiAccessible *child =
        atspi_accessible_get_child_at_index(accessible, index, &error);
    if (error) clear_atspi_error(&error);
    if (!child) continue;
    const bool success = edit_focused_accessible(
        child, kind, text, delete_count, depth + 1, remaining_nodes);
    g_object_unref(child);
    if (success) return true;
  }
  return false;
}

bool edit_focused_text_atspi(TextEditKind kind,
                             const char *text = nullptr,
                             int32_t delete_count = 0) {
  std::lock_guard<std::mutex> lock(atspi_mutex);
  std::call_once(atspi_init_once, [] { atspi_available = atspi_init() == 0; });
  if (!atspi_available || atspi_get_desktop_count() <= 0) return false;

  AtspiAccessible *desktop = atspi_get_desktop(0);
  if (!desktop) return false;
  bool success = false;
  bool searched_active_window = false;
  GError *error = nullptr;
  const gint application_count =
      atspi_accessible_get_child_count(desktop, &error);
  if (error) clear_atspi_error(&error);
  for (gint app_index = 0;
       app_index < application_count && !searched_active_window;
       ++app_index) {
    AtspiAccessible *application =
        atspi_accessible_get_child_at_index(desktop, app_index, &error);
    if (error) clear_atspi_error(&error);
    if (!application) continue;
    const gint window_count =
        atspi_accessible_get_child_count(application, &error);
    if (error) clear_atspi_error(&error);
    for (gint window_index = 0; window_index < window_count; ++window_index) {
      AtspiAccessible *window =
          atspi_accessible_get_child_at_index(application, window_index, &error);
      if (error) clear_atspi_error(&error);
      if (!window) continue;
      if (accessible_has_state(window, ATSPI_STATE_ACTIVE)) {
        int remaining_nodes = 2048;
        success = edit_focused_accessible(
            window, kind, text, delete_count, 0, remaining_nodes);
        searched_active_window = true;
      }
      g_object_unref(window);
      if (searched_active_window) break;
    }
    g_object_unref(application);
  }
  if (!searched_active_window) {
    int remaining_nodes = 512;
    success = edit_focused_accessible(
        desktop, kind, text, delete_count, 0, remaining_nodes);
  }
  g_object_unref(desktop);
  return success;
}

}  // namespace

// keyboard-helper ABI
EXPORT void updateTargetShortcuts(char *) {}
EXPORT void resetPressingKeycodes() {
  std::lock_guard<std::mutex> lock(keyboard_mutex);
  pressing_keys.clear();
  pending_keyboard_events.clear();
}
EXPORT bool startMonitor(KeyboardCallback callback) {
  std::lock_guard<std::mutex> lifecycle_lock(keyboard_lifecycle_mutex);
  if (keyboard_running.exchange(true)) return true;
  {
    std::lock_guard<std::mutex> keyboard_lock(keyboard_mutex);
    keyboard_callback = callback;
    pending_keyboard_events.clear();
  }
  keyboard_thread = new std::thread([] {
    auto devices = open_keyboards();
    if (!devices.empty()) run_evdev(std::move(devices));
    else run_xrecord();
  });
  return true;
}
EXPORT void processEvents() {
  // Koffi callbacks must run on the V8 thread. The capture thread therefore
  // only queues snapshots; the child-process JS polls this function on its
  // event-loop thread and callbacks are invoked synchronously from here.
  std::deque<PendingKeyboardEvent> events;
  KeyboardCallback callback = nullptr;
  {
    std::lock_guard<std::mutex> lock(keyboard_mutex);
    events.swap(pending_keyboard_events);
    callback = keyboard_callback;
  }
  if (!callback) return;
  for (auto &event : events) {
    callback(event.code, event.down ? 1 : 0, 0, event.pressing_keys_json.data());
  }
}
EXPORT void stopMonitor() {
  std::lock_guard<std::mutex> lifecycle_lock(keyboard_lifecycle_mutex);
  const bool was_running = keyboard_running.exchange(false);
  Display *control = record_control_display.load();
  XRecordContext context = record_context.load();
  if (was_running && control && context) {
    XRecordDisableContext(control, context);
    XFlush(control);
  }
  if (keyboard_thread) {
    if (keyboard_thread->joinable()) {
      if (keyboard_thread->get_id() == std::this_thread::get_id()) keyboard_thread->detach();
      else keyboard_thread->join();
    }
    delete keyboard_thread;
    keyboard_thread = nullptr;
  }
  resetPressingKeycodes();
  {
    std::lock_guard<std::mutex> lock(keyboard_mutex);
    keyboard_callback = nullptr;
  }
}
EXPORT void setWatcherInterval(double seconds) { watcher_interval_ms = std::max(1.0, seconds * 1000.0); }
EXPORT const char *getKeyboardLayoutInfo(bool) {
  shared_result = "{\"layout\":\"linux\",\"source\":\"evdev-xrecord\"}";
  return shared_result.c_str();
}
EXPORT const char *getKeyboardDeviceList() {
  std::ostringstream out;
  out << '[';
  bool first = true;
  std::error_code ec;
  if (std::filesystem::exists("/dev/input", ec)) {
    for (const auto &entry : std::filesystem::directory_iterator("/dev/input", ec)) {
      std::string filename = entry.path().filename().string();
      if (filename.rfind("event", 0) != 0) continue;
      int fd = open(entry.path().c_str(), O_RDONLY | O_NONBLOCK | O_CLOEXEC);
      if (fd < 0 || !is_keyboard_device(fd)) { if (fd >= 0) close(fd); continue; }
      char name[256] = "Keyboard";
      ioctl(fd, EVIOCGNAME(sizeof(name)), name);
      close(fd);
      if (!first) out << ',';
      first = false;
      out << "{\"name\":\"" << json_escape(name) << "\",\"path\":\""
          << json_escape(entry.path().string()) << "\"}";
    }
  }
  out << ']';
  shared_result = out.str();
  return shared_result.c_str();
}

// input-helper ABI
EXPORT int32_t insertTextAtspi(const char *text) {
  return text && edit_focused_text_atspi(TextEditKind::Insert, text) ? 1 : 0;
}
EXPORT int32_t insertText(const char *text) {
  if (!text) return 0;
  if (insertTextAtspi(text)) return 1;
  if (is_wayland() && ydotool_ready() && run_command({"ydotool", "type", "--", text}) == 0) return 1;
  if (is_wayland() && command_exists("wtype") && run_command({"wtype", "--", text}) == 0) return 1;
  if (command_exists("xdotool") && run_command({"xdotool", "type", "--clearmodifiers", "--delay", "1", "--", text}) == 0) return 1;
  if (ydotool_ready() && run_command({"ydotool", "type", "--", text}) == 0) return 1;
  return 0;
}
EXPORT int32_t insertRichText(const char *, const char *text) { return insertText(text); }
EXPORT int32_t deleteBackward(int32_t count) {
  if (count <= 0) return 0;
  if (edit_focused_text_atspi(TextEditKind::DeleteBackward, nullptr, count)) return 0;
  int result = 0;
  for (int32_t i = 0; i < std::max(0, count); ++i) {
    if (is_wayland() && ydotool_ready()) result = run_command({"ydotool", "key", "14:1", "14:0"});
    else if (is_wayland() && command_exists("wtype")) result = run_command({"wtype", "-P", "backspace", "-p", "backspace"});
    else if (command_exists("xdotool")) result = run_command({"xdotool", "key", "--clearmodifiers", "BackSpace"});
  }
  return result;
}
EXPORT const char *getSelectedText() {
  // AT-SPI reads the focused control without synthesizing Ctrl+C or touching
  // the clipboard, so terminal input and foreground processes are unaffected.
  shared_result = get_selected_text_atspi();
  return shared_result.c_str();
}
EXPORT const char *getCurrentInputState() { shared_result = "{}"; return shared_result.c_str(); }
EXPORT void getSelectedTextBySimulateCopyAsync(StringCallback callback) { if (callback) callback(getSelectedText()); }

// context-helper ABI
EXPORT const char *getFocusedAppInfo() { shared_result = focused_app_json(); return shared_result.c_str(); }
EXPORT void getFocusedAppInfoAsync(StringCallback callback) { if (callback) callback(getFocusedAppInfo()); }
EXPORT const char *getFocusedElementInfo() {
  shared_result = "{\"role\":\"text_field\",\"enabled\":true,\"focused\":true,\"editable\":true,\"multiline\":true}";
  return shared_result.c_str();
}
EXPORT void getFocusedElementInfoAsync(StringCallback callback) { if (callback) callback(getFocusedElementInfo()); }
EXPORT const char *getFocusedVisibleText(int32_t, int32_t) { shared_result.clear(); return shared_result.c_str(); }
EXPORT void getFocusedVisibleTextAsync(int32_t, int32_t, StringCallback callback) { if (callback) callback(""); }
EXPORT const char *getFocusedElementRelatedContent(int32_t before, int32_t after, int32_t) {
  shared_result = "{\"beforeContent\":\"\",\"afterContent\":\"\",\"error\":\"\",\"beforeCharsRequested\":" +
      std::to_string(before) + ",\"afterCharsRequested\":" + std::to_string(after) + "}";
  return shared_result.c_str();
}
EXPORT void getFocusedElementRelatedContentAsync(int32_t before, int32_t after, int32_t timeout, StringCallback callback) {
  if (callback) callback(getFocusedElementRelatedContent(before, after, timeout));
}
EXPORT int32_t setFocusedWindowEnhancedUserInterface() { return 1; }
EXPORT void cleanup_context_helper() {}

// util-helper ABI
EXPORT int launchApplicationByName(const char *name) {
  if (!name || !*name) return 0;
  if (command_exists("gtk-launch") && run_command({"gtk-launch", name}) == 0) return 1;
  return run_command({name}) == 0 ? 1 : 0;
}
EXPORT int muteAudio() { return run_command({"pactl", "set-sink-mute", "@DEFAULT_SINK@", "1"}) == 0 ? 1 : 0; }
EXPORT int unmuteAudio() { return run_command({"pactl", "set-sink-mute", "@DEFAULT_SINK@", "0"}) == 0 ? 1 : 0; }
EXPORT int isAudioMuted() {
  std::string value = run_capture({"pactl", "get-sink-mute", "@DEFAULT_SINK@"});
  if (value.empty()) return -1;
  return value.find("yes") != std::string::npos ? 1 : 0;
}
EXPORT int32_t deviceIsLidOpen() { return 1; }
EXPORT const char *getAudioDevicesJSON() { shared_result = "[]"; return shared_result.c_str(); }
EXPORT void getAudioDevicesJSONAsync(StringCallback callback) { if (callback) callback(getAudioDevicesJSON()); }
EXPORT const char *getDeviceId(const char *prefix) {
  shared_result = std::string(prefix ? prefix : "Typeless") + "-" + machine_id();
  return shared_result.c_str();
}
EXPORT int checkAccessibilityPermission() { return 1; }

__attribute__((destructor)) static void shutdown_helper() { stopMonitor(); }
