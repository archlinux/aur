use std::process::Command;
use std::io::Write;
use gtk::prelude::*;
use gtk::{Application, ApplicationWindow, TextView, Button, Image, Box, Orientation, ScrolledWindow};
use gtk::gdk_pixbuf::PixbufLoader;
use gtk::Adjustment;

fn run_command(args: &[&str]) -> Option<Vec<u8>> {
    let output = Command::new(args[0])
        .args(&args[1..])
        .output()
        .ok()?;
    if output.status.success() {
        Some(output.stdout)
    } else {
        None
    }
}

fn has_mime_type(types: &str, mime: &str) -> bool {
    types.lines().any(|line| line == mime)
}

fn show_clipboard_text(text: &str) {
    let app = Application::new(None, Default::default());
    let text_owned = text.to_string();
    app.connect_activate(move |app| {
        let window = ApplicationWindow::new(app);
        window.set_title("Clipboard Text");
        window.set_default_size(400, 300);

        window.set_type_hint(gtk::gdk::WindowTypeHint::Dialog);
        window.set_keep_above(true);
        window.set_modal(true);

        let vbox = Box::new(Orientation::Vertical, 10);
        vbox.set_margin_top(16);
        vbox.set_margin_bottom(16);
        vbox.set_margin_start(16);
        vbox.set_margin_end(16);

        let scrolled = ScrolledWindow::new(None::<&gtk::Adjustment>, None::<&gtk::Adjustment>);
        scrolled.set_min_content_height(180);
        scrolled.set_min_content_width(350);
        let text_view = TextView::new();
        text_view.set_wrap_mode(gtk::WrapMode::Word);
        if let Some(buffer) = text_view.buffer() {
            buffer.set_text(&text_owned);
        }
        scrolled.add(&text_view);
        vbox.pack_start(&scrolled, true, true, 0);

        let copy_btn = Button::with_label("Copy to Clipboard");
        copy_btn.set_margin_top(10);
        copy_btn.set_halign(gtk::Align::End);
        let text_view_clone = text_view.clone();
        copy_btn.connect_clicked(move |_| {
            if let Some(buffer) = text_view_clone.buffer() {
                let start = buffer.start_iter();
                let end = buffer.end_iter();
                if let Some(text_to_copy) = buffer.text(&start, &end, false) {
                    let mut child = Command::new("wl-copy").stdin(std::process::Stdio::piped()).spawn().ok();
                    if let Some(ref mut c) = child {
                        if let Some(stdin) = c.stdin.as_mut() {
                            let _ = stdin.write_all(text_to_copy.as_bytes());
                        }
                        let _ = c.wait();
                    }
                }
            }
        });
        vbox.pack_start(&copy_btn, false, false, 0);

        window.add(&vbox);
        window.show_all();
        window.present();
    });
    app.run();
}

fn show_clipboard_image(img_data: &[u8], _format: &str) {
    let app = Application::new(None, Default::default());
    let img_data = img_data.to_vec();
    app.connect_activate(move |app| {
        let window = ApplicationWindow::new(app);
        window.set_title("Clipboard Image");
        window.set_resizable(true);

        window.set_type_hint(gtk::gdk::WindowTypeHint::Dialog);
        window.set_keep_above(true);
        window.set_modal(true);

        let loader = PixbufLoader::new();
        if loader.write(&img_data).is_err() {
            eprintln!("Failed to load image from clipboard data.");
            return;
        }
        if loader.close().is_err() {
            eprintln!("Failed to finalize image loading.");
            return;
        }
        if let Some(orig_pixbuf) = loader.pixbuf() {
            let vbox = Box::new(Orientation::Vertical, 0);

            // Image widget
            let image = Image::new();
            image.set_hexpand(true);
            image.set_vexpand(true);

            // Scrolled window for panning
            let scrolled = ScrolledWindow::new(None::<&Adjustment>, None::<&Adjustment>);
            scrolled.set_policy(gtk::PolicyType::Automatic, gtk::PolicyType::Automatic);
            scrolled.set_margin_top(0);
            scrolled.set_margin_bottom(0);
            scrolled.set_margin_start(0);
            scrolled.set_margin_end(0);
            scrolled.add(&image);
            vbox.pack_start(&scrolled, true, true, 0);

            window.add(&vbox);

            // Set window size to original image size
            let orig_width = orig_pixbuf.width();
            let orig_height = orig_pixbuf.height();
            window.set_default_size(orig_width, orig_height);
            window.set_size_request(100, 100); // allow smaller resizing

            // Clone orig_pixbuf for use in the closure
            let orig_pixbuf_for_closure = orig_pixbuf.clone();
            let image_clone = image.clone();
            window.connect_size_allocate(move |_, alloc| {
                let w = alloc.width();
                let h = alloc.height();
                if w > 0 && h > 0 {
                    let scale = f64::min(
                        w as f64 / orig_pixbuf_for_closure.width() as f64,
                        h as f64 / orig_pixbuf_for_closure.height() as f64,
                    );
                    let new_w = (orig_pixbuf_for_closure.width() as f64 * scale).round() as i32;
                    let new_h = (orig_pixbuf_for_closure.height() as f64 * scale).round() as i32;
                    if let Some(scaled) = orig_pixbuf_for_closure.scale_simple(new_w, new_h, gtk::gdk_pixbuf::InterpType::Bilinear) {
                        image_clone.set_from_pixbuf(Some(&scaled));
                    }
                }
            });

            // Set initial image at original size
            if let Some(scaled) = orig_pixbuf.scale_simple(orig_width, orig_height, gtk::gdk_pixbuf::InterpType::Bilinear) {
                image.set_from_pixbuf(Some(&scaled));
            }

            window.show_all();
            window.present();
        } else {
            eprintln!("Failed to decode image data.");
            return;
        }
    });
    app.run();
}

fn main() {
    // Force GTK to use X11 backend even on Wayland
    unsafe {
        std::env::set_var("GDK_BACKEND", "x11");
    }

    gtk::init().expect("Failed to initialize GTK");

    const ICON: &[u8] = include_bytes!("icon.ico");
    // Load icon from ICON bytes and set as default application icon
    let loader = gtk::gdk_pixbuf::PixbufLoader::new();
    if loader.write(ICON).is_ok() && loader.close().is_ok() {
        if let Some(icon_pixbuf) = loader.pixbuf() {
            gtk::Window::set_default_icon(&icon_pixbuf);
        }
    }

    let args: Vec<String> = std::env::args().collect();
    if args.len() > 1 {
        eprintln!("Usage: {}\nJust run with no arguments to show image or text from clipboard.", args[0]);
        std::process::exit(1);
    }
    let types_raw = run_command(&["wl-paste", "--list-types"]).unwrap_or_default();
    if types_raw.is_empty() {
        eprintln!("Could not retrieve clipboard types or clipboard is empty.");
        std::process::exit(1);
    }
    let types = String::from_utf8_lossy(&types_raw);
    let is_image = has_mime_type(&types, "image/png") || has_mime_type(&types, "image/jpeg") || has_mime_type(&types, "image/gif");
    let is_text = has_mime_type(&types, "text/plain") || has_mime_type(&types, "text/plain;charset=utf-8") || has_mime_type(&types, "UTF8_STRING") || has_mime_type(&types, "TEXT") || has_mime_type(&types, "STRING");
    let is_file = has_mime_type(&types, "text/uri-list");
    if is_file {
        eprintln!("Clipboard contains a file list, ignoring.");
        return;
    } else if is_image {
        println!("Detected image in clipboard.");
        let mut img_data = run_command(&["wl-paste", "--type", "image/png"]).unwrap_or_default();
        let mut format = "PNG";
        if img_data.is_empty() {
            img_data = run_command(&["wl-paste", "--type", "image/jpeg"]).unwrap_or_default();
            if !img_data.is_empty() {
                format = "JPEG";
            } else {
                img_data = run_command(&["wl-paste", "--type", "image/gif"]).unwrap_or_default();
                if !img_data.is_empty() {
                    format = "GIF";
                }
            }
        }
        if img_data.is_empty() {
            eprintln!("No supported image found in clipboard or wl-paste failed.");
            return;
        }
        show_clipboard_image(&img_data, format);
    } else if is_text {
        println!("Detected text in clipboard.");
        let text = run_command(&["wl-paste", "--no-newline"]).unwrap_or_default();
        if text.is_empty() {
            eprintln!("No text found in clipboard or wl-paste failed.");
            return;
        }
        show_clipboard_text(&String::from_utf8_lossy(&text));
    } else {
        eprintln!("Clipboard does not contain supported image or text types.");
        std::process::exit(1);
    }
}
