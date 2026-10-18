// SPDX-License-Identifier: MIT
use arboard::{Clipboard, GetExtLinux, LinuxClipboardKind};
use napi::{Error, Result};
use napi_derive::napi;
use std::sync::{Mutex, OnceLock};

#[path = "native-a11y.rs"]
mod a11y;
#[path = "native-x11.rs"]
mod x11;

#[napi(object)]
#[derive(Default, Clone)]
pub struct Bounds {
    pub x: i32,
    pub y: i32,
    pub width: i32,
    pub height: i32,
}

#[napi(object)]
#[derive(Default)]
pub struct AppInfo {
    pub app_name: String,
    pub process_name: String,
    pub window_title: String,
    pub hwnd: String,
    pub process_id: u32,
    pub bounds: Bounds,
}

#[napi(object)]
#[derive(Default)]
pub struct CaretPosition {
    pub x: i32,
    pub y: i32,
    pub width: i32,
    pub height: i32,
    pub hwnd: String,
    pub process_name: String,
    pub has_caret: bool,
}

#[napi(object)]
pub struct A11yElement {
    pub role: String,
    pub name: String,
    pub automation_id: String,
    pub value: String,
    pub bounds: Bounds,
}

fn wayland() -> bool {
    std::env::var("XDG_SESSION_TYPE").is_ok_and(|s| s == "wayland")
        || std::env::var_os("WAYLAND_DISPLAY").is_some_and(|s| !s.is_empty())
}

fn clipboard<T>(
    operation: impl FnOnce(&mut Clipboard) -> std::result::Result<T, arboard::Error>,
) -> Result<T> {
    // Keep ownership after injectUnicodeText returns. X11 clients request the text later.
    static CLIPBOARD: OnceLock<Mutex<Option<Clipboard>>> = OnceLock::new();
    let mut owner = CLIPBOARD
        .get_or_init(|| Mutex::new(None))
        .lock()
        .map_err(|_| Error::from_reason("Clipboard lock failed"))?;
    if owner.is_none() {
        *owner = Some(Clipboard::new().map_err(|e| Error::from_reason(e.to_string()))?);
    }
    operation(owner.as_mut().unwrap()).map_err(|e| Error::from_reason(e.to_string()))
}

#[napi]
pub fn ping() -> &'static str {
    "gemini-native-linux"
}

#[napi]
pub fn get_foreground_app_info() -> AppInfo {
    if !wayland() {
        if let Some(info) = x11::foreground() {
            return info;
        }
    }
    a11y::foreground().unwrap_or_default()
}

#[napi]
pub fn get_caret_position() -> CaretPosition {
    let info = get_foreground_app_info();
    let rect = a11y::caret();
    CaretPosition {
        x: rect.as_ref().map_or(0, |r| r.x),
        y: rect.as_ref().map_or(0, |r| r.y),
        width: rect.as_ref().map_or(2, |r| r.width.max(2)),
        height: rect.as_ref().map_or(20, |r| r.height.max(1)),
        has_caret: rect.is_some(),
        hwnd: info.hwnd,
        process_name: info.process_name,
    }
}

#[napi(js_name = "getActiveWindowA11yTree")]
pub fn get_active_window_a11y_tree() -> Vec<A11yElement> {
    a11y::elements()
}

#[napi]
pub fn get_selected_text() -> String {
    a11y::selection()
        .or_else(|| clipboard(|c| c.get().clipboard(LinuxClipboardKind::Primary).text()).ok())
        .unwrap_or_default()
}

#[napi]
pub fn set_foreground_window(hwnd: String) -> bool {
    if hwnd.starts_with("atspi:") {
        a11y::focus(&hwnd)
    } else if !wayland() {
        x11::focus(&hwnd)
    } else {
        false
    }
}

#[napi]
pub fn inject_unicode_text(text: String) -> Result<u32> {
    let text = text.replace('\r', "");
    if text.is_empty() {
        return Ok(0);
    }
    if !a11y::insert(&text) {
        if wayland() {
            return Err(Error::from_reason(
                "The target does not provide an AT-SPI editable text interface",
            ));
        }
        // Validate the active target and XTEST before changing the clipboard.
        let paste = x11::Paste::new().map_err(Error::from_reason)?;
        clipboard(|c| c.set_text(text.clone()))?;
        paste.send().map_err(Error::from_reason)?;
    }
    Ok(text.encode_utf16().count() as u32)
}

#[napi]
pub fn paste_ctrl_v() -> Result<bool> {
    if wayland() {
        return Err(Error::from_reason(
            "Keyboard injection requires an X11 session",
        ));
    }
    x11::Paste::new()
        .and_then(|p| p.send())
        .map_err(Error::from_reason)?;
    Ok(true)
}
