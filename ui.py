from tkinterdnd2 import TkinterDnD, DND_FILES
from tkinter import ttk, StringVar, Canvas, Text, END, DISABLED, NORMAL
from PIL import Image, ImageTk
import threading
import io
import os
import cairosvg
import sv_ttk

from tags import TAG_KEYS, read_tags, get_cover, save_tags
from theme import get_system_theme
from musicbrainz import fetch_missing

SUPPORTED_EXTENSIONS = {
    # MPEG
    ".mp3",
    # FLAC
    ".flac",
    # OGG family
    ".ogg", ".oga", ".opus", ".spx",
    # MP4 / AAC
    ".mp4", ".m4a", ".m4b", ".m4p", ".m4v", ".aac",
    # ASF / WMA
    ".wma", ".asf", ".wmv",
    # AIFF
    ".aiff", ".aif", ".aifc",
    # Monkey's Audio
    ".ape",
    # WavPack
    ".wv",
    # Musepack
    ".mpc", ".mp+",
    # True Audio
    ".tta",
    # OptimFROG
    ".ofr", ".ofs",
    # DSD Stream File
    ".dsf", ".dsd",
}

tag_vars = {}
_album_image_ref = None
_log_widget = None
_root = None
_current_path = None


def log(msg):
    if _log_widget is None:
        return
    def _append():
        _log_widget.config(state=NORMAL)
        _log_widget.insert(END, msg + "\n")
        _log_widget.see(END)
        _log_widget.config(state=DISABLED)
    _root.after(0, _append)


def _show_cover(img, canvas):
    global _album_image_ref
    size = 200
    img.thumbnail((size, size))
    _album_image_ref = ImageTk.PhotoImage(img)
    canvas.config(width=size, height=size)
    canvas.delete("all")
    canvas.create_image(size // 2, size // 2, anchor="center", image=_album_image_ref)


def _clear_cover(canvas):
    canvas.delete("all")
    canvas.create_text(100, 100, text="No Art", fill="gray", anchor="center")


def _mb_fetch_thread(current_tags):
    filled = fetch_missing(current_tags, log)
    if filled:
        log("MusicBrainz filled:")
        for label, val in filled.items():
            if val:
                tag_vars[label].set(val)
                log(f"  {label}: {val}")
    else:
        log("MusicBrainz: nothing new found")


def _refresh_field(label):
    """Refresh a single field by clearing it and fetching from MB."""
    current = {lbl: var.get() for lbl, var in tag_vars.items()}
    current[label] = ""  # force MB to fill this one
    log(f"Refreshing {label} from MusicBrainz...")
    threading.Thread(target=_mb_fetch_thread, args=(current,), daemon=True).start()


def load_file(path, canvas):
    global _current_path
    current = read_tags(path)
    if current is None:
        for var in tag_vars.values():
            var.set("—")
        _clear_cover(canvas)
        log(f"Could not read file: {path}")
        return

    _current_path = path
    log(f"Loaded: {path}")
    for label, val in current.items():
        tag_vars[label].set(val)

    img = get_cover(path)
    if img:
        _show_cover(img, canvas)
    else:
        _clear_cover(canvas)

    missing = [k for k, v in current.items() if not v and k not in ("Comment", "Composer", "Disc")]
    if missing:
        log(f"Fetching missing tags from MusicBrainz: {', '.join(missing)}")
        threading.Thread(target=_mb_fetch_thread, args=(current,), daemon=True).start()


def _save():
    if not _current_path:
        log("No file loaded.")
        return
    tags_dict = {label: var.get() for label, var in tag_vars.items()}
    ok, err = save_tags(_current_path, tags_dict)
    if ok:
        log(f"Saved: {_current_path}")
    else:
        log(f"Save failed: {err}")


def _on_drop(event, overlay, canvas):
    overlay.place_forget()
    path = event.data.strip().strip("{}")
    ext = "." + path.rsplit(".", 1)[-1].lower() if "." in path else ""
    if ext not in SUPPORTED_EXTENSIONS:
        log(f"Unsupported file type: {ext or '(none)'}")
        return
    load_file(path, canvas)


def _on_drag_enter(event, overlay):
    overlay.place(x=0, y=0, relwidth=1, relheight=1)
    overlay.lift()


def _on_drag_leave(event, overlay):
    overlay.place_forget()


def build_window():
    global _log_widget, _root

    root = TkinterDnD.Tk()
    root.title("Music Tags")
    root.geometry("760x560")
    sv_ttk.set_theme(get_system_theme())
    _root = root

    svg_path = os.path.join(os.path.dirname(__file__), "Anonymous-Music-Folder-Icon.svg")
    png_data = cairosvg.svg2png(url=svg_path, output_width=64, output_height=64)
    icon_img = ImageTk.PhotoImage(Image.open(io.BytesIO(png_data)))
    root.iconphoto(True, icon_img)

    root.drop_target_register(DND_FILES)

    overlay = ttk.Label(root, text="Drop here", anchor="center", font=("", 24, "bold"))

    root.dnd_bind("<<DropEnter>>", lambda e: _on_drag_enter(e, overlay))
    root.dnd_bind("<<DropLeave>>", lambda e: _on_drag_leave(e, overlay))
    root.dnd_bind("<<Drop>>", lambda e: _on_drop(e, overlay, canvas))

    # Top: album art + tag fields
    content = ttk.Frame(root, padding=16)
    content.pack(fill="both", expand=True)

    left = ttk.Frame(content)
    left.pack(side="left", anchor="n", padx=(0, 16))

    canvas = Canvas(left, width=200, height=200, highlightthickness=0, bg="#1c1c1c")
    canvas.pack()
    canvas.create_text(100, 100, text="No Art", fill="gray", anchor="center")

    grid = ttk.Frame(content)
    grid.pack(side="left", fill="both", expand=True)
    grid.columnconfigure(1, weight=1)

    for i, label in enumerate(TAG_KEYS):
        ttk.Label(grid, text=label + ":", anchor="e").grid(row=i, column=0, sticky="e", padx=(0, 8), pady=2)
        var = StringVar()
        ttk.Entry(grid, textvariable=var).grid(row=i, column=1, sticky="ew", pady=2)
        ttk.Button(grid, text="↻", width=2,
                   command=lambda lbl=label: _refresh_field(lbl)).grid(row=i, column=2, padx=(4, 0), pady=2)
        tag_vars[label] = var

    # Save button
    ttk.Button(grid, text="Save", command=_save).grid(
        row=len(TAG_KEYS), column=0, columnspan=3, sticky="ew", pady=(12, 0))

    # Bottom: log panel
    log_frame = ttk.Frame(root, padding=(16, 0, 16, 16))
    log_frame.pack(fill="x")

    scrollbar = ttk.Scrollbar(log_frame)
    scrollbar.pack(side="right", fill="y")

    _log_widget = Text(log_frame, height=6, state=DISABLED, yscrollcommand=scrollbar.set,
                       font=("monospace", 9), relief="flat", bg="#111", fg="#aaa",
                       insertbackground="#aaa")
    _log_widget.pack(fill="x")
    scrollbar.config(command=_log_widget.yview)

    return root
