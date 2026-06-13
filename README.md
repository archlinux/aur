# swaypaper

A minimal terminal wallpaper picker for Wayland compositors.

## Dependencies

- `swaybg`
- `bash`

## Installation

```bash
paru -S swaypaper
```

## Usage

```bash
swaypaper
```

On first run you'll be asked for your wallpaper directory (defaults to `~/Pictures/Wallpapers`).



## Autostart

To restore your wallpaper on login, add this to your compositor config:

```bash
swaybg -i ~/.config/sway/current_wallpaper -m fill
```

## Supported formats

`jpg` `jpeg` `png` `webp`
