#!/usr/bin/env python3
"""
yt-nerddl — a sleek yt-dlp wrapper with:
- config.toml (auto-generated on first run)
- theme system (colors/icons/progress glyphs) with bundled themes
- cross-platform (Linux/macOS/Windows)
- interactive menus (arrow keys if ANSI capable; numeric fallback if not)
- optional self-updater (downloads latest script from GitHub raw)
- resumable downloads + retries (continuedl / retries / fragment_retries)
- safer UX for non-YouTube URLs (dynamic service banner + warnings)
- best-effort overwrite prompt for single-item downloads
- best-effort YouTube Music audio metadata / cover-art polish

Requires:
  - Python 3.11+
  - yt-dlp
  - ffmpeg (recommended; required for merging/conversion in many cases)
"""

from __future__ import annotations

import argparse
import copy
import os
import sys
import time
import socket
import urllib.parse
import urllib.request
import tempfile
import shutil
import re
import pprint
import subprocess
from pathlib import Path
from datetime import timedelta

import tomllib
import yt_dlp


APP_NAME = "yt-nerddl"
VERSION = "2026.03.25"

# Keep this pointed at the stable repo path. The local filename can be versioned or plain.
UPDATE_URL = "https://raw.githubusercontent.com/TheAnonymousCrusher/yt-nerddl/main/yt-nerddl.py"
MATURE_CONTENT_URL = "https://github.com/TheAnonymousCrusher/yt-nerddl/blob/main/mature_content.md"

DEFAULT_YOUTUBE_OUTPUT_DIR = "~/Videos/Youtube"
DEFAULT_OTHER_OUTPUT_DIR = "~/Videos"

VIDEO_EXTS = {"mp4", "mkv", "webm", "mov", "flv", "avi", "m4v"}
AUDIO_EXTS = {"m4a", "mp3", "opus", "ogg", "aac", "flac", "wav"}


DEFAULT_CONFIG_TOML = f"""\
# yt-nerddl config.toml
# Auto-generated on first run.
#
# Linux/macOS: ~/.config/yt-nerddl/config.toml (or $XDG_CONFIG_HOME)
# Windows:     %APPDATA%\\yt-nerddl\\config.toml
#
# TIP:
#   - Want no fancy glyphs? set [ui] icons = false
#   - Want no ANSI colors?  set [ui] colors = false

[downloads]
mode = "video"                 # "video" | "audio"
quality = "1080p30"            # video preset key (see README)
audio_bitrate = 320            # 320 | 256 | 192 | 128 | "best"
output_directory = "{DEFAULT_YOUTUBE_OUTPUT_DIR}"  # default for YouTube / YouTube Music; non-YouTube falls back to ~/Videos if unchanged

[behavior]
interactive = false
playlist = "ask"               # "ask" | "video" | "playlist" (CLI: --no-playlist forces single-video)
check_internet = true
assume_yes = false             # if true: never prompt; use defaults/config

[cookies]
enabled = false
browser = "firefox"            # firefox | chrome | brave | edge | opera | safari

[network]
continuedl = true              # resume partial downloads (.part)
retries = 10                   # network retries
fragment_retries = 10          # retries for fragmented streams

[ui]
theme = "default"              # default | catppuccin | gruvbox | nord
progress_bar_width = 25
progress_fill = ""             # override fill glyph ("" = theme default)
progress_empty = ""            # override empty glyph ("" = theme default)
icons = true
colors = true
"""

THEME_DEFAULT_TOML = """\
[colors]
accent  = "\\u001b[1;36m"
success = "\\u001b[1;32m"
warning = "\\u001b[1;33m"
error   = "\\u001b[1;31m"
text    = "\\u001b[1;37m"
dim     = "\\u001b[2m"

[progress]
fill  = "▰"
empty = "▱"

[icons]
youtube  = ""
success  = "✔"
warning  = ""
time     = "󱫐"
"""

THEME_CATPPUCCIN_TOML = """\
[colors]
accent  = "\\u001b[38;5;111m"
success = "\\u001b[38;5;114m"
warning = "\\u001b[38;5;216m"
error   = "\\u001b[38;5;203m"
text    = "\\u001b[38;5;252m"
dim     = "\\u001b[38;5;244m"

[progress]
fill  = "▰"
empty = "▱"

[icons]
youtube  = ""
success  = "✔"
warning  = ""
time     = "󱫐"
"""

THEME_GRUVBOX_TOML = """\
[colors]
accent  = "\\u001b[38;5;208m"
success = "\\u001b[38;5;142m"
warning = "\\u001b[38;5;214m"
error   = "\\u001b[38;5;167m"
text    = "\\u001b[38;5;223m"
dim     = "\\u001b[38;5;245m"

[progress]
fill  = "▰"
empty = "▱"

[icons]
youtube  = ""
success  = "✔"
warning  = ""
time     = "󱫐"
"""

THEME_NORD_TOML = """\
[colors]
accent  = "\\u001b[38;5;110m"
success = "\\u001b[38;5;108m"
warning = "\\u001b[38;5;179m"
error   = "\\u001b[38;5;174m"
text    = "\\u001b[38;5;252m"
dim     = "\\u001b[38;5;244m"

[progress]
fill  = "▰"
empty = "▱"

[icons]
youtube  = ""
success  = "✔"
warning  = ""
time     = "󱫐"
"""

BUNDLED_THEMES: dict[str, str] = {
    "default": THEME_DEFAULT_TOML,
    "catppuccin": THEME_CATPPUCCIN_TOML,
    "gruvbox": THEME_GRUVBOX_TOML,
    "nord": THEME_NORD_TOML,
}


def get_default_config_dir() -> Path:
    if os.name == "nt":
        base = os.environ.get("APPDATA")
        if base:
            return Path(base) / APP_NAME
        return Path.home() / "AppData" / "Roaming" / APP_NAME

    base = os.environ.get("XDG_CONFIG_HOME")
    if base:
        return Path(base) / APP_NAME
    return Path.home() / ".config" / APP_NAME


def ensure_file(path: Path, content: str) -> bool:
    if path.exists():
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    return True


def init_config_and_themes(config_path: Path) -> dict[str, bool]:
    config_dir = config_path.parent
    themes_dir = config_dir / "themes"

    created_config = ensure_file(config_path, DEFAULT_CONFIG_TOML)

    themes_dir.mkdir(parents=True, exist_ok=True)
    created_any_theme = False
    for name, toml_text in BUNDLED_THEMES.items():
        created = ensure_file(themes_dir / f"{name}.toml", toml_text)
        created_any_theme = created_any_theme or created

    return {"config": created_config, "themes": created_any_theme}


def load_toml_file(path: Path) -> dict:
    try:
        raw = path.read_text(encoding="utf-8")
        data = tomllib.loads(raw)
        return data if isinstance(data, dict) else {}
    except FileNotFoundError:
        return {}
    except Exception:
        return {}


def deep_merge(a: dict, b: dict) -> dict:
    for k, v in (b or {}).items():
        if isinstance(v, dict) and isinstance(a.get(k), dict):
            deep_merge(a[k], v)
        else:
            a[k] = v
    return a


def expand_path(p: str) -> str:
    p = os.path.expandvars(p)
    p = os.path.expanduser(p)
    return os.path.abspath(p)


def enable_windows_vt_mode() -> bool:
    if os.name != "nt":
        return True
    try:
        import ctypes

        kernel32 = ctypes.windll.kernel32
        STD_OUTPUT_HANDLE = -11
        handle = kernel32.GetStdHandle(STD_OUTPUT_HANDLE)

        mode = ctypes.c_uint()
        if kernel32.GetConsoleMode(handle, ctypes.byref(mode)) == 0:
            return False

        ENABLE_VT_PROCESSING = 0x0004
        new_mode = mode.value | ENABLE_VT_PROCESSING

        if kernel32.SetConsoleMode(handle, new_mode) == 0:
            return False
        return True
    except Exception:
        return False


def detect_ansi_support() -> bool:
    if not sys.stdout.isatty():
        return False
    if os.name == "nt":
        return enable_windows_vt_mode()
    return True


ANSI_OK = detect_ansi_support()
ESC = "\x1b"
RESET_SEQ = f"{ESC}[0m"
CLEAR_LINE = f"{ESC}[2K" if ANSI_OK else ""
CURSOR_PREV_LINE = f"{ESC}[F" if ANSI_OK else ""


DEFAULTS = {
    "downloads": {
        "mode": "video",
        "quality": "1080p30",
        "audio_bitrate": 320,
        "output_directory": DEFAULT_YOUTUBE_OUTPUT_DIR,
    },
    "behavior": {
        "interactive": False,
        "playlist": "ask",
        "check_internet": True,
        "assume_yes": False,
    },
    "cookies": {
        "enabled": False,
        "browser": "firefox",
    },
    "network": {
        "continuedl": True,
        "retries": 10,
        "fragment_retries": 10,
    },
    "ui": {
        "theme": "default",
        "progress_bar_width": 25,
        "progress_fill": "",
        "progress_empty": "",
        "icons": True,
        "colors": True,
    },
}


def get_theme_search_dirs(config_dir: Path) -> list[Path]:
    dirs: list[Path] = [config_dir / "themes"]

    if os.name != "nt":
        dirs.append(Path("/usr/local/share") / APP_NAME / "themes")
        dirs.append(Path("/usr/share") / APP_NAME / "themes")
    else:
        programdata = os.environ.get("PROGRAMDATA")
        if programdata:
            dirs.append(Path(programdata) / APP_NAME / "themes")

    try:
        script_dir = Path(__file__).resolve().parent
        dirs.append(script_dir / "themes")
    except Exception:
        pass

    return dirs


def find_theme_files(config_dir: Path) -> dict[str, Path]:
    out: dict[str, Path] = {}
    for d in get_theme_search_dirs(config_dir):
        if not d.exists():
            continue
        for p in d.glob("*.toml"):
            if p.stem not in out:
                out[p.stem] = p
    return out


def load_theme_data(theme_name: str, config_dir: Path) -> dict:
    theme_name = (theme_name or "default").strip()
    files = find_theme_files(config_dir)
    if theme_name in files:
        return load_toml_file(files[theme_name])
    return load_toml_file(config_dir / "themes" / "default.toml") or tomllib.loads(THEME_DEFAULT_TOML)


def build_ui(theme_data: dict, ui_cfg: dict) -> dict:
    colors_enabled = bool(ui_cfg.get("colors", True)) and ANSI_OK
    icons_enabled = bool(ui_cfg.get("icons", True))

    colors = theme_data.get("colors", {}) if isinstance(theme_data.get("colors"), dict) else {}
    progress = theme_data.get("progress", {}) if isinstance(theme_data.get("progress"), dict) else {}
    icons = theme_data.get("icons", {}) if isinstance(theme_data.get("icons"), dict) else {}

    def col(key: str, fallback: str) -> str:
        if not colors_enabled:
            return ""
        return str(colors.get(key, fallback))

    def ico(key: str, fallback: str) -> str:
        if not icons_enabled:
            return fallback
        return str(icons.get(key, fallback))

    icon_fallbacks = {
        "youtube": "[YT]",
        "success": "OK!",
        "warning": "!!",
        "time": "--",
    }

    bar_width = ui_cfg.get("progress_bar_width", 25)
    try:
        bar_width = int(bar_width)
    except Exception:
        bar_width = 25
    bar_width = max(10, min(80, bar_width))

    fill_theme = str(progress.get("fill", "▰"))
    empty_theme = str(progress.get("empty", "▱"))

    fill_override = str(ui_cfg.get("progress_fill", "") or "")
    empty_override = str(ui_cfg.get("progress_empty", "") or "")

    fill = fill_override if fill_override else fill_theme
    empty = empty_override if empty_override else empty_theme

    return {
        "ansi": ANSI_OK,
        "colors_enabled": colors_enabled,
        "icons_enabled": icons_enabled,
        "reset": RESET_SEQ if colors_enabled else "",
        "accent": col("accent", f"{ESC}[1;36m"),
        "success": col("success", f"{ESC}[1;32m"),
        "warning": col("warning", f"{ESC}[1;33m"),
        "error": col("error", f"{ESC}[1;31m"),
        "text": col("text", f"{ESC}[1;37m"),
        "dim": col("dim", f"{ESC}[2m"),
        "fill": fill,
        "empty": empty,
        "bar_width": bar_width,
        "icons": {
            "youtube": ico("youtube", icon_fallbacks["youtube"]),
            "success": ico("success", icon_fallbacks["success"]),
            "warning": ico("warning", icon_fallbacks["warning"]),
            "time": ico("time", icon_fallbacks["time"]),
        },
    }


def paint(ui: dict, color_key: str, text: str) -> str:
    if not ui.get("colors_enabled", False):
        return text
    return f"{ui.get(color_key, '')}{text}{ui.get('reset', '')}"


def first_non_empty(*values) -> str:
    for value in values:
        if value is None:
            continue
        if isinstance(value, (list, tuple)):
            nested = first_non_empty(*value)
            if nested:
                return nested
            continue
        if isinstance(value, dict):
            continue
        text = str(value).strip()
        if text:
            return text
    return ""


def sanitize_filename_component(text: str, replacement: str = "_") -> str:
    text = str(text or "").strip()
    text = re.sub(r'[<>:"/\\|?*\x00-\x1F]+', replacement, text)
    text = re.sub(r"\s+", " ", text)
    text = text.strip(" .")
    return text or "untitled"


def normalize_compare_path(p: str) -> str:
    return os.path.normcase(os.path.normpath(expand_path(p)))


def choose_output_directory(raw_output_dir: str, is_youtube_family: bool, cli_overridden: bool) -> tuple[str, bool]:
    raw = (raw_output_dir or DEFAULT_YOUTUBE_OUTPUT_DIR).strip() or DEFAULT_YOUTUBE_OUTPUT_DIR
    if cli_overridden:
        return expand_path(raw), False
    if not is_youtube_family and normalize_compare_path(raw) == normalize_compare_path(DEFAULT_YOUTUBE_OUTPUT_DIR):
        return expand_path(DEFAULT_OTHER_OUTPUT_DIR), True
    return expand_path(raw), False


def human_time(seconds: float | int | None) -> str:
    try:
        total = max(0, int(float(seconds or 0)))
    except Exception:
        total = 0
    return str(timedelta(seconds=total))


def label_from_extension(ext: str, default: str = "File") -> str:
    ext = (ext or "").strip().lower().lstrip(".")
    if ext in AUDIO_EXTS:
        return "Audio"
    if ext in VIDEO_EXTS:
        return "Video"
    if ext:
        return ext.upper()
    return default


def build_mode_label(output_file: str, requested_audio: bool) -> str:
    ext = Path(output_file).suffix.lower().lstrip(".") if output_file else ""
    if requested_audio:
        return f"Audio - {ext}" if ext else "Audio"

    label = label_from_extension(ext, default="Video")
    if label in {"Video", "Audio"}:
        return f"{label} - {ext}" if ext else label
    if ext:
        return f"File - {ext}"
    return "Video"


def ask_yes_no(ui: dict, question: str, default: bool = False) -> bool:
    if not sys.stdin.isatty():
        return default

    suffix = " [Y/n]: " if default else " [y/N]: "
    while True:
        try:
            raw = input(paint(ui, "text", question + suffix)).strip().lower()
        except KeyboardInterrupt:
            print()
            raise
        if not raw:
            return default
        if raw in {"y", "yes"}:
            return True
        if raw in {"n", "no"}:
            return False
        print(paint(ui, "warning", "Please answer y or n."))


def build_preferred_audio_stem(info: dict) -> str:
    if not isinstance(info, dict):
        return ""

    track = first_non_empty(info.get("track"), info.get("title"))
    artist = first_non_empty(
        info.get("artist"),
        info.get("album_artist"),
        info.get("creator"),
        info.get("uploader"),
        info.get("channel"),
        info.get("artists"),
    )

    if not track:
        return ""

    if artist:
        track_l = track.lower()
        artist_l = artist.lower()
        if track_l == artist_l or track_l.startswith(artist_l + " - "):
            stem = track
        else:
            stem = f"{artist} - {track}"
    else:
        stem = track

    return sanitize_filename_component(stem)


def pick_best_square_thumbnail_url(info: dict) -> str | None:
    thumbs = info.get("thumbnails") or []
    best_url = None
    best_area = -1

    for thumb in thumbs:
        if not isinstance(thumb, dict):
            continue
        url = str(thumb.get("url") or "").strip()
        try:
            width = int(thumb.get("width") or 0)
            height = int(thumb.get("height") or 0)
        except Exception:
            width = 0
            height = 0

        if not url or not width or not height:
            continue

        ratio = width / height if height else 0.0
        if 0.94 <= ratio <= 1.06:
            area = width * height
            if area > best_area:
                best_area = area
                best_url = url

    return best_url


def download_url_to_file(url: str, dest: Path) -> bool:
    try:
        dest.parent.mkdir(parents=True, exist_ok=True)
        req = urllib.request.Request(url, headers={"User-Agent": f"{APP_NAME}/{VERSION}"})
        with urllib.request.urlopen(req, timeout=15) as resp:
            dest.write_bytes(resp.read())
        return True
    except Exception:
        return False


def embed_cover_with_ffmpeg(audio_path: Path, image_path: Path) -> bool:
    ffmpeg_bin = shutil.which("ffmpeg")
    if not ffmpeg_bin:
        return False

    tmp_out = audio_path.with_name(audio_path.stem + ".covertmp" + audio_path.suffix)
    cmd = [
        ffmpeg_bin,
        "-y",
        "-hide_banner",
        "-loglevel",
        "error",
        "-i",
        str(audio_path),
        "-i",
        str(image_path),
        "-map",
        "0:a:0",
        "-map",
        "1:0",
        "-c:a",
        "copy",
        "-c:v",
        "mjpeg",
        "-map_metadata",
        "0",
        "-id3v2_version",
        "3",
        "-metadata:s:v",
        "title=Album cover",
        "-metadata:s:v",
        "comment=Cover (front)",
        "-disposition:v:0",
        "attached_pic",
        str(tmp_out),
    ]

    try:
        proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
        if proc.returncode != 0 or not tmp_out.exists():
            try:
                tmp_out.unlink(missing_ok=True)
            except Exception:
                pass
            return False

        os.replace(tmp_out, audio_path)
        return True
    except Exception:
        try:
            tmp_out.unlink(missing_ok=True)
        except Exception:
            pass
        return False


def maybe_embed_square_cover(output_file: str, square_url: str | None, ui: dict, debug: bool = False) -> bool:
    if not output_file or not square_url:
        return False

    audio_path = Path(output_file)
    if not audio_path.exists():
        return False

    if shutil.which("ffmpeg") is None:
        if debug:
            print(paint(ui, "dim", "[debug] Square cover skip: ffmpeg not found."))
        return False

    try:
        with tempfile.TemporaryDirectory(prefix="yt-nerddl-cover-") as td:
            parsed = urllib.parse.urlparse(square_url)
            suffix = Path(parsed.path).suffix or ".jpg"
            image_path = Path(td) / f"cover{suffix}"

            if not download_url_to_file(square_url, image_path):
                if debug:
                    print(paint(ui, "dim", "[debug] Square cover download failed; keeping default thumbnail."))
                return False

            ok = embed_cover_with_ffmpeg(audio_path, image_path)
            if debug:
                if ok:
                    print(paint(ui, "dim", "[debug] Re-embedded square cover art."))
                else:
                    print(paint(ui, "dim", "[debug] Square cover embed failed; keeping default thumbnail."))
            return ok
    except Exception:
        if debug:
            print(paint(ui, "dim", "[debug] Square cover pass threw an exception; keeping default thumbnail."))
        return False


def maybe_rename_audio_output(
    output_file: str,
    info: dict,
    ui: dict,
    debug: bool = False,
    allow_overwrite: bool = False,
) -> str:
    if not output_file or not os.path.exists(output_file):
        return output_file

    preferred_stem = build_preferred_audio_stem(info)
    if not preferred_stem:
        return output_file

    current = Path(output_file)
    target = current.with_name(preferred_stem + current.suffix)

    if normalize_compare_path(str(current)) == normalize_compare_path(str(target)):
        return output_file

    if target.exists() and not allow_overwrite:
        if debug:
            print(
                paint(
                    ui,
                    "dim",
                    f"[debug] Pretty audio name already exists, keeping current path: {str(target)}",
                )
            )
        return output_file

    try:
        os.replace(current, target)
        if debug:
            print(paint(ui, "dim", f"[debug] Renamed audio output to: {str(target)}"))
        return str(target)
    except Exception:
        return output_file


def maybe_finalize_audio_output(
    output_file: str,
    primary_info: dict,
    fallback_info: dict,
    is_youtube_music: bool,
    ui: dict,
    debug: bool = False,
    allow_overwrite: bool = False,
) -> str:
    if not output_file or not os.path.exists(output_file):
        return output_file

    info = primary_info if isinstance(primary_info, dict) else {}
    fallback = fallback_info if isinstance(fallback_info, dict) else {}

    source_for_name = info if build_preferred_audio_stem(info) else fallback
    should_pretty_name = is_youtube_music or bool(
        first_non_empty(info.get("track"), info.get("artist"), fallback.get("track"), fallback.get("artist"))
    )

    if should_pretty_name:
        output_file = maybe_rename_audio_output(
            output_file,
            source_for_name,
            ui,
            debug=debug,
            allow_overwrite=allow_overwrite,
        )

    square_url = None
    if is_youtube_music:
        square_url = pick_best_square_thumbnail_url(info) or pick_best_square_thumbnail_url(fallback)

    if square_url:
        maybe_embed_square_cover(output_file, square_url, ui, debug=debug)

    return output_file


def build_single_output_candidates(info: dict, ytdl_opts: dict, is_audio: bool) -> list[Path]:
    if not isinstance(info, dict):
        return []

    try:
        tmp_opts = {k: v for k, v in ytdl_opts.items() if k not in {"progress_hooks", "postprocessor_hooks", "logger"}}
        tmp_opts.update({"quiet": True, "no_warnings": True, "logger": SilentLogger()})
        with yt_dlp.YoutubeDL(tmp_opts) as tmp_ydl:
            prepared = Path(tmp_ydl.prepare_filename(info))
    except Exception:
        return []

    candidates: list[Path] = []
    if is_audio:
        pretty_stem = build_preferred_audio_stem(info)
        if pretty_stem:
            candidates.append(prepared.with_name(pretty_stem + ".mp3"))
        candidates.extend(
            [
                prepared.with_suffix(".mp3"),
                prepared,
                prepared.with_suffix(".m4a"),
                prepared.with_suffix(".opus"),
                prepared.with_suffix(".ogg"),
                prepared.with_suffix(".flac"),
                prepared.with_suffix(".wav"),
            ]
        )
    else:
        if looks_like_media(info):
            candidates.extend(
                [
                    prepared.with_suffix(".mp4"),
                    prepared,
                    prepared.with_suffix(".mkv"),
                    prepared.with_suffix(".webm"),
                    prepared.with_suffix(".mov"),
                    prepared.with_suffix(".avi"),
                ]
            )
        else:
            candidates.append(prepared)

    out: list[Path] = []
    seen: set[str] = set()
    for p in candidates:
        full = Path(os.path.abspath(str(p)))
        key = normalize_compare_path(str(full))
        if key not in seen:
            seen.add(key)
            out.append(full)
    return out


def print_single_summary(
    ui: dict,
    *,
    title: str,
    output_file: str,
    is_audio: bool,
    quality_label: str,
    duration_seconds: float | int | None,
    total_elapsed: float,
    status_text: str | None = None,
) -> None:
    final_size_mb = (os.path.getsize(output_file) / (1024 * 1024)) if output_file and os.path.exists(output_file) else 0.0
    avg_speed = (final_size_mb / total_elapsed) if total_elapsed > 0 else 0.0
    mode_label = build_mode_label(output_file, is_audio)

    print()
    print(f"{paint(ui, 'accent', 'Title:')}    {paint(ui, 'text', title or 'Unknown')}")
    print(f"{paint(ui, 'accent', 'Mode:')}     {paint(ui, 'text', mode_label)}")
    print(f"{paint(ui, 'accent', 'Quality:')}  {paint(ui, 'text', quality_label)}")
    print(f"{paint(ui, 'accent', 'Length:')}   {paint(ui, 'text', human_time(duration_seconds))}")
    print(f"{paint(ui, 'accent', 'Size:')}     {paint(ui, 'text', f'{final_size_mb:.1f} MB')}")
    if status_text:
        print(f"{paint(ui, 'accent', 'Status:')}   {paint(ui, 'text', status_text)}")
    print()

    stats = f"{paint(ui, 'accent', ui['icons']['time'] + ' Time taken:')} {paint(ui, 'text', human_time(total_elapsed))}"
    if total_elapsed > 0:
        stats += f" | {paint(ui, 'accent', 'Avg:')} {paint(ui, 'text', f'{avg_speed:.2f} MB/s')}"
    print(stats)

    if output_file:
        print(paint(ui, "success", f"{ui['icons']['success']} Saved file: {paint(ui, 'text', output_file)}\n"))
    else:
        print(paint(ui, "warning", f"{ui['icons']['warning']} Download finished, but output path could not be resolved.\n"))


def read_key() -> str | None:
    if os.name == "nt":
        import msvcrt

        ch = msvcrt.getch()
        if ch in (b"\x03", b"\x04"):
            raise KeyboardInterrupt
        if ch in (b"\xe0", b"\x00"):
            ch2 = msvcrt.getch()
            if ch2 == b"H":
                return "up"
            if ch2 == b"P":
                return "down"
            return None
        if ch in (b"\r", b"\n"):
            return "enter"
        return ch.decode("utf-8", "ignore")

    import termios
    import tty

    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        ch = sys.stdin.read(1)
        if ch == "\x03":
            raise KeyboardInterrupt
        if ch == "\x1b":
            ch2 = sys.stdin.read(1)
            if ch2 == "[":
                ch3 = sys.stdin.read(1)
                if ch3 == "A":
                    return "up"
                if ch3 == "B":
                    return "down"
        if ch in ("\r", "\n"):
            return "enter"
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)


def menu_select(ui: dict, items: list[tuple[str, str]], header: str) -> str:
    if not items:
        raise ValueError("No menu items")

    if not ui.get("ansi", False) or not sys.stdin.isatty():
        print()
        print(paint(ui, "accent", header))
        for i, (label, _) in enumerate(items, 1):
            print(f"  {i}. {label}")
        while True:
            try:
                raw = input(paint(ui, "text", "Select: ")).strip()
            except KeyboardInterrupt:
                print()
                raise
            if raw.isdigit():
                idx = int(raw) - 1
                if 0 <= idx < len(items):
                    return items[idx][1]
            print(paint(ui, "warning", "Invalid choice. Try again."))

    idx = 0
    n = len(items)

    print()
    print(paint(ui, "accent", header))

    def draw():
        for i, (label, _) in enumerate(items):
            if i == idx:
                line = f"{paint(ui, 'success', '[✔]')} {paint(ui, 'success', label)}"
            else:
                line = f"{paint(ui, 'dim', '[ ]')} {paint(ui, 'dim', label)}"
            sys.stdout.write(line + "\n")
        sys.stdout.flush()

    draw()

    while True:
        try:
            key = read_key()
        except KeyboardInterrupt:
            print()
            raise

        for _ in range(n):
            sys.stdout.write(CURSOR_PREV_LINE + CLEAR_LINE)

        if key == "up" and idx > 0:
            idx -= 1
        elif key == "down" and idx < n - 1:
            idx += 1
        elif key == "enter":
            label, payload = items[idx]
            print(paint(ui, "success", f"Selected {label}"))
            return payload

        draw()


class SilentLogger:
    def debug(self, *a, **k):
        pass

    def info(self, *a, **k):
        pass

    def warning(self, *a, **k):
        pass

    def error(self, *a, **k):
        print(*a, **k)


def check_internet(host: str = "youtube.com") -> bool:
    targets: list[str] = []
    host = (host or "").strip()
    if host:
        targets.append(host)
    if "youtube.com" not in targets:
        targets.append("youtube.com")

    for target in targets:
        try:
            socket.create_connection((target, 443), timeout=3)
            return True
        except Exception:
            continue
    return False


_YT_HOSTS = {
    "youtube.com",
    "www.youtube.com",
    "m.youtube.com",
    "music.youtube.com",
    "youtu.be",
}


def _netloc(url: str) -> str:
    try:
        parts = urllib.parse.urlparse(url)
        host = parts.netloc
        if not host and parts.path and "://" not in url:
            parts = urllib.parse.urlparse("https://" + url)
            host = parts.netloc
        host = (host or "").lower()
        if ":" in host:
            host = host.split(":", 1)[0]
        return host
    except Exception:
        return ""


def detect_service_label(original_url: str) -> tuple[str, str, bool]:
    host = _netloc(original_url)
    if host == "music.youtube.com":
        return ("YouTube Music", host, True)
    if host in {"youtube.com", "www.youtube.com", "m.youtube.com", "youtu.be"}:
        return ("YouTube", host, True)
    if host:
        return (host, host, host in _YT_HOSTS)
    return ("this site", "", False)


def looks_like_media(info: dict) -> bool:
    if str(info.get("_type") or "").lower() in {"playlist", "multi_video"}:
        return True

    fmts = info.get("formats")
    if isinstance(fmts, list) and fmts:
        return True

    if info.get("duration"):
        return True

    ext = str(info.get("ext") or "").lower()
    if ext in AUDIO_EXTS or ext in VIDEO_EXTS:
        return True

    return False


VIDEO_PRESETS: list[dict] = [
    {
        "key": "144p",
        "label": "144p",
        "selector": "bestvideo[height<=144][fps<=30]+bestaudio/best",
        "height_mode": ("cap", 144),
        "fps_mode": ("cap", 30),
    },
    {
        "key": "240p",
        "label": "240p",
        "selector": "bestvideo[height<=240][fps<=30]+bestaudio/best",
        "height_mode": ("cap", 240),
        "fps_mode": ("cap", 30),
    },
    {
        "key": "360p",
        "label": "360p",
        "selector": "bestvideo[height<=360][fps<=30]+bestaudio/best",
        "height_mode": ("cap", 360),
        "fps_mode": ("cap", 30),
    },
    {
        "key": "480p",
        "label": "480p",
        "selector": "bestvideo[height<=480][fps<=30]+bestaudio/best",
        "height_mode": ("cap", 480),
        "fps_mode": ("cap", 30),
    },
    {
        "key": "720p30",
        "label": "720p (30fps)",
        "selector": "bestvideo[height<=720][fps<=30]+bestaudio/best",
        "height_mode": ("cap", 720),
        "fps_mode": ("cap", 30),
    },
    {
        "key": "720p60",
        "label": "720p (60fps)",
        "selector": "bestvideo[height<=720][fps>30]+bestaudio/best",
        "height_mode": ("cap", 720),
        "fps_mode": ("min", 31),
    },
    {
        "key": "1080p30",
        "label": "1080p (30fps)",
        "selector": "bestvideo[height<=1080][fps<=30]+bestaudio/best",
        "height_mode": ("cap", 1080),
        "fps_mode": ("cap", 30),
    },
    {
        "key": "1080p60",
        "label": "1080p (60fps)",
        "selector": "bestvideo[height<=1080][fps>30]+bestaudio/best",
        "height_mode": ("cap", 1080),
        "fps_mode": ("min", 31),
    },
    {
        "key": "1440p60",
        "label": "1440p (60fps)",
        "selector": "bestvideo[height<=1440][fps>30]+bestaudio/best",
        "height_mode": ("cap", 1440),
        "fps_mode": ("min", 31),
    },
    {
        "key": "2160p60",
        "label": "2160p / 4K (60fps)",
        "selector": "bestvideo[height>=2160][fps>30]+bestaudio/best",
        "height_mode": ("min", 2160),
        "fps_mode": ("min", 31),
    },
    {
        "key": "best",
        "label": "Best available",
        "selector": "bestvideo+bestaudio/best",
        "height_mode": None,
        "fps_mode": None,
    },
]

VIDEO_PRESET_BY_KEY = {p["key"]: p for p in VIDEO_PRESETS}


def normalize_quality_key(s: str) -> str:
    s = (s or "").strip().lower()
    s = s.replace(" ", "")
    s = s.replace("fps", "")
    if s in {"720p", "720"}:
        return "720p30"
    if s in {"1080p", "1080"}:
        return "1080p30"
    if s in {"1440p", "1440"}:
        return "1440p60"
    if s in {"2160p", "2160", "4k"}:
        return "2160p60"
    if s in {"max", "highest"}:
        return "best"
    return s


def video_preset_available(preset: dict, formats: list[dict]) -> bool:
    if not formats:
        return True
    if preset.get("key") == "best":
        return True

    hmode = preset.get("height_mode")
    fmode = preset.get("fps_mode")

    for f in formats:
        vcodec = f.get("vcodec")
        if not vcodec or vcodec == "none":
            continue

        h = f.get("height") or 0
        fps = f.get("fps") or 0
        if not h:
            continue

        ok = True
        if hmode:
            kind, val = hmode
            if kind == "cap" and not (h <= val):
                ok = False
            elif kind == "min" and not (h >= val):
                ok = False

        if ok and fmode:
            kind, val = fmode
            if kind == "cap" and not (fps <= val):
                ok = False
            elif kind == "min" and not (fps >= val):
                ok = False

        if ok:
            return True

    return False


def self_update(ui: dict, script_path: Path, url: str) -> int:
    print(paint(ui, "accent", "Updating yt-nerddl…"))
    try:
        req = urllib.request.Request(url, headers={"User-Agent": f"{APP_NAME}/{VERSION}"})
        with urllib.request.urlopen(req, timeout=15) as resp:
            new_code = resp.read()

        if b"yt-nerddl" not in new_code or b"import yt_dlp" not in new_code:
            print(paint(ui, "error", "Refusing update: downloaded file doesn't look like yt-nerddl.py"))
            return 1

        fd, tmp_path = tempfile.mkstemp(prefix="yt-nerddl-", suffix=".py")
        os.close(fd)
        tmp = Path(tmp_path)
        tmp.write_bytes(new_code)

        try:
            os.replace(tmp, script_path)
        except Exception as e:
            print(paint(ui, "warning", f"Auto-replace failed: {e}"))
            print(paint(ui, "warning", f"New file saved to: {str(tmp)}"))
            print(paint(ui, "text", f"Manually replace: {str(script_path)}"))
            return 1

        if os.name != "nt":
            try:
                mode = script_path.stat().st_mode
                script_path.chmod(mode | 0o111)
            except Exception:
                pass

        print(paint(ui, "success", "✔ Update complete."))
        return 0

    except Exception as e:
        print(paint(ui, "error", f"Update failed: {e}"))
        return 1


class SmartHelpFormatter(argparse.RawTextHelpFormatter):
    pass


def build_parser() -> argparse.ArgumentParser:
    epilog = f"""\
Tested only on:
  • YouTube
  • YouTube Music

Config path defaults:
  Linux/macOS: ~/.config/yt-nerddl/config.toml
  Windows:     %APPDATA%\\yt-nerddl\\config.toml

Notes:
  • Other URLs are passed through yt-dlp and may download arbitrary hosted files.
  • If downloads.output_directory is still the default, non-YouTube URLs fall back to ~/Videos.
  • ffmpeg is strongly recommended (and required for many merges/conversions).

Mature / private / age-restricted guide:
  {MATURE_CONTENT_URL}

Examples:
  yt-nerddl -q https://www.youtube.com/watch?v=xxxx
  yt-nerddl --no-playlist https://www.youtube.com/watch?v=xxxx&list=yyyy
  yt-nerddl -a -c firefox https://music.youtube.com/watch?v=xxxx
  yt-nerddl --debug -y https://youtu.be/xxxx
"""

    parser = argparse.ArgumentParser(
        prog="yt-nerddl",
        description="yt-dlp wrapper — clean UX, interactive selector, config + themes.\nTested only on YouTube and YouTube Music.",
        formatter_class=SmartHelpFormatter,
        epilog=epilog,
    )

    parser.add_argument("url", nargs="?", help="URL to download")

    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("-a", "--audio", action="store_true", help="Download audio only (converted to MP3)")
    mode.add_argument("--video", action="store_true", help="Force video mode")

    parser.add_argument("-q", "--quality", action="store_true", help="Interactive quality / bitrate selector")
    parser.add_argument("-H", "--high", action="store_true", help="Download highest available video quality")
    parser.add_argument("--no-playlist", action="store_true", help="If given a playlist URL, download only the current video")

    parser.add_argument(
        "-o",
        "--output",
        help="Output directory override (if left at default, non-YouTube URLs fall back to ~/Videos)",
    )

    cookies_help = (
        "Use browser cookies (for age-restricted / logged-in content)\n"
        "Examples: firefox, chrome, brave, edge, opera, safari"
    )
    parser.add_argument("-c", "--cookies", metavar="BROWSER", help=cookies_help)
    parser.add_argument("--no-cookies", action="store_true", help="Disable cookies even if enabled in config")

    parser.add_argument(
        "-y",
        "--yes",
        action="store_true",
        help="Skip prompts/menus and use defaults/config; existing files are kept by default",
    )
    parser.add_argument(
        "--debug",
        action="store_true",
        help="Print detected service, extractor, selected format selector, and a readable yt-dlp option dump",
    )

    parser.add_argument("--theme", metavar="NAME", help="Theme override for this run")
    parser.add_argument("--theme-preview", action="store_true", help="List installed themes + preview")
    parser.add_argument("--no-icons", action="store_true", help="Disable icons for this run")
    parser.add_argument("--no-colors", action="store_true", help="Disable ANSI colors for this run")

    parser.add_argument("--config", metavar="PATH", help="Use a custom config.toml path")
    parser.add_argument("--init-config", action="store_true", help="Create config + bundled themes and exit")

    parser.add_argument("-U", "--update", action="store_true", help="Self-update from GitHub (same as --upgrade)")
    parser.add_argument("--upgrade", action="store_true", help="Self-update from GitHub (same as --update)")

    parser.add_argument("-v", "--version", action="store_true", help="Show version and exit")

    return parser


def theme_preview(ui: dict, config_dir: Path) -> int:
    files = find_theme_files(config_dir)
    names = sorted(files.keys())

    print()
    print(paint(ui, "accent", "Available themes:"))
    if not names:
        print(paint(ui, "warning", "No theme files found (unexpected)."))
        return 1

    if not ui.get("ansi", False):
        for n in names:
            print(f"  - {n}")
        return 0

    for name in names:
        data = load_toml_file(files[name])
        preview_ui = build_ui(data, {"colors": True, "icons": True, "progress_bar_width": 20})
        bar = preview_ui["fill"] * 10 + preview_ui["empty"] * 10
        line = (
            f"  {paint(preview_ui, 'accent', name):<18} "
            f"{paint(preview_ui, 'success', preview_ui['icons']['success'])} "
            f"{paint(preview_ui, 'warning', preview_ui['icons']['warning'])} "
            f"{paint(preview_ui, 'accent', preview_ui['icons']['youtube'])} "
            f"{paint(preview_ui, 'text', bar)}"
        )
        print(line)

    print()
    print(paint(ui, "dim", "Tip: set [ui].theme in config.toml or use --theme <name>"))
    return 0


def _safe_pformat(obj: object) -> str:
    return pprint.pformat(obj, width=110, sort_dicts=True, compact=False)


def redact_ytdl_opts(opts: dict) -> dict:
    safe = dict(opts)
    if "logger" in safe:
        safe["logger"] = "<SilentLogger>"
    if "progress_hooks" in safe and isinstance(safe["progress_hooks"], list):
        safe["progress_hooks"] = [f"<progress_hook #{i + 1}>" for i in range(len(safe["progress_hooks"]))]
    if "postprocessor_hooks" in safe and isinstance(safe["postprocessor_hooks"], list):
        safe["postprocessor_hooks"] = [f"<postprocessor_hook #{i + 1}>" for i in range(len(safe["postprocessor_hooks"]))]
    return safe


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()

    if args.version:
        print(f"{APP_NAME} version {VERSION}")
        return 0

    if args.config:
        config_path = Path(expand_path(args.config))
        config_dir = config_path.parent
    else:
        config_dir = get_default_config_dir()
        config_path = config_dir / "config.toml"

    created = init_config_and_themes(config_path)

    cfg = deep_merge(copy.deepcopy(DEFAULTS), load_toml_file(config_path))

    if args.output:
        cfg["downloads"]["output_directory"] = args.output

    if args.cookies:
        cfg["cookies"]["enabled"] = True
        cfg["cookies"]["browser"] = args.cookies

    if args.no_cookies:
        cfg["cookies"]["enabled"] = False

    if args.theme:
        cfg["ui"]["theme"] = args.theme

    if args.no_icons:
        cfg["ui"]["icons"] = False
    if args.no_colors:
        cfg["ui"]["colors"] = False

    theme_name = str(cfg.get("ui", {}).get("theme", "default"))
    theme_data = load_theme_data(theme_name, config_dir)
    ui = build_ui(theme_data, cfg.get("ui", {}))

    if args.init_config:
        print(paint(ui, "accent", "Config initialized."))
        print(paint(ui, "text", f"Config:  {str(config_path)}"))
        print(paint(ui, "text", f"Themes:  {str(config_dir / 'themes')}"))
        return 0

    if (created.get("config") or created.get("themes")) and sys.stdout.isatty():
        msg = []
        if created.get("config"):
            msg.append(f"created {config_path.name}")
        if created.get("themes"):
            msg.append("bundled themes")
        print(paint(ui, "dim", f"[init] {', '.join(msg)} in {str(config_dir)}"))
        print()

    if args.theme_preview:
        return theme_preview(ui, config_dir)

    if args.update or args.upgrade:
        script_path = Path(__file__).resolve()
        return self_update(ui, script_path, UPDATE_URL)

    url = args.url
    if not url:
        banner = f"[{ui['icons']['youtube']} {APP_NAME}]"
        print(paint(ui, "accent", banner) + " " + paint(ui, "text", "Interactive URL prompt"))
        try:
            url = input(paint(ui, "warning", "Enter URL: ") if ui["colors_enabled"] else "Enter URL: ").strip()
        except KeyboardInterrupt:
            print()
            print(paint(ui, "error", f"{ui['icons']['warning']} Interrupted. Exiting."))
            return 1
        if not url:
            print(paint(ui, "warning", f"{ui['icons']['warning']} No URL provided. Exiting."))
            return 0

    original_url = url
    is_youtube_music_source = "music.youtube.com" in (url or "").lower()
    service_label, service_host, is_youtube_family = detect_service_label(url)

    if "music.youtube.com" in url:
        url = url.replace("music.youtube.com", "www.youtube.com")

    if bool(cfg.get("behavior", {}).get("check_internet", True)):
        if not check_internet(service_host or "youtube.com"):
            host_label = service_label if service_label != "this site" else (service_host or "internet")
            print(paint(ui, "error", f"{ui['icons']['warning']} Offline or cannot reach {host_label}. Exiting."))
            return 1

    mode_cfg = str(cfg.get("downloads", {}).get("mode", "video")).strip().lower()
    if args.audio:
        mode_cfg = "audio"
    if args.video:
        mode_cfg = "video"
    if mode_cfg not in {"audio", "video"}:
        mode_cfg = "video"

    assume_yes = bool(cfg.get("behavior", {}).get("assume_yes", False)) or bool(args.yes)

    playlist_mode = str(cfg.get("behavior", {}).get("playlist", "ask")).strip().lower()
    if playlist_mode not in {"ask", "video", "playlist"}:
        playlist_mode = "ask"

    force_no_playlist = bool(args.no_playlist)
    download_playlist = False
    is_playlist_url = ("list=" in url) or ("/playlist" in url)

    if is_playlist_url:
        if force_no_playlist:
            download_playlist = False
        elif playlist_mode == "playlist":
            download_playlist = True
        elif playlist_mode == "video":
            download_playlist = False
        else:
            if assume_yes:
                download_playlist = False
                print(paint(ui, "dim", "[yes] Playlist detected; skipping prompt → single video"))
            else:
                try:
                    choice = menu_select(
                        ui,
                        [
                            ("Download entire playlist", "playlist"),
                            ("Download single video", "video"),
                        ],
                        "Playlist detected:",
                    )
                except KeyboardInterrupt:
                    print(paint(ui, "error", f"{ui['icons']['warning']} Interrupted. Exiting."))
                    return 1
                download_playlist = choice == "playlist"

        if not download_playlist:
            parts = urllib.parse.urlparse(url)
            q = urllib.parse.parse_qs(parts.query)
            if "v" in q and q["v"]:
                url = f"https://www.youtube.com/watch?v={q['v'][0]}"
            else:
                if force_no_playlist:
                    print(paint(ui, "error", f"{ui['icons']['warning']} --no-playlist was given, but this URL has no ?v= video id."))
                    print(paint(ui, "text", "Use a watch URL with ?v=... or remove --no-playlist."))
                    return 1
                if assume_yes:
                    download_playlist = True
                    print(paint(ui, "dim", "[yes] Playlist URL without v=; forcing playlist download"))
                else:
                    print(paint(ui, "error", f"{ui['icons']['warning']} This looks like a playlist URL without a video id."))
                    print(paint(ui, "text", "Provide a watch URL (with ?v=) or set playlist=\"playlist\" in config."))
                    return 1

    raw_output_dir = str(cfg.get("downloads", {}).get("output_directory", DEFAULT_YOUTUBE_OUTPUT_DIR))
    target_dir, used_service_default = choose_output_directory(raw_output_dir, is_youtube_family, bool(args.output))
    os.makedirs(target_dir, exist_ok=True)

    if used_service_default:
        print(paint(ui, "dim", f"[site] Non-YouTube URL + default output dir → {target_dir}"))

    cookies_enabled = bool(cfg.get("cookies", {}).get("enabled", False))
    cookies_browser = str(cfg.get("cookies", {}).get("browser", "firefox")).strip()

    probe_opts = {
        "quiet": True,
        "no_warnings": True,
        "logger": SilentLogger(),
        "noplaylist": not download_playlist,
        "extractor_args": {"youtube": {"client": ["android"]}},
    }
    if cookies_enabled:
        probe_opts["cookiesfrombrowser"] = (cookies_browser,)

    try:
        with yt_dlp.YoutubeDL(probe_opts) as probe_ydl:
            info = probe_ydl.extract_info(url, download=False)
    except KeyboardInterrupt:
        print()
        print(paint(ui, "error", f"{ui['icons']['warning']} Interrupted. Exiting."))
        return 1
    except Exception as e:
        print()
        print(paint(ui, "error", f"{ui['icons']['warning']} Failed to fetch info: {e}"))
        return 1

    extractor_key = str(info.get("extractor_key") or info.get("extractor") or "").strip()
    if not is_youtube_family:
        print(paint(ui, "warning", f"{ui['icons']['warning']} Non-YouTube URL detected ({service_host or service_label})."))
        print(paint(ui, "dim", "yt-nerddl is only tested on YouTube + YouTube Music. Other sites are at your own risk.\n"))

    if extractor_key.lower() == "generic" or not looks_like_media(info):
        print(paint(ui, "warning", f"{ui['icons']['warning']} This URL may not be a media page."))
        print(paint(ui, "dim", "yt-dlp can download arbitrary hosted files; double-check what you’re fetching.\n"))

    formats = info.get("formats", []) or []

    interactive = bool(cfg.get("behavior", {}).get("interactive", False))
    want_menu = (bool(args.quality) or interactive) and (not assume_yes)

    selected_quality_label = "auto"
    ytdl_format = None
    postprocessors = None

    if mode_cfg == "audio":
        audio_bitrate_cfg = cfg.get("downloads", {}).get("audio_bitrate", 320)
        if isinstance(audio_bitrate_cfg, str):
            audio_bitrate_cfg = audio_bitrate_cfg.strip().lower()

        chosen = None
        audio_items = [
            ("320kbps", "320"),
            ("256kbps", "256"),
            ("192kbps", "192"),
            ("128kbps", "128"),
            ("Best", "best"),
        ]

        if want_menu:
            try:
                chosen = menu_select(ui, audio_items, "Select audio quality:")
            except KeyboardInterrupt:
                print(paint(ui, "error", f"{ui['icons']['warning']} Interrupted. Exiting."))
                return 1
        else:
            if audio_bitrate_cfg in {"best"}:
                chosen = "best"
            else:
                try:
                    chosen = str(int(audio_bitrate_cfg))
                except Exception:
                    chosen = "320"

        selected_quality_label = f"{chosen}kbps" if chosen != "best" else "Best audio"
        ytdl_format = "bestaudio/best"

        prefq = "0" if chosen == "best" else str(chosen)
        postprocessors = [
            {
                "key": "FFmpegExtractAudio",
                "preferredcodec": "mp3",
                "preferredquality": prefq,
            },
            {"key": "FFmpegMetadata"},
            {"key": "EmbedThumbnail"},
        ]

    else:
        if args.high:
            ytdl_format = "bestvideo+bestaudio/best"
            selected_quality_label = "Best available"
        else:
            quality_cfg = normalize_quality_key(str(cfg.get("downloads", {}).get("quality", "1080p30")))
            available = [p for p in VIDEO_PRESETS if video_preset_available(p, formats)]
            if not any(p["key"] == "best" for p in available):
                available.append(VIDEO_PRESET_BY_KEY["best"])

            if want_menu:
                items = [(p["label"], p["key"]) for p in available]
                try:
                    chosen_key = menu_select(ui, items, "Select video quality:")
                except KeyboardInterrupt:
                    print(paint(ui, "error", f"{ui['icons']['warning']} Interrupted. Exiting."))
                    return 1
            else:
                if any(p["key"] == quality_cfg for p in available):
                    chosen_key = quality_cfg
                else:
                    fallback_order = [quality_cfg, "1080p30", "720p30", "480p", "360p", "best"]
                    chosen_key = next((k for k in fallback_order if any(p["key"] == k for p in available)), "best")

            preset = VIDEO_PRESET_BY_KEY.get(chosen_key, VIDEO_PRESET_BY_KEY["best"])
            ytdl_format = preset["selector"]
            selected_quality_label = preset["label"]

    is_audio = mode_cfg == "audio"

    if download_playlist:
        outtmpl = os.path.join(target_dir, "%(playlist_title)s", "%(playlist_index)03d - %(title)s.%(ext)s")
    else:
        outtmpl = os.path.join(target_dir, "%(title)s.%(ext)s")

    net_cfg = cfg.get("network", {}) if isinstance(cfg.get("network"), dict) else {}
    continuedl = bool(net_cfg.get("continuedl", True))
    try:
        retries = int(net_cfg.get("retries", 10))
    except Exception:
        retries = 10
    try:
        fragment_retries = int(net_cfg.get("fragment_retries", 10))
    except Exception:
        fragment_retries = 10

    ytdl_opts = {
        "outtmpl": outtmpl,
        "quiet": True,
        "no_warnings": True,
        "logger": SilentLogger(),
        "noplaylist": not download_playlist,
        "format": ytdl_format,
        "extractor_args": {"youtube": {"client": ["android"]}},
        "progress_hooks": [],
        "postprocessor_hooks": [],
        "continuedl": continuedl,
        "retries": max(0, retries),
        "fragment_retries": max(0, fragment_retries),
        "file_access_retries": max(3, retries),
    }

    if cookies_enabled:
        ytdl_opts["cookiesfrombrowser"] = (cookies_browser,)

    if not is_audio:
        ytdl_opts["merge_output_format"] = "mp4"

    if postprocessors:
        ytdl_opts["postprocessors"] = postprocessors

    if is_audio:
        ytdl_opts["writethumbnail"] = True

    existing_targets: list[Path] = []
    overwrite_existing = False
    skip_existing_download = False
    skip_existing_status = ""

    if not download_playlist:
        existing_targets = [p for p in build_single_output_candidates(info, ytdl_opts, is_audio) if p.exists()]
        if existing_targets:
            if assume_yes:
                skip_existing_download = True
                skip_existing_status = "Existing file kept; --yes defaults to no overwrite."
            else:
                print(paint(ui, "warning", f"{ui['icons']['warning']} File already exists: {str(existing_targets[0])}"))
                try:
                    overwrite_existing = ask_yes_no(ui, "Overwrite it?", default=False)
                except KeyboardInterrupt:
                    print(paint(ui, "error", f"{ui['icons']['warning']} Interrupted. Exiting."))
                    return 1

                if not overwrite_existing:
                    skip_existing_download = True
                    skip_existing_status = "Existing file kept; overwrite declined."

    ytdl_opts["overwrites"] = overwrite_existing

    if args.debug:
        print()
        print(paint(ui, "dim", "[debug] Detected service: ") + paint(ui, "text", service_label))
        if service_host:
            print(paint(ui, "dim", "[debug] Host: ") + paint(ui, "text", service_host))
        if extractor_key:
            print(paint(ui, "dim", "[debug] Extractor: ") + paint(ui, "text", extractor_key))
        print(paint(ui, "dim", "[debug] Mode: ") + paint(ui, "text", mode_cfg))
        print(paint(ui, "dim", "[debug] Playlist download: ") + paint(ui, "text", str(download_playlist)))
        print(paint(ui, "dim", "[debug] Selected quality: ") + paint(ui, "text", selected_quality_label))
        print(paint(ui, "dim", "[debug] Format selector: ") + paint(ui, "text", str(ytdl_format)))
        if existing_targets:
            print(
                paint(ui, "dim", "[debug] Existing output candidates:\n")
                + paint(ui, "text", _safe_pformat([str(p) for p in existing_targets]))
            )
            print(paint(ui, "dim", "[debug] Overwrite chosen: ") + paint(ui, "text", str(overwrite_existing)))
        print(paint(ui, "dim", "[debug] yt-dlp opts:\n") + paint(ui, "text", _safe_pformat(redact_ytdl_opts(ytdl_opts))))
        print()

    if skip_existing_download:
        existing_file = str(existing_targets[0]) if existing_targets else ""
        print(paint(ui, "accent", f"{ui['icons']['youtube']} Using existing file from {service_label}…"))
        print_single_summary(
            ui,
            title=str(info.get("title") or Path(existing_file).stem or "Unknown"),
            output_file=existing_file,
            is_audio=is_audio,
            quality_label=selected_quality_label,
            duration_seconds=info.get("duration") or 0,
            total_elapsed=0.0,
            status_text=skip_existing_status,
        )
        if args.debug:
            print(paint(ui, "dim", "[debug] Resolved output file: ") + paint(ui, "text", existing_file or "<none>"))
        return 0

    if shutil.which("ffmpeg") is None:
        print(paint(ui, "dim", "[note] ffmpeg not found in PATH — merging/conversion may fail."))

    format_kind_by_id: dict[str, str] = {}
    for f in formats:
        fid = f.get("format_id")
        if not fid:
            continue
        fid = str(fid)
        vcodec = f.get("vcodec")
        acodec = f.get("acodec")
        has_video = bool(vcodec and vcodec != "none")
        has_audio = bool(acodec and acodec != "none")
        if has_video:
            kind = "Video"
        elif has_audio:
            kind = "Audio"
        else:
            kind = "Data"
        format_kind_by_id[fid] = kind

    FORMAT_ID_FROM_NAME = re.compile(r"\.f(?P<id>[^.\\/]+)\.")

    def extract_format_id_from_name(name: str) -> str | None:
        if not name:
            return None
        m = FORMAT_ID_FROM_NAME.search(name)
        if not m:
            return None
        return m.group("id")

    start_time = None
    did_download_work = False
    bar_width = int(ui.get("bar_width", 25))
    fill = ui.get("fill", "▰")
    empty = ui.get("empty", "▱")

    def infer_stream_label(d: dict) -> str:
        if is_audio:
            return "Audio"

        fmt_id = d.get("format_id")
        info_dict = d.get("info_dict") if isinstance(d.get("info_dict"), dict) else {}

        if not fmt_id and info_dict:
            fmt_id = info_dict.get("format_id")

        name = str(d.get("tmpfilename") or d.get("filename") or "")
        parsed = extract_format_id_from_name(name)
        if parsed:
            fmt_id = parsed

        if fmt_id is not None:
            kind = format_kind_by_id.get(str(fmt_id))
            if kind in {"Video", "Audio"}:
                return kind

        ext = str(info_dict.get("ext") or "").lower().lstrip(".")
        if not ext:
            ext = Path(name).suffix.lower().lstrip(".")
            if ext == "part":
                ext = Path(Path(name).stem).suffix.lower().lstrip(".")

        return label_from_extension(ext, default="Video")

    def progress_hook(d: dict):
        nonlocal start_time, did_download_work
        status = d.get("status")

        if status == "downloading":
            did_download_work = True
            if start_time is None:
                start_time = time.time()

            total = d.get("total_bytes") or d.get("total_bytes_estimate") or 0
            done = d.get("downloaded_bytes", 0)

            percent = (done / total * 100) if total else 0.0
            filled = int(percent / 100 * bar_width)
            bar = (
                paint(ui, "success", fill * filled) if ui["colors_enabled"] else (fill * filled)
            ) + (empty * (bar_width - filled))

            speed = d.get("speed") or 0.0
            eta = d.get("eta") or 0

            size_done = done / 1024 / 1024
            size_total = (total / 1024 / 1024) if total else 0.0
            speed_mb = speed / 1024 / 1024

            sys.stdout.write(
                f"\r{infer_stream_label(d)} {bar} {percent:5.1f}% | "
                f"{size_done:.1f}/{size_total:.1f} MB | "
                f"{speed_mb:.2f} MB/s ETA {human_time(eta)}"
            )
            sys.stdout.flush()

        elif status == "finished":
            did_download_work = True
            sys.stdout.write("\n")
            sys.stdout.flush()

    ytdl_opts["progress_hooks"].append(progress_hook)

    final_path_from_pp: str | None = None

    def pp_hook(d: dict):
        nonlocal final_path_from_pp, did_download_work
        if not isinstance(d, dict):
            return
        if d.get("status") != "finished":
            return

        did_download_work = True
        info_dict = d.get("info_dict")
        if not isinstance(info_dict, dict):
            return

        for key in ("filepath", "_filename", "filename"):
            val = info_dict.get(key)
            if isinstance(val, str) and val:
                final_path_from_pp = val

        req = info_dict.get("requested_downloads")
        if isinstance(req, list):
            for r in req:
                if isinstance(r, dict):
                    fp = r.get("filepath")
                    if isinstance(fp, str) and fp:
                        final_path_from_pp = fp

    ytdl_opts["postprocessor_hooks"].append(pp_hook)

    try:
        print(paint(ui, "accent", f"{ui['icons']['youtube']} Fetching from {service_label}…"))
        print()

        download_session_start = time.time()

        with yt_dlp.YoutubeDL(ytdl_opts) as ydl:
            result = ydl.extract_info(url)
            total_elapsed = (time.time() - start_time) if start_time else (time.time() - download_session_start)

            if download_playlist:
                title = result.get("title") or result.get("playlist_title") or "Playlist"
                entries = result.get("entries") or []
                try:
                    count = len([e for e in entries if e])
                except Exception:
                    count = 0

                print()
                print(f"{paint(ui, 'accent', 'Title:')}    {paint(ui, 'text', title)}")
                print(f"{paint(ui, 'accent', 'Mode:')}     {paint(ui, 'text', 'Audio (mp3)' if is_audio else 'Video')}")
                print(f"{paint(ui, 'accent', 'Quality:')}  {paint(ui, 'text', selected_quality_label)}")
                if count:
                    print(f"{paint(ui, 'accent', 'Items:')}    {paint(ui, 'text', str(count))}")
                print(f"{paint(ui, 'accent', 'Output:')}   {paint(ui, 'text', target_dir)}")
                print()
                print(f"{paint(ui, 'accent', ui['icons']['time'] + ' Time taken:')} {paint(ui, 'text', human_time(total_elapsed))}")
                print(paint(ui, "success", f"{ui['icons']['success']} Done.\n"))
                return 0

            def resolve_final_file() -> str:
                candidates: list[str] = []

                if final_path_from_pp:
                    candidates.append(final_path_from_pp)

                for key in ("filepath", "_filename"):
                    v = result.get(key)
                    if isinstance(v, str) and v:
                        candidates.append(v)

                req = result.get("requested_downloads")
                if isinstance(req, list):
                    for r in req:
                        if isinstance(r, dict):
                            fp = r.get("filepath")
                            if isinstance(fp, str) and fp:
                                candidates.append(fp)

                try:
                    candidates.append(ydl.prepare_filename(result))
                except Exception:
                    pass

                if is_audio:
                    exts = [".mp3", ".m4a", ".opus", ".ogg", ".aac", ".flac", ".wav", ".webm"]
                else:
                    exts = [".mp4", ".mkv", ".webm", ".mov", ".avi", ".flv"]

                expanded: list[str] = []
                for c in candidates:
                    expanded.append(c)
                    p = Path(c)
                    for ext in exts:
                        try:
                            expanded.append(str(p.with_suffix(ext)))
                        except Exception:
                            pass

                for p in expanded:
                    if p and os.path.exists(p):
                        return p

                return expanded[0] if expanded else ""

            output_file = resolve_final_file()
            title = str(result.get("title") or info.get("title") or "Unknown")
            duration_seconds = result.get("duration") or info.get("duration") or 0

            should_finalize_audio = bool(
                is_audio
                and output_file
                and os.path.exists(output_file)
                and (did_download_work or overwrite_existing or not existing_targets)
            )

            if should_finalize_audio:
                output_file = maybe_finalize_audio_output(
                    output_file,
                    result,
                    info,
                    is_youtube_music_source,
                    ui,
                    debug=args.debug,
                    allow_overwrite=overwrite_existing,
                )

            print_single_summary(
                ui,
                title=title,
                output_file=output_file,
                is_audio=is_audio,
                quality_label=selected_quality_label,
                duration_seconds=duration_seconds,
                total_elapsed=total_elapsed,
            )

            if args.debug:
                print(paint(ui, "dim", "[debug] Resolved output file: ") + paint(ui, "text", output_file or "<none>"))

            return 0

    except KeyboardInterrupt:
        print()
        print(paint(ui, "error", f"{ui['icons']['warning']} Download interrupted. Exiting."))
        return 1
    except yt_dlp.utils.DownloadError:
        print()
        print(paint(ui, "error", f"{ui['icons']['warning']} Download failed! Check URL or connection."))
        return 1
    except Exception as e:
        print()
        print(paint(ui, "error", f"{ui['icons']['warning']} Unexpected error: {e}"))
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
