# Bing Daily Wallpaper

Small utility to download and set Bing's daily wallpaper on Linux desktops.

## Supported Desktop Environments

- Cinnamon
- GNOME
- KDE (Plasma)
- MATE
- Xfce

## Usage

If you installed the `bwall` binary (AUR) the commands below are available.

- `bwall today` — download today's wallpaper and set it for the current desktop.
- `bwall previous [N]` — download the wallpaper from N days ago and set it (when omitted, defaults to 1 day ago).
- `bwall --help` — show command help.

## Current support
- Arch Linux via the AUR package: `bing-daily-wallpaper`

Install (Arch Linux):

```
yay -S bing-daily-wallpaper
```

## Build from source
Requirements: .NET SDK (project targets `net10.0`).

Build and run from the repo root:

```
dotnet build
dotnet run --project BingDailyWallpaper.csproj
```

Publish a release build:

```
dotnet publish -c Release -o out
```

## Systemd (optional)
This repo includes systemd unit files: [bwall.service](bwall.service) and [bwall.timer](bwall.timer).
To use them as a user timer, copy the files to `~/.config/systemd/user/` then:

```
systemctl --user daemon-reload
systemctl --user enable --now bwall.timer
```

## Notes
- If you'd like support for other distributions or a packaged release, I can add packaging instructions or CI workflows.


