#!/usr/bin/env python3
import subprocess
import os
import glob

def normalize_url(url: str) -> str:
    """Convert music.youtube.com URLs to regular youtube.com URLs."""
    return url.replace("music.youtube.com", "www.youtube.com")

def download_music():
    url = normalize_url(input("Paste the YouTube URL: ").strip())

    # Using your exact working flags for cropping and metadata
    cmd = [
        "yt-dlp", "-x",
        "--no-playlist",
        "--audio-format", "flac",
        "--audio-quality", "0",
        "--embed-thumbnail",
        "--embed-metadata",
        "--parse-metadata", "title:%(artist)s - %(title)s",
        "--replace-in-metadata", "title", r"\[MV\] ", "",
        "--replace-in-metadata", "title", r" feat\. asmi", "",
        "--ppa", "ThumbnailsConvertor:-vf crop='ih:ih'",
        "-o", "%(artist)s - %(title)s.%(ext)s",
        url
    ]

    subprocess.run(cmd)

    # Find the flac file and add the '1.' prefix
    flac_files = glob.glob("*.flac")
    if flac_files:
        # Get the most recently created flac file
        latest_file = max(flac_files, key=os.path.getctime)
        if not latest_file.startswith("1. "):
            new_name = f"1. {latest_file}"
            os.rename(latest_file, new_name)
            print(f"File ready: {new_name}")

if __name__ == "__main__":
    download_music()
