use crate::support::return_string;
use evdev::{Device, EventType, KeyCode};
use serde_json::json;
use std::collections::{BTreeMap, VecDeque};
use std::ffi::{CStr, CString};
use std::fs;
use std::os::raw::{c_char, c_int, c_ulong};
use std::path::PathBuf;
use std::ptr;
use std::sync::atomic::{AtomicBool, AtomicPtr, AtomicU64, Ordering};
use std::sync::{Condvar, LazyLock, Mutex};
use std::thread::{self, JoinHandle};
use x11::{keysym, xlib, xrecord};

type KeyboardCallback = unsafe extern "C" fn(i32, i32, i32, *mut c_char) -> bool;

struct PendingKeyboardEvent {
    code: i32,
    down: bool,
    pressing_keys_json: String,
}

#[derive(Default)]
struct KeyboardState {
    callback: Option<KeyboardCallback>,
    pressing_keys: BTreeMap<i32, String>,
    pending_events: VecDeque<PendingKeyboardEvent>,
}

#[derive(Default)]
struct Lifecycle {
    thread: Option<JoinHandle<()>>,
}

static RUNNING: AtomicBool = AtomicBool::new(false);
static WATCHER_INTERVAL_BITS: AtomicU64 = AtomicU64::new(5.0f64.to_bits());
static RECORD_CONTROL_DISPLAY: AtomicPtr<xlib::Display> = AtomicPtr::new(ptr::null_mut());
static KEYBOARD: LazyLock<Mutex<KeyboardState>> =
    LazyLock::new(|| Mutex::new(KeyboardState::default()));
static LIFECYCLE: LazyLock<Mutex<Lifecycle>> = LazyLock::new(|| Mutex::new(Lifecycle::default()));
static CAPTURE_WAKE: LazyLock<(Mutex<()>, Condvar)> =
    LazyLock::new(|| (Mutex::new(()), Condvar::new()));

fn lock_keyboard() -> std::sync::MutexGuard<'static, KeyboardState> {
    KEYBOARD
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner())
}

fn lock_lifecycle() -> std::sync::MutexGuard<'static, Lifecycle> {
    LIFECYCLE
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner())
}

fn watcher_interval_ms() -> i32 {
    f64::from_bits(WATCHER_INTERVAL_BITS.load(Ordering::Relaxed))
        .max(1.0)
        .min(i32::MAX as f64) as i32
}

fn wait_for_capture() {
    let (lock, wake) = &*CAPTURE_WAKE;
    let guard = lock.lock().unwrap_or_else(|poisoned| poisoned.into_inner());
    if RUNNING.load(Ordering::Acquire) {
        drop(
            wake.wait_timeout(
                guard,
                std::time::Duration::from_millis(watcher_interval_ms() as u64),
            )
            .unwrap_or_else(|poisoned| poisoned.into_inner()),
        );
    }
}

fn pressed_json(state: &KeyboardState) -> String {
    serde_json::to_string(
        &state
            .pressing_keys
            .iter()
            .map(|(code, name)| json!({"keyCode": code, "keyName": name, "enKeyName": name}))
            .collect::<Vec<_>>(),
    )
    .unwrap_or_else(|_| "[]".to_owned())
}

fn emit_keyboard(code: i32, down: bool, name: String) {
    let mut state = lock_keyboard();
    if down {
        state.pressing_keys.insert(code, name);
    } else {
        state.pressing_keys.remove(&code);
    }
    let pressing_keys_json = pressed_json(&state);
    state.pending_events.push_back(PendingKeyboardEvent {
        code,
        down,
        pressing_keys_json,
    });
    if state.pending_events.len() > 1024 {
        state.pending_events.pop_front();
    }
}

fn keyboard_paths() -> Vec<PathBuf> {
    fs::read_dir("/dev/input")
        .into_iter()
        .flatten()
        .filter_map(Result::ok)
        .map(|entry| entry.path())
        .filter(|path| {
            path.file_name()
                .and_then(|name| name.to_str())
                .is_some_and(|name| name.starts_with("event"))
        })
        .collect()
}

fn open_keyboards() -> Vec<Device> {
    keyboard_paths()
        .into_iter()
        .filter_map(|path| {
            let device = Device::open(path).ok()?;
            let is_keyboard = device
                .supported_keys()
                .is_some_and(|keys| keys.contains(KeyCode::KEY_A));
            if !is_keyboard || device.set_nonblocking(true).is_err() {
                return None;
            }
            Some(device)
        })
        .collect()
}

fn run_evdev(mut devices: Vec<Device>) {
    while RUNNING.load(Ordering::Acquire) {
        let mut received_event = false;
        for device in &mut devices {
            if let Ok(events) = device.fetch_events() {
                for event in events {
                    received_event = true;
                    if event.event_type() == EventType::KEY && matches!(event.value(), 0 | 1) {
                        let code = event.code();
                        emit_keyboard(code as i32, event.value() == 1, evdev_key_name(code));
                    }
                }
            }
        }
        if !received_event {
            wait_for_capture();
        }
    }
}

unsafe extern "C" fn ignore_x_error(
    _display: *mut xlib::Display,
    _error: *mut xlib::XErrorEvent,
) -> c_int {
    0
}

unsafe extern "C" fn record_callback(
    _closure: *mut c_char,
    data: *mut xrecord::XRecordInterceptData,
) {
    if data.is_null() {
        return;
    }
    // SAFETY: XRecord owns data for this callback invocation.
    let intercepted = unsafe { &*data };
    if intercepted.category == xrecord::XRecordFromServer
        && intercepted.data_len >= 2
        && !intercepted.data.is_null()
    {
        // SAFETY: data_len confirms both bytes are present.
        let event_type = unsafe { *intercepted.data } & 0x7f;
        let keycode = unsafe { *intercepted.data.add(1) };
        if matches!(event_type as c_int, xlib::KeyPress | xlib::KeyRelease) {
            let display = RECORD_CONTROL_DISPLAY.load(Ordering::Acquire);
            let symbol = if display.is_null() {
                0
            } else {
                // SAFETY: display stays open until XRecordEnableContext returns.
                unsafe { xlib::XkbKeycodeToKeysym(display, keycode, 0, 0) }
            };
            emit_keyboard(
                keycode as i32,
                event_type as c_int == xlib::KeyPress,
                keysym_name(symbol, keycode),
            );
        }
    }
    // SAFETY: each XRecord callback datum must be released exactly once.
    unsafe { xrecord::XRecordFreeData(data) };
}

fn run_xrecord() {
    // SAFETY: Xlib calls below follow XRecord's two-display threading pattern.
    unsafe {
        xlib::XInitThreads();
        xlib::XSetErrorHandler(Some(ignore_x_error));
        let control = xlib::XOpenDisplay(ptr::null());
        let data = xlib::XOpenDisplay(ptr::null());
        if control.is_null() || data.is_null() {
            if !control.is_null() {
                xlib::XCloseDisplay(control);
            }
            if !data.is_null() {
                xlib::XCloseDisplay(data);
            }
            RUNNING.store(false, Ordering::Release);
            return;
        }
        let (mut major, mut minor) = (0, 0);
        if xrecord::XRecordQueryVersion(control, &mut major, &mut minor) == 0 {
            xlib::XCloseDisplay(data);
            xlib::XCloseDisplay(control);
            RUNNING.store(false, Ordering::Release);
            return;
        }
        let range = xrecord::XRecordAllocRange();
        if range.is_null() {
            xlib::XCloseDisplay(data);
            xlib::XCloseDisplay(control);
            RUNNING.store(false, Ordering::Release);
            return;
        }
        (*range).device_events.first = xlib::KeyPress as u8;
        (*range).device_events.last = xlib::KeyRelease as u8;
        let mut clients = xrecord::XRecordAllClients;
        let mut range_ptr = range;
        let context = xrecord::XRecordCreateContext(control, 0, &mut clients, 1, &mut range_ptr, 1);
        xlib::XFree(range.cast());
        RECORD_CONTROL_DISPLAY.store(control, Ordering::Release);
        if context != 0
            && RUNNING.load(Ordering::Acquire)
            && xrecord::XRecordEnableContextAsync(
                data,
                context,
                Some(record_callback),
                ptr::null_mut(),
            ) != 0
        {
            while RUNNING.load(Ordering::Acquire) {
                xrecord::XRecordProcessReplies(data);
                wait_for_capture();
            }
            xrecord::XRecordDisableContext(control, context);
            xlib::XSync(control, 0);
            xrecord::XRecordProcessReplies(data);
        }
        if context != 0 {
            xrecord::XRecordFreeContext(control, context);
        }
        RECORD_CONTROL_DISPLAY.store(ptr::null_mut(), Ordering::Release);
        xlib::XCloseDisplay(data);
        xlib::XCloseDisplay(control);
        RUNNING.store(false, Ordering::Release);
    }
}

fn evdev_key_name(code: u16) -> String {
    if (30..=55).contains(&code) {
        const LETTERS: &[(u16, char)] = &[
            (30, 'A'),
            (48, 'B'),
            (46, 'C'),
            (32, 'D'),
            (18, 'E'),
            (33, 'F'),
            (34, 'G'),
            (35, 'H'),
            (23, 'I'),
            (36, 'J'),
            (37, 'K'),
            (38, 'L'),
            (50, 'M'),
            (49, 'N'),
            (24, 'O'),
            (25, 'P'),
            (16, 'Q'),
            (19, 'R'),
            (31, 'S'),
            (20, 'T'),
            (22, 'U'),
            (47, 'V'),
            (17, 'W'),
            (45, 'X'),
            (21, 'Y'),
            (44, 'Z'),
        ];
        if let Some((_, letter)) = LETTERS.iter().find(|(key, _)| *key == code) {
            return letter.to_string();
        }
    }
    if (2..=10).contains(&code) {
        return char::from(b'1' + (code - 2) as u8).to_string();
    }
    if code == 11 {
        return "0".to_owned();
    }
    if (59..=68).contains(&code) {
        return format!("F{}", code - 58);
    }
    match code {
        87 => "F11",
        88 => "F12",
        42 => "LeftShift",
        54 => "RightShift",
        29 => "LeftCtrl",
        97 => "RightCtrl",
        56 => "LeftAlt",
        100 => "RightAlt",
        125 => "LeftCmd",
        126 => "RightCmd",
        57 => "Space",
        28 => "Enter",
        15 => "Tab",
        1 => "Escape",
        14 => "Backspace",
        111 => "Delete",
        103 => "Up",
        108 => "Down",
        105 => "Left",
        106 => "Right",
        102 => "Home",
        107 => "End",
        104 => "PageUp",
        109 => "PageDown",
        58 => "CapsLock",
        12 => "-",
        13 => "=",
        26 => "[",
        27 => "]",
        39 => ";",
        40 => "'",
        41 => "`",
        43 => "\\",
        51 => ",",
        52 => ".",
        53 => "/",
        115 => "VolumeUp",
        114 => "VolumeDown",
        113 => "Mute",
        _ => return format!("Key{code}"),
    }
    .to_owned()
}

fn keysym_name(symbol: c_ulong, keycode: u8) -> String {
    let known = match symbol as u32 {
        keysym::XK_Shift_L => Some("LeftShift"),
        keysym::XK_Shift_R => Some("RightShift"),
        keysym::XK_Control_L => Some("LeftCtrl"),
        keysym::XK_Control_R => Some("RightCtrl"),
        keysym::XK_Alt_L => Some("LeftAlt"),
        keysym::XK_Alt_R | keysym::XK_ISO_Level3_Shift => Some("RightAlt"),
        keysym::XK_Super_L | keysym::XK_Meta_L => Some("LeftCmd"),
        keysym::XK_Super_R | keysym::XK_Meta_R => Some("RightCmd"),
        keysym::XK_space => Some("Space"),
        keysym::XK_Return => Some("Enter"),
        keysym::XK_Tab => Some("Tab"),
        keysym::XK_Escape => Some("Escape"),
        keysym::XK_BackSpace => Some("Backspace"),
        keysym::XK_Delete => Some("Delete"),
        keysym::XK_Left => Some("Left"),
        keysym::XK_Right => Some("Right"),
        keysym::XK_Up => Some("Up"),
        keysym::XK_Down => Some("Down"),
        _ => None,
    };
    if let Some(name) = known {
        return name.to_owned();
    }
    // SAFETY: XKeysymToString returns a static string or null.
    let name = unsafe { xlib::XKeysymToString(symbol) };
    if !name.is_null() {
        // SAFETY: non-null Xlib string is NUL terminated and static.
        let name = unsafe { CStr::from_ptr(name) }.to_string_lossy();
        if name.len() == 1 {
            return name.to_ascii_uppercase();
        }
        if name.starts_with('F') {
            return name.into_owned();
        }
    }
    format!("Key{keycode}")
}

fn keyboard_device_list() -> Vec<serde_json::Value> {
    keyboard_paths()
        .into_iter()
        .filter_map(|path| {
            let device = Device::open(&path).ok()?;
            if !device
                .supported_keys()
                .is_some_and(|keys| keys.contains(KeyCode::KEY_A))
            {
                return None;
            }
            Some(json!({
                "name": device.name().unwrap_or("Keyboard"),
                "path": path.to_string_lossy(),
            }))
        })
        .collect()
}

#[unsafe(no_mangle)]
pub extern "C" fn updateTargetShortcuts(_shortcuts: *mut c_char) {}

#[unsafe(no_mangle)]
pub extern "C" fn resetPressingKeycodes() {
    let mut state = lock_keyboard();
    state.pressing_keys.clear();
    state.pending_events.clear();
}

#[unsafe(no_mangle)]
pub extern "C" fn startMonitor(callback: Option<KeyboardCallback>) -> bool {
    let mut lifecycle = lock_lifecycle();
    if RUNNING.swap(true, Ordering::AcqRel) {
        return true;
    }
    {
        let mut state = lock_keyboard();
        state.callback = callback;
        state.pending_events.clear();
    }
    // Device probing can take hundreds of milliseconds with evdev. Complete
    // it before reporting success so the first shortcut is never lost while
    // the capture thread is still starting.
    let keyboards = open_keyboards();
    lifecycle.thread = Some(thread::spawn(move || {
        if keyboards.is_empty() {
            run_xrecord();
        } else {
            run_evdev(keyboards);
        }
    }));
    true
}

#[unsafe(no_mangle)]
pub extern "C" fn processEvents() {
    let (callback, events) = {
        let mut state = lock_keyboard();
        let callback = state.callback;
        let events = state.pending_events.drain(..).collect::<Vec<_>>();
        (callback, events)
    };
    let Some(callback) = callback else {
        return;
    };
    for event in events {
        let Ok(json) = CString::new(event.pressing_keys_json) else {
            continue;
        };
        // SAFETY: Koffi owns the callback, and json remains alive during it.
        unsafe {
            callback(
                event.code,
                i32::from(event.down),
                0,
                json.as_ptr().cast_mut(),
            )
        };
    }
}

pub fn stop_monitor() {
    let mut lifecycle = lock_lifecycle();
    {
        let (lock, wake) = &*CAPTURE_WAKE;
        let guard = lock.lock().unwrap_or_else(|poisoned| poisoned.into_inner());
        RUNNING.store(false, Ordering::Release);
        wake.notify_all();
        drop(guard);
    }
    if let Some(thread) = lifecycle.thread.take()
        && thread.thread().id() != thread::current().id()
    {
        let _ = thread.join();
    }
    resetPressingKeycodes();
    lock_keyboard().callback = None;
}

#[unsafe(no_mangle)]
pub extern "C" fn stopMonitor() {
    stop_monitor();
}

#[unsafe(no_mangle)]
pub extern "C" fn setWatcherInterval(seconds: f64) {
    let milliseconds = (seconds * 1000.0).max(1.0);
    WATCHER_INTERVAL_BITS.store(milliseconds.to_bits(), Ordering::Relaxed);
    CAPTURE_WAKE.1.notify_all();
}

#[unsafe(no_mangle)]
pub extern "C" fn getKeyboardLayoutInfo(_need_detail: bool) -> *const c_char {
    return_string(r#"{"layout":"linux","source":"evdev-xrecord"}"#)
}

#[unsafe(no_mangle)]
pub extern "C" fn getKeyboardDeviceList() -> *const c_char {
    return_string(
        serde_json::to_string(&keyboard_device_list()).unwrap_or_else(|_| "[]".to_owned()),
    )
}
