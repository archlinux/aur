# Audio Files Thumbnailer

Enable automatic creation of thumbnails for audio files.

This has been tested with `thunar` on Arch Linux.  Other file managers which use `org.freedesktop.thumbnails.Thumbnailer1` should work, in theory.

## Supported MIME types
- audio/mpeg (.mp3)
- audio/mp4 (.m4a)

## Installation

### Arch Linux

```sh
yay -S audio-files-thumbnailer-git
```

### Manual Install

Install [ffmpeg](https://www.ffmpeg.org/)

Verify ffmpeg installation:

```sh
ffmpeg -version
```

Install the thumbnailer configuration file:

```sh
git clone https://github.com/jensenr30/audio-files-thumbnailer.git
cd audio-files-thumbnailer
sudo cp audio-files.thumbnailer /usr/share/thumbnailers/

```
