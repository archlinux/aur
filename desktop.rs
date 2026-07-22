use crate::atspi_support::{self, EditKind};
use crate::support::{
    StringCallback, c_string_lossy, call_string_callback, command_exists, is_wayland,
    return_string, run_capture, run_command, ydotool_ready,
};
use serde_json::json;
use std::ffi::CStr;
use std::fs;
use std::os::raw::{c_char, c_int, c_ulong};
use std::ptr;
use x11::xlib;

unsafe fn x_property(display: *mut xlib::Display, window: c_ulong, property: c_ulong) -> String {
    let mut actual_type = 0;
    let mut format = 0;
    let mut count = 0;
    let mut remaining = 0;
    let mut data = ptr::null_mut();
    let status = unsafe {
        xlib::XGetWindowProperty(
            display,
            window,
            property,
            0,
            4096,
            xlib::False,
            xlib::AnyPropertyType as c_ulong,
            &mut actual_type,
            &mut format,
            &mut count,
            &mut remaining,
            &mut data,
        )
    };
    if status != xlib::Success as c_int || data.is_null() {
        return String::new();
    }
    let value = if format == 8 {
        String::from_utf8_lossy(unsafe { std::slice::from_raw_parts(data, count as usize) })
            .into_owned()
    } else {
        String::new()
    };
    unsafe { xlib::XFree(data.cast()) };
    value
}

unsafe fn active_window(display: *mut xlib::Display) -> c_ulong {
    let root = unsafe { xlib::XDefaultRootWindow(display) };
    let property =
        unsafe { xlib::XInternAtom(display, c"_NET_ACTIVE_WINDOW".as_ptr(), xlib::True) };
    if property == 0 {
        return 0;
    }
    let mut actual_type = 0;
    let mut format = 0;
    let mut count = 0;
    let mut remaining = 0;
    let mut data = ptr::null_mut();
    let status = unsafe {
        xlib::XGetWindowProperty(
            display,
            root,
            property,
            0,
            1,
            xlib::False,
            xlib::XA_WINDOW,
            &mut actual_type,
            &mut format,
            &mut count,
            &mut remaining,
            &mut data,
        )
    };
    if status != xlib::Success as c_int || data.is_null() {
        return 0;
    }
    let window = unsafe { *data.cast::<c_ulong>() };
    unsafe { xlib::XFree(data.cast()) };
    window
}

fn focused_app_json() -> String {
    // SAFETY: Every Xlib resource obtained below is released before return.
    unsafe {
        let display = xlib::XOpenDisplay(ptr::null());
        if display.is_null() {
            return r#"{"appName":"Desktop App","processId":0,"bundleId":"-1","editable":true}"#
                .to_owned();
        }
        let window = active_window(display);
        if window == 0 {
            xlib::XCloseDisplay(display);
            return "{}".to_owned();
        }

        let title_atom = xlib::XInternAtom(display, c"_NET_WM_NAME".as_ptr(), xlib::False);
        let mut title = x_property(display, window, title_atom);
        if title.is_empty() {
            let mut legacy = ptr::null_mut();
            if xlib::XFetchName(display, window, &mut legacy) != 0 && !legacy.is_null() {
                title = CStr::from_ptr(legacy).to_string_lossy().into_owned();
                xlib::XFree(legacy.cast());
            }
        }

        let mut hint: xlib::XClassHint = std::mem::zeroed();
        let mut app_name = "Desktop App".to_owned();
        let mut class_name = String::new();
        if xlib::XGetClassHint(display, window, &mut hint) != 0 {
            if !hint.res_class.is_null() {
                class_name = CStr::from_ptr(hint.res_class)
                    .to_string_lossy()
                    .into_owned();
            }
            if !hint.res_name.is_null() {
                app_name = CStr::from_ptr(hint.res_name).to_string_lossy().into_owned();
            }
            if !class_name.is_empty() {
                app_name.clone_from(&class_name);
            }
            if !hint.res_name.is_null() {
                xlib::XFree(hint.res_name.cast());
            }
            if !hint.res_class.is_null() {
                xlib::XFree(hint.res_class.cast());
            }
        }

        let pid_atom = xlib::XInternAtom(display, c"_NET_WM_PID".as_ptr(), xlib::False);
        let mut actual_type = 0;
        let mut format = 0;
        let mut count = 0;
        let mut remaining = 0;
        let mut pid_data = ptr::null_mut();
        let mut pid = 0 as c_ulong;
        if xlib::XGetWindowProperty(
            display,
            window,
            pid_atom,
            0,
            1,
            xlib::False,
            xlib::XA_CARDINAL,
            &mut actual_type,
            &mut format,
            &mut count,
            &mut remaining,
            &mut pid_data,
        ) == xlib::Success as c_int
            && !pid_data.is_null()
        {
            pid = *pid_data.cast::<c_ulong>();
            xlib::XFree(pid_data.cast());
        }
        let executable = (pid != 0)
            .then(|| fs::read_link(format!("/proc/{pid}/exe")).ok())
            .flatten()
            .map(|path| path.to_string_lossy().into_owned())
            .unwrap_or_default();

        let mut attributes: xlib::XWindowAttributes = std::mem::zeroed();
        xlib::XGetWindowAttributes(display, window, &mut attributes);
        let (mut x, mut y, mut child) = (0, 0, 0);
        xlib::XTranslateCoordinates(
            display,
            window,
            xlib::XDefaultRootWindow(display),
            0,
            0,
            &mut x,
            &mut y,
            &mut child,
        );
        xlib::XCloseDisplay(display);
        json!({
            "appName": app_name,
            "processId": pid,
            "bundleId": class_name,
            "executablePath": executable,
            "bundlePath": "",
            "windowTitle": title,
            "windowId": window,
            "windowBounds": {"x": x, "y": y, "width": attributes.width, "height": attributes.height},
            "webTitle": "",
            "webURL": "",
            "isWebBrowser": false,
            "className": class_name,
            "isVisible": true,
            "isActive": true,
            "isHidden": false,
            "isTerminated": false,
            "activationPolicy": 0,
        })
        .to_string()
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn insertTextAtspi(text: *const c_char) -> i32 {
    let Some(text) = c_string_lossy(text) else {
        return 0;
    };
    i32::from(atspi_support::edit_focused_text(EditKind::Insert(&text)))
}

#[unsafe(no_mangle)]
pub extern "C" fn insertText(text: *const c_char) -> i32 {
    let Some(text_value) = c_string_lossy(text) else {
        return 0;
    };
    if insertTextAtspi(text) != 0 {
        return 1;
    }
    if is_wayland() && ydotool_ready() && run_command(&["ydotool", "type", "--", &text_value]) == 0
    {
        return 1;
    }
    if is_wayland() && command_exists("wtype") && run_command(&["wtype", "--", &text_value]) == 0 {
        return 1;
    }
    if command_exists("xdotool")
        && run_command(&[
            "xdotool",
            "type",
            "--clearmodifiers",
            "--delay",
            "1",
            "--",
            &text_value,
        ]) == 0
    {
        return 1;
    }
    if ydotool_ready() && run_command(&["ydotool", "type", "--", &text_value]) == 0 {
        return 1;
    }
    0
}

#[unsafe(no_mangle)]
pub extern "C" fn insertRichText(_html: *const c_char, text: *const c_char) -> i32 {
    insertText(text)
}

#[unsafe(no_mangle)]
pub extern "C" fn deleteBackward(count: i32) -> i32 {
    if count <= 0 {
        return 0;
    }
    if atspi_support::edit_focused_text(EditKind::DeleteBackward(count)) {
        return 0;
    }
    let mut result = 0;
    for _ in 0..count {
        result = if is_wayland() && ydotool_ready() {
            run_command(&["ydotool", "key", "14:1", "14:0"])
        } else if is_wayland() && command_exists("wtype") {
            run_command(&["wtype", "-P", "backspace", "-p", "backspace"])
        } else if command_exists("xdotool") {
            run_command(&["xdotool", "key", "--clearmodifiers", "BackSpace"])
        } else {
            result
        };
    }
    result
}

#[unsafe(no_mangle)]
pub extern "C" fn getSelectedText() -> *const c_char {
    return_string(atspi_support::get_selected_text())
}

#[unsafe(no_mangle)]
pub extern "C" fn getCurrentInputState() -> *const c_char {
    return_string("{}")
}

#[unsafe(no_mangle)]
pub extern "C" fn getSelectedTextBySimulateCopyAsync(callback: Option<StringCallback>) {
    call_string_callback(callback, getSelectedText());
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedAppInfo() -> *const c_char {
    return_string(focused_app_json())
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedAppInfoAsync(callback: Option<StringCallback>) {
    call_string_callback(callback, getFocusedAppInfo());
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedElementInfo() -> *const c_char {
    return_string(
        r#"{"role":"text_field","enabled":true,"focused":true,"editable":true,"multiline":true}"#,
    )
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedElementInfoAsync(callback: Option<StringCallback>) {
    call_string_callback(callback, getFocusedElementInfo());
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedVisibleText(_before: i32, _after: i32) -> *const c_char {
    return_string("")
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedVisibleTextAsync(
    _before: i32,
    _after: i32,
    callback: Option<StringCallback>,
) {
    call_string_callback(callback, return_string(""));
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedElementRelatedContent(
    before: i32,
    after: i32,
    _timeout: i32,
) -> *const c_char {
    return_string(
        json!({
            "beforeContent": "",
            "afterContent": "",
            "error": "",
            "beforeCharsRequested": before,
            "afterCharsRequested": after,
        })
        .to_string(),
    )
}

#[unsafe(no_mangle)]
pub extern "C" fn getFocusedElementRelatedContentAsync(
    before: i32,
    after: i32,
    timeout: i32,
    callback: Option<StringCallback>,
) {
    call_string_callback(
        callback,
        getFocusedElementRelatedContent(before, after, timeout),
    );
}

#[unsafe(no_mangle)]
pub extern "C" fn setFocusedWindowEnhancedUserInterface() -> i32 {
    1
}

#[unsafe(no_mangle)]
pub extern "C" fn cleanup_context_helper() {}

#[unsafe(no_mangle)]
pub extern "C" fn launchApplicationByName(name: *const c_char) -> c_int {
    let Some(name) = c_string_lossy(name).filter(|name| !name.is_empty()) else {
        return 0;
    };
    if command_exists("gtk-launch") && run_command(&["gtk-launch", &name]) == 0 {
        return 1;
    }
    i32::from(run_command(&[&name]) == 0)
}

#[unsafe(no_mangle)]
pub extern "C" fn muteAudio() -> c_int {
    i32::from(run_command(&["pactl", "set-sink-mute", "@DEFAULT_SINK@", "1"]) == 0)
}

#[unsafe(no_mangle)]
pub extern "C" fn unmuteAudio() -> c_int {
    i32::from(run_command(&["pactl", "set-sink-mute", "@DEFAULT_SINK@", "0"]) == 0)
}

#[unsafe(no_mangle)]
pub extern "C" fn isAudioMuted() -> c_int {
    let Some(output) = run_capture(&["pactl", "get-sink-mute", "@DEFAULT_SINK@"]) else {
        return -1;
    };
    if output.is_empty() {
        -1
    } else {
        i32::from(output.contains("yes"))
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn deviceIsLidOpen() -> i32 {
    1
}

#[unsafe(no_mangle)]
pub extern "C" fn getAudioDevicesJSON() -> *const c_char {
    return_string("[]")
}

#[unsafe(no_mangle)]
pub extern "C" fn getAudioDevicesJSONAsync(callback: Option<StringCallback>) {
    call_string_callback(callback, getAudioDevicesJSON());
}

#[unsafe(no_mangle)]
pub extern "C" fn getDeviceId(prefix: *const c_char) -> *const c_char {
    let prefix = c_string_lossy(prefix).unwrap_or_else(|| "Typeless".to_owned());
    let machine_id = fs::read_to_string("/etc/machine-id")
        .unwrap_or_default()
        .lines()
        .next()
        .unwrap_or_default()
        .to_owned();
    return_string(format!("{prefix}-{machine_id}"))
}

#[unsafe(no_mangle)]
pub extern "C" fn checkAccessibilityPermission() -> c_int {
    1
}
