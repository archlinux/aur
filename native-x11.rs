// SPDX-License-Identifier: MIT
use crate::{AppInfo, Bounds};
use std::{thread, time::Duration};
use x11rb::{
    connection::Connection,
    protocol::{xproto::*, xtest::ConnectionExt as _},
    rust_connection::RustConnection,
    CURRENT_TIME,
};

type XResult<T> = std::result::Result<T, Box<dyn std::error::Error>>;

struct Display {
    conn: RustConnection,
    root: Window,
}

impl Display {
    fn open() -> XResult<Self> {
        let (conn, screen) = x11rb::connect(None)?;
        let root = conn.setup().roots[screen].root;
        Ok(Self { conn, root })
    }

    fn atom(&self, name: &str) -> XResult<Atom> {
        Ok(self.conn.intern_atom(false, name.as_bytes())?.reply()?.atom)
    }

    fn property(&self, window: Window, name: &str) -> XResult<GetPropertyReply> {
        Ok(self
            .conn
            .get_property(false, window, self.atom(name)?, AtomEnum::ANY, 0, 4096)?
            .reply()?)
    }

    fn active(&self) -> XResult<Window> {
        let active = self
            .property(self.root, "_NET_ACTIVE_WINDOW")?
            .value32()
            .and_then(|mut v| v.next());
        let window = match active.filter(|w| *w > 1) {
            Some(window) => window,
            None => self.conn.get_input_focus()?.reply()?.focus,
        };
        if window <= 1 || window == self.root {
            return Err("No active X11 window".into());
        }
        Ok(window)
    }

    fn input_in(&self, target: Window) -> XResult<bool> {
        let mut focus = self.conn.get_input_focus()?.reply()?.focus;
        for _ in 0..32 {
            if focus == target {
                return Ok(true);
            }
            if focus <= 1 || focus == self.root {
                break;
            }
            focus = self.conn.query_tree(focus)?.reply()?.parent;
        }
        Ok(false)
    }
}

pub fn foreground() -> Option<AppInfo> {
    let d = Display::open().ok()?;
    let window = d.active().ok()?;
    let title = d
        .property(window, "_NET_WM_NAME")
        .ok()
        .filter(|p| !p.value.is_empty())
        .or_else(|| d.property(window, "WM_NAME").ok())
        .map(|p| String::from_utf8_lossy(&p.value).into_owned())
        .unwrap_or_default();
    let class = d
        .property(window, "WM_CLASS")
        .ok()
        .and_then(|p| {
            p.value
                .split(|b| *b == 0)
                .filter(|s| !s.is_empty())
                .next_back()
                .map(|s| String::from_utf8_lossy(s).into_owned())
        })
        .unwrap_or_default();
    let pid = d
        .property(window, "_NET_WM_PID")
        .ok()
        .and_then(|p| p.value32().and_then(|mut v| v.next()))
        .unwrap_or_default();
    let process = std::fs::read_to_string(format!("/proc/{pid}/comm"))
        .map(|s| s.trim().to_owned())
        .unwrap_or_else(|_| class.clone());
    let bounds = (|| -> XResult<Bounds> {
        let g = d.conn.get_geometry(window)?.reply()?;
        let p = d
            .conn
            .translate_coordinates(window, d.root, 0, 0)?
            .reply()?;
        Ok(Bounds {
            x: p.dst_x.into(),
            y: p.dst_y.into(),
            width: g.width.into(),
            height: g.height.into(),
        })
    })()
    .unwrap_or_default();
    Some(AppInfo {
        app_name: class,
        process_name: process,
        window_title: title,
        hwnd: format!("x11:{window:#x}"),
        process_id: pid,
        bounds,
    })
}

pub fn focus(handle: &str) -> bool {
    let Some(id) = handle
        .strip_prefix("x11:0x")
        .and_then(|s| u32::from_str_radix(s, 16).ok())
    else {
        return false;
    };
    (|| -> XResult<bool> {
        let d = Display::open()?;
        d.conn.get_window_attributes(id)?.reply()?;
        let message = ClientMessageEvent::new(
            32,
            id,
            d.atom("_NET_ACTIVE_WINDOW")?,
            [1, CURRENT_TIME, 0, 0, 0],
        );
        d.conn
            .send_event(
                false,
                d.root,
                EventMask::SUBSTRUCTURE_REDIRECT | EventMask::SUBSTRUCTURE_NOTIFY,
                message,
            )?
            .check()?;
        // A bare X server has no window manager. This also supports the native smoke test.
        if d.property(d.root, "_NET_SUPPORTING_WM_CHECK")?
            .value
            .is_empty()
        {
            d.conn
                .set_input_focus(InputFocus::PARENT, id, CURRENT_TIME)?
                .check()?;
        }
        d.conn.flush()?;
        for _ in 0..10 {
            if d.input_in(id)? {
                return Ok(true);
            }
            thread::sleep(Duration::from_millis(20));
        }
        Ok(false)
    })()
    .unwrap_or(false)
}

pub struct Paste {
    display: Display,
    control: u8,
    v: u8,
}

impl Paste {
    pub fn new() -> std::result::Result<Self, String> {
        (|| -> XResult<Self> {
            let display = Display::open()?;
            display.active()?;
            display.conn.xtest_get_version(2, 2)?.reply()?;
            let setup = display.conn.setup();
            let first = setup.min_keycode;
            let count = setup.max_keycode - first + 1;
            let mapping = display.conn.get_keyboard_mapping(first, count)?.reply()?;
            let keycode = |symbol| {
                mapping
                    .keysyms
                    .chunks(mapping.keysyms_per_keycode as usize)
                    .position(|row| row.contains(&symbol))
                    .map(|i| first + i as u8)
            };
            let control = keycode(0xffe3).ok_or("Control_L is absent from the keymap")?;
            let v = keycode(0x76).ok_or("V is absent from the keymap")?;
            Ok(Self {
                display,
                control,
                v,
            })
        })()
        .map_err(|e| e.to_string())
    }

    pub fn send(self) -> std::result::Result<(), String> {
        (|| -> XResult<()> {
            let d = &self.display;
            // Do not release a modifier that the user still holds.
            let keys = d.conn.query_keymap()?.reply()?.keys;
            let held = keys[self.control as usize / 8] & (1 << (self.control % 8)) != 0;
            if !held {
                d.conn
                    .xtest_fake_input(KEY_PRESS_EVENT, self.control, CURRENT_TIME, d.root, 0, 0, 0)?
                    .check()?;
            }
            d.conn
                .xtest_fake_input(KEY_PRESS_EVENT, self.v, CURRENT_TIME, d.root, 0, 0, 0)?
                .check()?;
            d.conn
                .xtest_fake_input(KEY_RELEASE_EVENT, self.v, CURRENT_TIME, d.root, 0, 0, 0)?
                .check()?;
            if !held {
                d.conn
                    .xtest_fake_input(
                        KEY_RELEASE_EVENT,
                        self.control,
                        CURRENT_TIME,
                        d.root,
                        0,
                        0,
                        0,
                    )?
                    .check()?;
            }
            d.conn.flush()?;
            Ok(())
        })()
        .map_err(|e| e.to_string())
    }
}
