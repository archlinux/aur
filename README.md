# yt-nerddl

A sleek, hassle-free YouTube downloader built as a **wrapper around `yt-dlp`**, with a clean, interactive inline selector and a Deno-inspired loading bar. Designed for anyone who wants a straightforward way to download audio/video from YouTube without fussing with complex commands.

> Note: only works for YouTube and YouTube Music (for now at least)

---

## Features

- ✅ **Audio & Video downloads**  
  - `-a / --audio` → download audio only (mp3)  
  - Video downloads default to mp4  

- ✅ **Interactive quality selection**  
  - `-q / --quality` → pick video or audio quality via an inline arrow-menu  

- ✅ **Highest quality mode**  
  - `-H / --high` → automatically grab the best available video  

- ✅ **Custom output folder**  
  - `-o / --output <directory>` → choose where to save downloads (default: `~/Videos/Youtube`)  

- ✅ **Playlist support**  
  - Prompts if the URL contains a playlist and allows downloading all videos  

- ✅ **Progress bar inspired by Deno**  
  - Shows percentage, downloaded size, total size, speed, ETA  

- ✅ **Handles YouTube Music URLs**  
  - Normalizes music URLs to regular YouTube format  

- ✅ **Automatic MP3 conversion** (for audio mode)  
  - Supports bitrate selection: 320, 256, 192, 128 kbps, or Best  

- ✅ **Minimal and clean console output**  
  - Color-coded status messages for errors, selections, and progress  

- ✅ **Interrupt handling**  
  - Ctrl+C gracefully cancels downloads at any stage  

---

## Installation

### Dependencies

Make sure you have these installed:

- Python 3.11+  
- `yt-dlp` (`pip install yt-dlp`)  
- `ffmpeg` (for audio extraction/conversion)  
- Linux terminal (with ANSI color support)  

### From GitHub

```bash
git clone https://github.com/<your-username>/yt-nerddl.git
cd yt-nerddl
chmod +x yt-nerddl.py
sudo mv yt-nerddl.py /usr/local/bin/yt-nerddl
````

### From AUR (when available)

```bash
yay -S yt-nerddl
```

> After installation, you can run it simply with:

```bash
yt-nerddl [options] <youtube-url> 
```

---

## Usage

```bash
yt-nerddl <url> [options]
```

**Options:**

| Option               | Description                                          |
| -------------------- | ---------------------------------------------------- |
| `-a, --audio`        | Download audio only (mp3)                            |
| `-H, --high`         | Fetch highest available quality                      |
| `-o, --output <dir>` | Specify output directory (default: ~/Videos/Youtube) |
| `-q, --quality`      | Interactive quality selector                         |

**Example:**

* Download audio only at best quality:

```bash
yt-nerddl -a -q https://www.youtube.com/watch?v=xxxx
```

* Download a playlist in the highest available quality:

```bash
yt-nerddl -H https://www.youtube.com/playlist?list=xxxx
```

---

## Philosophy

`yt-nerddl` is meant to be **a nice-looking, hassle-free YouTube downloader**. The idea is to make downloading content intuitive, quick, and visually clear without writing complex `yt-dlp` commands. The **progress bar** and inline selector are inspired by Deno’s clean aesthetic.

It’s essentially `yt-dlp`, but with a friendly, interactive wrapper that feels modern, fast, and minimal.

---

## Contribution

* Contributions welcome!
* Open a PR or submit issues for bugs/features.
* Keep the progress bar clean, colors readable, and UX smooth.

