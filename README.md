# Music Tags

A desktop app for viewing and editing audio file metadata.

Drag an audio file onto the window to load its tags. Missing tags are automatically fetched from MusicBrainz. Tags can be edited manually and saved back to the file.

## Features

- Drag and drop audio files onto the window
- Reads and writes tags via [mutagen](https://mutagen.readthedocs.io/)
- Fetches missing tags from [MusicBrainz](https://musicbrainz.org/) in the background
- Per-field refresh buttons to re-fetch individual tags
- Displays embedded album art (MP3 APIC / FLAC pictures)
- Log panel showing load and fetch activity
- [sv-ttk](https://github.com/rdbende/Sun-Valley-ttk-theme) theme, automatically matching your desktop dark/light setting

## Supported Formats

MP3, FLAC, OGG, Opus, Speex, MP4/M4A/AAC, WMA/ASF, AIFF, APE, WavPack, Musepack, True Audio, OptimFROG, DSD

## Requirements

- Python 3.x
- `mutagen`, `tkinterdnd2`, `sv-ttk`, `pillow`, `cairosvg`, `musicbrainzngs`
- `tk` system package (e.g. `sudo pacman -S tk` on Arch)

Install dependencies:

```bash
pip install -r requirements.txt
```

## Usage

```bash
python main.py
```

## Credits

App icon: [Music Folder Icon](https://openclipart.org/detail/23730/music-folder-icon) from OpenClipart, public domain.
