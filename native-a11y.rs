// SPDX-License-Identifier: MIT
// AT-SPI calls remain on the calling thread. Each scan has a time and node limit.
use crate::{A11yElement, AppInfo, Bounds};
use std::{
    collections::VecDeque,
    ffi::{c_char, c_int, c_uint, c_void, CStr, CString},
    ptr,
    sync::{Mutex, OnceLock},
    time::{Duration, Instant},
};

type Ptr = *mut c_void;
type ErrorOut = *mut Ptr;
const ACTIVE: c_int = 1;
const FOCUSED: c_int = 12;
const SHOWING: c_int = 25;
static LOCK: Mutex<()> = Mutex::new(());

#[repr(C)]
struct Rect {
    x: i32,
    y: i32,
    width: i32,
    height: i32,
}
#[repr(C)]
struct Range {
    start: i32,
    end: i32,
}

unsafe extern "C" {
    fn atspi_init() -> c_int;
    fn atspi_set_timeout(timeout: c_int, startup: c_int);
    fn atspi_get_desktop(index: c_int) -> Ptr;
    fn atspi_accessible_clear_cache_single(object: Ptr);
    fn atspi_accessible_get_child_count(object: Ptr, error: ErrorOut) -> c_int;
    fn atspi_accessible_get_child_at_index(object: Ptr, index: c_int, error: ErrorOut) -> Ptr;
    fn atspi_accessible_get_name(object: Ptr, error: ErrorOut) -> *mut c_char;
    fn atspi_accessible_get_role_name(object: Ptr, error: ErrorOut) -> *mut c_char;
    fn atspi_accessible_get_state_set(object: Ptr) -> Ptr;
    fn atspi_accessible_get_process_id(object: Ptr, error: ErrorOut) -> c_uint;
    fn atspi_accessible_get_component_iface(object: Ptr) -> Ptr;
    fn atspi_accessible_get_text_iface(object: Ptr) -> Ptr;
    fn atspi_accessible_get_editable_text_iface(object: Ptr) -> Ptr;
    fn atspi_state_set_contains(object: Ptr, state: c_int) -> c_int;
    fn atspi_component_get_extents(object: Ptr, coord: c_int, error: ErrorOut) -> *mut Rect;
    fn atspi_component_grab_focus(object: Ptr, error: ErrorOut) -> c_int;
    fn atspi_text_get_caret_offset(object: Ptr, error: ErrorOut) -> c_int;
    fn atspi_text_set_caret_offset(object: Ptr, offset: c_int, error: ErrorOut) -> c_int;
    fn atspi_text_get_character_extents(
        object: Ptr,
        offset: c_int,
        coord: c_int,
        error: ErrorOut,
    ) -> *mut Rect;
    fn atspi_text_get_text(object: Ptr, start: c_int, end: c_int, error: ErrorOut) -> *mut c_char;
    fn atspi_text_get_n_selections(object: Ptr, error: ErrorOut) -> c_int;
    fn atspi_text_get_selection(object: Ptr, index: c_int, error: ErrorOut) -> *mut Range;
    fn atspi_editable_text_delete_text(
        object: Ptr,
        start: c_int,
        end: c_int,
        error: ErrorOut,
    ) -> c_int;
    fn atspi_editable_text_insert_text(
        object: Ptr,
        position: c_int,
        text: *const c_char,
        length: c_int,
        error: ErrorOut,
    ) -> c_int;
    fn g_object_unref(object: Ptr);
    fn g_free(memory: Ptr);
}

struct Object(Ptr);
impl Drop for Object {
    fn drop(&mut self) {
        unsafe { g_object_unref(self.0) }
    }
}
impl Object {
    // Every pointer accepted here is an owned GObject reference from libatspi.
    fn owned(pointer: Ptr) -> Option<Self> {
        if pointer.is_null() {
            None
        } else {
            Some(Self(pointer))
        }
    }
    fn accessible(pointer: Ptr) -> Option<Self> {
        let object = Self::owned(pointer)?;
        unsafe {
            // Keep the default cache mask. Disabling it can cause a recursive
            // GetState call while libatspi handles the initial GetItems reply.
            // Invalidate this object so each scan reads current properties.
            atspi_accessible_clear_cache_single(object.0);
        }
        Some(object)
    }
    fn count(&self) -> i32 {
        unsafe { atspi_accessible_get_child_count(self.0, ptr::null_mut()).clamp(0, 256) }
    }
    fn child(&self, index: i32) -> Option<Self> {
        Self::accessible(unsafe {
            atspi_accessible_get_child_at_index(self.0, index, ptr::null_mut())
        })
    }
    fn state(&self, state: i32) -> bool {
        Self::owned(unsafe { atspi_accessible_get_state_set(self.0) })
            .is_some_and(|set| unsafe { atspi_state_set_contains(set.0, state) != 0 })
    }
    fn name(&self) -> String {
        owned_string(unsafe { atspi_accessible_get_name(self.0, ptr::null_mut()) })
    }
    fn role(&self) -> String {
        owned_string(unsafe { atspi_accessible_get_role_name(self.0, ptr::null_mut()) })
    }
    fn text(&self) -> Option<Self> {
        if self.role().contains("password") {
            return None;
        }
        Self::owned(unsafe { atspi_accessible_get_text_iface(self.0) })
    }
    fn bounds(&self) -> Bounds {
        Self::owned(unsafe { atspi_accessible_get_component_iface(self.0) })
            .and_then(|c| {
                owned_rect(unsafe { atspi_component_get_extents(c.0, 0, ptr::null_mut()) })
            })
            .unwrap_or_default()
    }
}

fn owned_string(pointer: *mut c_char) -> String {
    if pointer.is_null() {
        return String::new();
    }
    // libatspi returns a NUL-terminated, GLib-allocated UTF-8 string.
    unsafe {
        let text = CStr::from_ptr(pointer)
            .to_string_lossy()
            .chars()
            .take(4096)
            .collect();
        g_free(pointer.cast());
        text
    }
}
fn owned_rect(pointer: *mut Rect) -> Option<Bounds> {
    if pointer.is_null() {
        return None;
    }
    unsafe {
        let r = &*pointer;
        let result = Bounds {
            x: r.x,
            y: r.y,
            width: r.width,
            height: r.height,
        };
        g_free(pointer.cast());
        Some(result)
    }
}
fn desktop() -> Option<Object> {
    static INITIALIZED: OnceLock<bool> = OnceLock::new();
    if !*INITIALIZED.get_or_init(|| unsafe {
        atspi_set_timeout(100, 500);
        matches!(atspi_init(), 0 | 1)
    }) {
        return None;
    }
    Object::accessible(unsafe { atspi_get_desktop(0) })
}

fn active_frame() -> Option<(Object, String, u32, i32)> {
    let root = desktop()?;
    let deadline = Instant::now() + Duration::from_millis(350);
    for app_index in 0..root.count() {
        if Instant::now() >= deadline {
            break;
        }
        let Some(app) = root.child(app_index) else {
            continue;
        };
        for frame_index in 0..app.count() {
            if Instant::now() >= deadline {
                return None;
            }
            let Some(frame) = app.child(frame_index) else {
                continue;
            };
            if frame.state(ACTIVE) {
                let pid = unsafe { atspi_accessible_get_process_id(app.0, ptr::null_mut()) };
                return Some((frame, app.name(), pid, frame_index));
            }
        }
    }
    None
}

fn scan(root: Object, focused_only: bool) -> Vec<Object> {
    let deadline = Instant::now() + Duration::from_millis(350);
    let mut queue = VecDeque::from([(root, 0)]);
    let mut result = Vec::new();
    let mut visited = 0;
    while let Some((node, depth)) = queue.pop_front() {
        if visited >= 256 || Instant::now() >= deadline {
            break;
        }
        visited += 1;
        if focused_only && node.state(FOCUSED) {
            return vec![node];
        }
        if depth < 24 {
            for index in 0..node
                .count()
                .min((256 - visited - queue.len().min(256 - visited)) as i32)
            {
                if Instant::now() >= deadline {
                    break;
                }
                if let Some(child) = node.child(index) {
                    if child.state(SHOWING) {
                        queue.push_back((child, depth + 1));
                    }
                }
            }
        }
        if !focused_only {
            result.push(node);
        }
    }
    result
}
fn focused() -> Option<Object> {
    scan(active_frame()?.0, true).pop()
}

pub fn foreground() -> Option<AppInfo> {
    let _guard = LOCK.lock().ok()?;
    let (frame, app_name, pid, index) = active_frame()?;
    let process_name = std::fs::read_to_string(format!("/proc/{pid}/comm"))
        .map(|s| s.trim().to_owned())
        .unwrap_or_else(|_| app_name.clone());
    Some(AppInfo {
        app_name,
        process_name,
        window_title: frame.name(),
        hwnd: format!("atspi:{pid}:{index}"),
        process_id: pid,
        bounds: frame.bounds(),
    })
}
pub fn caret() -> Option<Bounds> {
    let _guard = LOCK.lock().ok()?;
    let text = focused()?.text()?;
    let offset = unsafe { atspi_text_get_caret_offset(text.0, ptr::null_mut()) };
    if offset < 0 {
        return None;
    }
    owned_rect(unsafe { atspi_text_get_character_extents(text.0, offset, 0, ptr::null_mut()) })
        .filter(|r| r.height > 0)
}
fn selection_range(text: &Object) -> Option<(i32, i32)> {
    unsafe {
        if atspi_text_get_n_selections(text.0, ptr::null_mut()) <= 0 {
            return None;
        }
        let range = atspi_text_get_selection(text.0, 0, ptr::null_mut());
        if range.is_null() {
            return None;
        }
        let result = ((*range).start, (*range).end);
        g_free(range.cast());
        (result.0 >= 0 && result.1 > result.0).then_some(result)
    }
}
pub fn selection() -> Option<String> {
    let _guard = LOCK.lock().ok()?;
    let text = focused()?.text()?;
    let (start, end) = selection_range(&text)?;
    Some(owned_string(unsafe {
        atspi_text_get_text(text.0, start, end.min(start + 4096), ptr::null_mut())
    }))
}
pub fn elements() -> Vec<A11yElement> {
    let Ok(_guard) = LOCK.lock() else {
        return Vec::new();
    };
    let Some((frame, _, _, _)) = active_frame() else {
        return Vec::new();
    };
    scan(frame, false)
        .into_iter()
        .take(128)
        .map(|node| {
            let value = node
                .text()
                .map(|text| {
                    owned_string(unsafe { atspi_text_get_text(text.0, 0, 1024, ptr::null_mut()) })
                })
                .unwrap_or_default();
            A11yElement {
                role: node.role(),
                name: node.name(),
                automation_id: String::new(),
                value,
                bounds: node.bounds(),
            }
        })
        .collect()
}
pub fn focus(handle: &str) -> bool {
    let Ok(_guard) = LOCK.lock() else {
        return false;
    };
    let parts: Vec<_> = handle.split(':').collect();
    if parts.len() != 3 {
        return false;
    }
    let (Ok(pid), Ok(index)) = (parts[1].parse::<u32>(), parts[2].parse::<i32>()) else {
        return false;
    };
    if index < 0 {
        return false;
    }
    let Some(root) = desktop() else {
        return false;
    };
    for i in 0..root.count() {
        let Some(app) = root.child(i) else {
            continue;
        };
        if unsafe { atspi_accessible_get_process_id(app.0, ptr::null_mut()) } != pid {
            continue;
        }
        let Some(frame) = app.child(index) else {
            return false;
        };
        if frame.state(ACTIVE) {
            return true;
        }
        return Object::owned(unsafe { atspi_accessible_get_component_iface(frame.0) })
            .is_some_and(|c| unsafe { atspi_component_grab_focus(c.0, ptr::null_mut()) != 0 });
    }
    false
}
pub fn insert(value: &str) -> bool {
    let Ok(_guard) = LOCK.lock() else {
        return false;
    };
    let Some(node) = focused() else {
        return false;
    };
    let Some(text) = node.text() else {
        return false;
    };
    let Some(edit) = Object::owned(unsafe { atspi_accessible_get_editable_text_iface(node.0) })
    else {
        return false;
    };
    let Ok(value_c) = CString::new(value) else {
        return false;
    };
    let mut position = unsafe { atspi_text_get_caret_offset(text.0, ptr::null_mut()) };
    if position < 0 {
        return false;
    }
    if let Some((start, end)) = selection_range(&text) {
        if unsafe { atspi_editable_text_delete_text(edit.0, start, end, ptr::null_mut()) } == 0 {
            return false;
        }
        position = start;
    }
    let inserted = unsafe {
        atspi_editable_text_insert_text(
            edit.0,
            position,
            value_c.as_ptr(),
            value.len() as i32,
            ptr::null_mut(),
        ) != 0
    };
    if inserted {
        unsafe {
            atspi_text_set_caret_offset(
                text.0,
                position + value.chars().count() as i32,
                ptr::null_mut(),
            );
        }
    }
    inserted
}
