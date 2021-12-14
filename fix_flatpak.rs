use std::ffi::{c_void, CString};
use std::mem::transmute;
use std::os::raw::{c_char, c_int};

const RTLD_NEXT: *mut c_void = -1i64 as *mut c_void;

extern "C" {
    pub fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
}

#[no_mangle]
#[allow(clippy::missing_safety_doc)]
pub unsafe extern "C" fn open64(c_path: *const c_char, oflag: c_int) -> c_int {
    let original_open64: extern "C" fn(*const c_char, c_int) -> c_int = {
        let f = dlsym(RTLD_NEXT, "open64\0".as_ptr() as _);
        transmute(f)
    };

    let c_string_path = {
        let p = CString::from_raw(c_path as _);
        let p2 = p.clone();
        // Forget the original path, so we don't drop it before shortwave uses it
        std::mem::forget(p);
        p2
    };
    let str_path = c_string_path.to_str().unwrap(); // can fail if the path is not utf-8
    if str_path == "/app/share/shortwave/de.haeckerfelix.Shortwave.gresource" {
        original_open64(
            CString::new("/usr/share/shortwave/de.haeckerfelix.Shortwave.gresource")
                .unwrap()
                .into_raw(),
            oflag,
        )
    } else if str_path.contains("favicon") || str_path.contains("recording") {
        // For some reason favicons/recording permission changes sometimes to 000
        // This is probably due to how flatpak sandbox works.
        // This blocks works-around it.
        let result = original_open64(c_string_path.clone().into_raw(), oflag); // c_path should not be used here or it will be consumed
        if result == -1 {
            std::process::Command::new("chmod")
                .arg("+rw")
                .arg(str_path)
                .status()
                .unwrap();
            original_open64(c_path, oflag)
        } else {
            result
        }
    } else {
        original_open64(c_path, oflag)
    }
}
