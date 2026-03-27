#!/usr/bin/env python3
import subprocess
import sys

def normalize_url(url: str) -> str:
    """Convert music.youtube.com URLs to regular youtube.com URLs."""
    return url.replace("music.youtube.com", "www.youtube.com")

def download_music():
    # Check if playlist flag -p is provided in the command line arguments
    use_playlist = "-p" in sys.argv

    url_input = input("Paste the YouTube URL: ").strip()
    url = normalize_url(url_input)

    # The -o flag now handles the '1. ' prefix for every file downloaded
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

    # Toggle playlist support based on the -p flag
    if use_playlist:
        cmd.insert(2, "--yes-playlist")
    else:
        cmd.insert(2, "--no-playlist")

    subprocess.run(cmd)

if __name__ == "__main__":
    download_music()
