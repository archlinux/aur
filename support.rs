use std::cell::RefCell;
use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::path::{Path, PathBuf};
use std::process::Command;

unsafe extern "C" {
    fn getuid() -> u32;
}

pub type StringCallback = unsafe extern "C" fn(*const c_char);

thread_local! {
    static RETURN_BUFFER: RefCell<CString> = RefCell::new(CString::default());
}

pub fn c_string_lossy(value: *const c_char) -> Option<String> {
    if value.is_null() {
        return None;
    }
    // SAFETY: Exported functions only call this after checking for null; the
    // caller owns a NUL-terminated string for the duration of the call.
    Some(
        unsafe { CStr::from_ptr(value) }
            .to_string_lossy()
            .into_owned(),
    )
}

pub fn return_string(value: impl Into<String>) -> *const c_char {
    let mut bytes = value.into().into_bytes();
    for byte in &mut bytes {
        if *byte == 0 {
            *byte = b' ';
        }
    }
    RETURN_BUFFER.with(|buffer| {
        let mut buffer = buffer.borrow_mut();
        // All interior NUL bytes were replaced above.
        *buffer = CString::new(bytes).unwrap_or_default();
        buffer.as_ptr()
    })
}

pub fn call_string_callback(callback: Option<StringCallback>, value: *const c_char) {
    if let Some(callback) = callback {
        // SAFETY: The callback and string pointer come from the Koffi call and
        // are invoked synchronously before the thread-local buffer can change.
        unsafe { callback(value) };
    }
}

pub fn command_exists(name: &str) -> bool {
    std::env::var_os("PATH")
        .map(|path| std::env::split_paths(&path).any(|dir| is_executable(&dir.join(name))))
        .unwrap_or(false)
}

fn is_executable(path: &Path) -> bool {
    use std::os::unix::fs::PermissionsExt;
    path.metadata()
        .map(|metadata| metadata.is_file() && metadata.permissions().mode() & 0o111 != 0)
        .unwrap_or(false)
}

pub fn run_command(args: &[&str]) -> i32 {
    let Some((program, arguments)) = args.split_first() else {
        return -1;
    };
    Command::new(program)
        .args(arguments)
        .status()
        .ok()
        .and_then(|status| status.code())
        .unwrap_or(-1)
}

pub fn run_capture(args: &[&str]) -> Option<String> {
    let (program, arguments) = args.split_first()?;
    let output = Command::new(program).args(arguments).output().ok()?;
    Some(String::from_utf8_lossy(&output.stdout).into_owned())
}

pub fn is_wayland() -> bool {
    std::env::var_os("WAYLAND_DISPLAY").is_some_and(|value| !value.is_empty())
}

pub fn ydotool_ready() -> bool {
    use std::os::unix::fs::FileTypeExt;
    if !command_exists("ydotool") {
        return false;
    }
    let path = std::env::var_os("YDOTOOL_SOCKET")
        .filter(|value| !value.is_empty())
        .map(PathBuf::from)
        .or_else(|| {
            std::env::var_os("XDG_RUNTIME_DIR")
                .filter(|value| !value.is_empty())
                .map(|dir| PathBuf::from(dir).join(".ydotool_socket"))
        })
        .unwrap_or_else(|| {
            PathBuf::from(format!("/run/user/{}/.ydotool_socket", unsafe { getuid() }))
        });
    path.metadata()
        .map(|metadata| metadata.file_type().is_socket())
        .unwrap_or(false)
}
