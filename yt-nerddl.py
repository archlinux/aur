#!/usr/bin/env python3

import yt_dlp
import sys
import os
import time
import socket
import argparse
import urllib.parse
import termios
import tty
from datetime import timedelta

# -------------------------
# tiny preamble
# -------------------------
print("")  # blank line before anything

# -------------------------
# colors
# -------------------------
RESET = "\033[0m"
BRIGHT_RED = "\033[1;31m"
BRIGHT_GREEN = "\033[1;32m"
BRIGHT_YELLOW = "\033[1;33m"
BRIGHT_CYAN = "\033[1;36m"
BRIGHT_WHITE = "\033[1;37m"
DIM = "\033[2m"
CLEAR_LINE = "\033[2K"

# -------------------------
# progress bar stuff
# -------------------------
FILL = "▰"
EMPTY = "▱"
BAR_WIDTH = 25

# -------------------------
# Arg parsing (help colored)
# -------------------------
class ColorHelpFormatter(argparse.RawTextHelpFormatter):
    def start_section(self, heading):
        heading = f"{BRIGHT_CYAN}{heading}:{RESET}"
        super().start_section(heading)
    def _format_action(self, action):
        parts = super()._format_action(action)
        return parts.replace(action.help or '', f"{BRIGHT_WHITE}{action.help}{RESET}")

desc = f"{BRIGHT_YELLOW}yt-dlp wrapper — inline selector, filtered menu, clean progress, audio/video split{RESET}"

parser = argparse.ArgumentParser(
    description=desc,
    formatter_class=ColorHelpFormatter
)
parser.add_argument("url", help="YouTube URL")
parser.add_argument("-a", "--audio", action="store_true", help="Audio only (mp3)")
parser.add_argument("-H", "--high", action="store_true", help="Fetch highest available quality")
parser.add_argument("-o", "--output", help="Output directory (default: ~/Videos/Youtube)")
parser.add_argument("-q", "--quality", action="store_true", help="Interactive quality selector")
args = parser.parse_args()


TARGET_DIR = os.path.abspath(args.output) if args.output else os.path.expanduser("~/Videos/Youtube")
os.makedirs(TARGET_DIR, exist_ok=True)

# -------------------------
# internet check (youtube)
# -------------------------
def check_internet():
    try:
        socket.create_connection(("youtube.com", 443), timeout=3)
        return True
    except Exception:
        return False

if not check_internet():
    print(f"{BRIGHT_RED} Offline or cannot reach YouTube. Exiting.{RESET}")
    sys.exit(1)

# -------------------------
# normalize music urls
# -------------------------
url = args.url
if "music.youtube.com" in url:
    url = url.replace("music.youtube.com", "www.youtube.com")

# -------------------------
# playlist prompt (only once)
# -------------------------
download_playlist = False
if "list=" in url:
    try:
        while True:
            ans = input(f"{BRIGHT_YELLOW}Playlist detected. Download all videos? (y/n): {RESET}").strip().lower()
            if ans in ("y", "n"):
                break
        if ans == "y":
            download_playlist = True
        else:
            parts = urllib.parse.urlparse(url)
            q = urllib.parse.parse_qs(parts.query)
            url = f"https://www.youtube.com/watch?v={q.get('v',[None])[0]}"
    except KeyboardInterrupt:
        print(f"\n{BRIGHT_RED} Interrupted. Exiting.{RESET}")
        sys.exit(1)

# -------------------------
# silent logger for yt-dlp
# -------------------------
class SilentLogger:
    def debug(self, *a, **k): pass
    def info(self, *a, **k): pass
    def warning(self, *a, **k): pass
    def error(self, *a, **k): print(*a, **k)

# -------------------------
# probe metadata to find available formats
# -------------------------
probe_opts = {
    "quiet": True,
    "no_warnings": True,
    "logger": SilentLogger(),
    "noplaylist": not download_playlist,
}
try:
    with yt_dlp.YoutubeDL(probe_opts) as probe_ydl:
        info = probe_ydl.extract_info(url, download=False)
except KeyboardInterrupt:
    print(f"\n{BRIGHT_RED} Interrupted. Exiting.{RESET}")
    sys.exit(1)
except Exception as e:
    print(f"\n{BRIGHT_RED} Failed to fetch video info: {e}{RESET}")
    sys.exit(1)

formats = info.get("formats", []) or []

# -------------------------
# helpers: check if format exists
# -------------------------
def has_video_with(min_height=None, exact_height=None, fps_min=None, fps_max=None):
    for f in formats:
        vcodec = f.get("vcodec")
        if not vcodec or vcodec == "none":
            continue
        h = f.get("height") or 0
        fps = f.get("fps") or 0
        if exact_height is not None and h != exact_height:
            continue
        if min_height is not None and h < min_height:
            continue
        if fps_min is not None and fps < fps_min:
            continue
        if fps_max is not None and fps and fps > fps_max:
            continue
        return True
    return False

def has_audio_with(min_abr=0):
    for f in formats:
        acodec = f.get("acodec")
        if not acodec or acodec == "none":
            continue
        abr = f.get("abr") or 0
        if abr >= min_abr:
            return True
    return False

# -------------------------
# candidate presets (human-readable list)
# -------------------------
CANDIDATES = [
    ("144p",        {"min_h": None, "exact_h": None, "fps_min": None, "fps_max": 30}),
    ("240p",        {"min_h": None, "exact_h": None, "fps_min": None, "fps_max": 30}),
    ("360p",        {"min_h": None, "exact_h": None, "fps_min": None, "fps_max": 30}),
    ("480p",        {"min_h": None, "exact_h": None, "fps_min": None, "fps_max": 30}),
    ("720p 30fps",  {"exact_h": 720, "fps_min": None, "fps_max": 30}),
    ("720p 60fps",  {"exact_h": 720, "fps_min": 60, "fps_max": None}),
    ("1080p 30fps", {"exact_h": 1080, "fps_min": None, "fps_max": 30}),
    ("1080p 60fps", {"exact_h": 1080, "fps_min": 60, "fps_max": None}),
    ("1440p 60fps", {"exact_h": 1440, "fps_min": 60, "fps_max": None}),
    ("2160p 60fps", {"min_h": 2160, "fps_min": 60, "fps_max": None}),
]

# map candidates to format strings (fallback to reasonable query)
def preset_to_format(label):
    if "2160" in label:
        return "bestvideo[height>=2160][fps>=60]+bestaudio/best"
    if "1440" in label:
        return "bestvideo[height<=1440][fps>30]+bestaudio/best"
    if "1080" in label and "60" in label:
        return "bestvideo[height<=1080][fps>30]+bestaudio/best"
    if "1080" in label:
        return "bestvideo[height<=1080][fps<=30]+bestaudio/best"
    if "720" in label and "60" in label:
        return "bestvideo[height<=720][fps>30]+bestaudio/best"
    if "720" in label:
        return "bestvideo[height<=720][fps<=30]+bestaudio/best"
    # fallback generic
    try:
        h = int(label.split("p")[0])
        return f"bestvideo[height<={h}]+bestaudio/best"
    except Exception:
        return "bestvideo+bestaudio/best"

# build available presets list (filter out non-existent ones)
available_video_presets = []
for label, req in CANDIDATES:
    ok = has_video_with(min_height=req.get("min_h"),
                        exact_height=req.get("exact_h"),
                        fps_min=req.get("fps_min"),
                        fps_max=req.get("fps_max"))
    if ok:
        available_video_presets.append((label, preset_to_format(label)))

# fallback to 'best' if nothing matched
if not available_video_presets:
    available_video_presets = [("Best available", "bestvideo+bestaudio/best")]

# audio bitrate options detection
audio_bitrate_options = []
for t in (320, 256, 192, 128):
    if has_audio_with(min_abr=t):
        audio_bitrate_options.append((f"{t}kbps", str(t)))
# always include 'Best' fallback
audio_bitrate_options.append(("Best", "best"))

# -------------------------
# raw key reader
# -------------------------
def read_key():
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        ch = sys.stdin.read(1)
        if ch == "\x1b":
            # arrow sequences send two more bytes
            ch += sys.stdin.read(2)
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)

# -------------------------
# inline menu (prints header once; redraws only list)
# -------------------------
def menu_select(items, header):
    idx = 0
    n = len(items)
    # Print header
    sys.stdout.write(f"\n{BRIGHT_CYAN}{header}{RESET}\n")
    # Print list lines once
    for i, (label, _) in enumerate(items):
        if i == idx:
            sys.stdout.write(f"{BRIGHT_GREEN}[✔] {label}{RESET}\n")
        else:
            sys.stdout.write(f"{DIM}[ ] {label}{RESET}\n")
    sys.stdout.flush()

    while True:
        try:
            key = read_key()
        except KeyboardInterrupt:
            sys.stdout.write(f"\n{BRIGHT_RED} Interrupted. Exiting.{RESET}\n")
            sys.exit(1)

        # move cursor up n lines to the first list line
        for _ in range(n):
            sys.stdout.write("\033[F")
        # clear only the list lines (leave header intact)
        for _ in range(n):
            sys.stdout.write(CLEAR_LINE + "\n")
        # move cursor up n lines again to position cursor for redrawing list
        for _ in range(n):
            sys.stdout.write("\033[F")

        if key == "\x1b[A" and idx > 0:
            idx -= 1
        elif key == "\x1b[B" and idx < n - 1:
            idx += 1
        elif key in ("\r", "\n"):
            # clear list lines once more and print single-line confirmation
            for _ in range(n):
                sys.stdout.write(CLEAR_LINE + "\n")
            for _ in range(n):
                sys.stdout.write("\033[F")
            sel_label, sel_payload = items[idx]
            sys.stdout.write(CLEAR_LINE)
            sys.stdout.write(f"{BRIGHT_GREEN}Selected {sel_label}{RESET}\n")
            sys.stdout.flush()
            return sel_payload

        # redraw the list only
        for i, (label, _) in enumerate(items):
            if i == idx:
                sys.stdout.write(f"{BRIGHT_GREEN}[✔] {label}{RESET}\n")
            else:
                sys.stdout.write(f"{DIM}[ ] {label}{RESET}\n")
        sys.stdout.flush()

# -------------------------
# pick format based on mode and options
# -------------------------
selected_format = None
selected_audio_quality = None
QUALITY_LABEL = "auto"

try:
    if args.audio:
        # audio mode: allow bitrate selection if -q
        items = [(lab, payload) for lab, payload in audio_bitrate_options]
        if args.quality and len(items) > 1:
            selected_audio_quality = menu_select(items, "Select audio quality (↑ ↓, Enter):")
            QUALITY_LABEL = selected_audio_quality if selected_audio_quality != "best" else "Best audio"
        else:
            selected_audio_quality = items[0][1] if items else "best"
            QUALITY_LABEL = items[0][0] if items else "Best audio"
        # default download format
        ytdl_format = "bestaudio/best"
    else:
        # video mode
        items = [(lab, fmt) for lab, fmt in available_video_presets]
        if args.high:
            # pick highest available preset (last one)
            selected_format = items[-1][1]
            QUALITY_LABEL = items[-1][0]
        elif args.quality:
            selected_format = menu_select(items, "Select video quality (↑ ↓, Enter):")
            # find label for selected_format
            for lab, fmt in items:
                if fmt == selected_format:
                    QUALITY_LABEL = lab
                    break
        else:
            # default to a reasonable middle-high preset: try 1080p if present, else last
            prefer_label = "1080p 30fps"
            found = False
            for lab, fmt in items:
                if prefer_label in lab:
                    selected_format = fmt
                    QUALITY_LABEL = lab
                    found = True
                    break
            if not found:
                selected_format = items[min(6, len(items)-1)][1]
                QUALITY_LABEL = items[min(6, len(items)-1)][0]
        ytdl_format = selected_format or "bestvideo+bestaudio/best"
except KeyboardInterrupt:
    print(f"\n{BRIGHT_RED} Interrupted. Exiting.{RESET}")
    sys.exit(1)

# -------------------------
# prepare yt-dlp options (download)
# -------------------------
MODE = "Audio" if args.audio else "Video"
FORMAT_OUT = "mp3" if args.audio else "mp4"

ytdl_opts = {
    "outtmpl": os.path.join(TARGET_DIR, "%(title)s.%(ext)s"),
    "quiet": True,
    "no_warnings": True,
    "logger": SilentLogger(),
    "merge_output_format": "mp4",
    "noplaylist": not download_playlist,
    "progress_hooks": [],
}

if args.audio:
    ytdl_opts["format"] = ytdl_format
    # set mp3 postprocessor config
    prefq = "0"
    if selected_audio_quality and selected_audio_quality != "best":
        # selected_audio_quality might be "320" string
        prefq = selected_audio_quality
    ytdl_opts["postprocessors"] = [{
        "key": "FFmpegExtractAudio",
        "preferredcodec": "mp3",
        "preferredquality": prefq
    }]
else:
    ytdl_opts["format"] = ytdl_format

# -------------------------
# progress hook (shows Audio/Video correctly)
# -------------------------
start_time = None

def human_time(sec):
    return str(timedelta(seconds=int(sec)))

def stream_label_from_dict(d):
    # If forced audio mode, call it Audio
    if args.audio:
        return "Audio"
    vcodec = d.get("vcodec")
    acodec = d.get("acodec")
    if vcodec == "none":
        return "Audio"
    if vcodec:
        return "Video"
    if acodec:
        return "Audio"
    return "Video"

def progress_hook(d):
    global start_time
    status = d.get("status")
    stream = stream_label_from_dict(d)
    if status == "downloading":
        if start_time is None:
            start_time = time.time()
        total = d.get("total_bytes") or d.get("total_bytes_estimate") or 0
        done = d.get("downloaded_bytes", 0)
        percent = (done / total * 100) if total else 0.0
        filled = int(percent / 100 * BAR_WIDTH)
        bar = BRIGHT_GREEN + FILL * filled + RESET + EMPTY * (BAR_WIDTH - filled)
        speed = d.get("speed") or 0.0
        eta = d.get("eta") or 0
        size_done = done / 1024 / 1024
        size_total = (total / 1024 / 1024) if total else 0.0
        speed_mb = speed / 1024 / 1024
        sys.stdout.write(
            f"\r{stream} {bar} {percent:5.1f}% | "
            f"{size_done:.1f}/{size_total:.1f} MB | "
            f"{speed_mb:.2f} MB/s ETA {human_time(eta)}"
        )
        sys.stdout.flush()
    elif status == "finished":
        sys.stdout.write("\n")
        sys.stdout.flush()

ytdl_opts["progress_hooks"].append(progress_hook)

# -------------------------
# run download (with ctrl+c handling)
# -------------------------
try:
    sys.stdout.write(f"{BRIGHT_CYAN}Fetching from YouTube…{RESET}\n\n")
    sys.stdout.flush()
    with yt_dlp.YoutubeDL(ytdl_opts) as ydl:
        info = ydl.extract_info(url)  # triggers progress_hook
        output_file = ydl.prepare_filename(info)
        # handle mp3 final name
        if args.audio:
            output_file = os.path.splitext(output_file)[0] + ".mp3"
except KeyboardInterrupt:
    print(f"\n{BRIGHT_RED} Download interrupted. Exiting.{RESET}")
    sys.exit(1)
except yt_dlp.utils.DownloadError:
    print(f"\n{BRIGHT_RED} Download failed! Check URL or connection.{RESET}")
    sys.exit(1)
except Exception as e:
    print(f"\n{BRIGHT_RED} Unexpected error: {e}{RESET}")
    sys.exit(1)

# -------------------------
# final stats
# -------------------------
if os.path.exists(output_file):
    final_size_mb = os.path.getsize(output_file) / (1024 * 1024)
else:
    final_size_mb = 0.0

total_elapsed = (time.time() - start_time) if start_time else 0.0
avg_speed = (final_size_mb / total_elapsed) if total_elapsed > 0 else 0.0

title = info.get("title", "Unknown")
duration = timedelta(seconds=info.get("duration", 0))

print(f"\n{BRIGHT_CYAN}Title:{RESET}    {title}")
print(f"{BRIGHT_CYAN}Format:{RESET}   {MODE} - {FORMAT_OUT}")
print(f"{BRIGHT_CYAN}Quality:{RESET}  {QUALITY_LABEL}")
print(f"{BRIGHT_CYAN}Length:{RESET}   {duration}")
print(f"{BRIGHT_CYAN}Size:{RESET}     {final_size_mb:.1f} MB")
print(f"\n{BRIGHT_CYAN}Time taken:{RESET} {human_time(total_elapsed)} | Avg {avg_speed:.2f} MB/s")
print(f"{BRIGHT_GREEN}✔ Saved at:{BRIGHT_WHITE} {output_file}{RESET}\n")

