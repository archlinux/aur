#!/usr/bin/env python3
import subprocess
import sys
import os
import urllib.request
import tempfile
import glob

def normalize_url(url: str) -> str:
    """Convert music.youtube.com URLs to regular youtube.com URLs."""
    return url.replace("music.youtube.com", "www.youtube.com")

def get_image(image_input: str) -> str:
    """Return a local path to the image, downloading it if a URL is given."""
    if image_input.startswith("http://") or image_input.startswith("https://"):
        ext = image_input.split("?")[0].split(".")[-1]
        if ext.lower() not in ("jpg", "jpeg", "png", "webp"):
            ext = "jpg"
        tmp = tempfile.NamedTemporaryFile(delete=False, suffix=f".{ext}")
        print(f"Downloading image from {image_input}...")
        urllib.request.urlretrieve(image_input, tmp.name)
        return tmp.name
    else:
        path = os.path.expanduser(image_input)
        if not os.path.isfile(path):
            print(f"Error: image file not found: {path}")
            sys.exit(1)
        return path

def embed_image(image_path: str, flac_file: str):
    """Embed image into a FLAC file using metaflac."""
    subprocess.run(["metaflac", "--remove", "--block-type=PICTURE", flac_file])
    subprocess.run(["metaflac", f"--import-picture-from={image_path}", flac_file])

def get_flag_value(flag_short, flag_long):
    """Get the value after a flag, or None if not present."""
    args = sys.argv[1:]
    for flag in (flag_short, flag_long):
        if flag in args:
            idx = args.index(flag)
            if idx + 1 < len(args):
                return args[idx + 1]
    return None

def download_music():
    use_playlist = "-p" in sys.argv
    image_input = get_flag_value("-i", "--image")

    url_input = input("Paste the YouTube URL: ").strip()
    url = normalize_url(url_input)

    cmd = [
        "yt-dlp", "-x",
        "--audio-format", "flac",
        "--audio-quality", "0",
        "--embed-thumbnail",
        "--embed-metadata",
        "--parse-metadata", "title:%(artist)s - %(title)s",
        "--ppa", "ThumbnailsConvertor:-vf crop='ih:ih'",
        "-o", "1. %(artist)s - %(title)s.%(ext)s",
        url
    ]

    if use_playlist:
        cmd.insert(2, "--yes-playlist")
    else:
        cmd.insert(2, "--no-playlist")

    # Track which files exist before download
    before = set(glob.glob("*.flac"))

    subprocess.run(cmd)

    # If -i was given, embed the image into newly downloaded files
    if image_input:
        after = set(glob.glob("*.flac"))
        new_files = after - before
        if new_files:
            image_path = get_image(image_input)
            for flac in new_files:
                print(f"Embedding custom image into {flac}...")
                embed_image(image_path, flac)
        else:
            print("No new FLAC files found to embed image into.")

if __name__ == "__main__":
    download_music()
