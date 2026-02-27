# Arch Soundpad (dwm-friendly)

Simple Soundpad-like app for Arch Linux with a GUI.

It does three things:
- Lets you add/play/stop sound clips from a desktop UI.
- Creates a virtual sink (`soundpad_sink`) and virtual microphone (`soundpad_mic`) using `pactl`.
- Plays selected sounds into that virtual mic so you can pick `soundpad_mic` in Discord, OBS, games, etc.
- Lets you set custom hotkeys per clip (for example `Alt+1`, `Ctrl+F`).
- Can route your real microphone into the same virtual mic (`soundpad_mic`) so voice + effects are mixed.
- Supports multiple profiles (different clip lists and keybind sets).
- Supports profile export/import as JSON for backup/share.
- Adds automatic profile backups on every profile save in `~/.config/arch-soundpad/backups/`.
- Includes push-to-talk mic route mode with configurable hotkey.
- Includes a diagnostics button for one-click health checks.

## Dependencies (Arch)

```bash
sudo pacman -Syu python tk ffmpeg pipewire pipewire-pulse python-xlib
```

If you see `ImportError: libtk8.6.so` then your system is missing `tk` or has a partial upgrade. Run full upgrade:

```bash
sudo pacman -Syu
```

## Run

```bash
cd /home/jameel-sawafta/temp/arch-soundpad
./run.sh
```

## Install as desktop app

```bash
cd /home/jameel-sawafta/temp/arch-soundpad
./install.sh
```

This creates:
- `~/.local/bin/arch-soundpad`
- `~/.local/share/applications/arch-soundpad.desktop`

## Usage

1. Open app.
2. Click `Add Clips` and choose your audio files.
3. In your voice app, select input device: `soundpad_mic`.
4. Choose a source from `Mic Input Source`, then click `Connect Mic To Soundpad`.
5. Click `Play` on any clip.
6. Optional: select a clip then click `Set Hotkey` to assign keybind.
7. Enable `Global Hotkeys (X11)` to trigger clips even when app is unfocused.
8. If a key is already used by dwm (for example `Alt+1`), the status bar will show `Global hotkey conflicts`.
   Use a different bind like `Ctrl+Alt+1` or `Super+1`.
9. Use profile controls (`New`, `Rename`, `Delete`, dropdown) to manage separate sound sets.
10. Use `Export` to save all profiles to a `.json` file.
11. Use `Import` to load a `.json` file (replace all profiles or merge).
12. Optional: enable `Push-To-Talk Mic Route` and set `PTT key`.
13. Use `Diagnostics` button to check routing/hotkeys/profile state.
14. Use `Restore Backup` to load a snapshot from `~/.config/arch-soundpad/backups/`.

## Profile Backup And Share

- Export format includes:
  - `current_profile`
  - all `profiles` with clips and hotkeys
- Import supports:
  - Replace mode: overwrite current profile set
  - Merge mode: keep existing profiles and add imported ones (name conflicts get `-2`, `-3`, ...)
- Automatic backups:
  - A timestamped backup is written on each profile save.
  - Backup folder: `~/.config/arch-soundpad/backups/`

## AUR Package

```bash
yay -S arch-soundpad
```

Manual build:

```bash
git clone https://aur.archlinux.org/arch-soundpad.git
cd arch-soundpad
makepkg -si
```

For maintainers: package source is now fetched from GitHub release tarballs.

## Local Checks (Dev Repo)

Quick smoke test:

```bash
cd /home/jameel-sawafta/temp/arch-soundpad
./smoke_test.sh
```

Headless check only:

```bash
python3 /home/jameel-sawafta/temp/arch-soundpad/soundpad_app.py --headless-check
```

## Hotkeys (Current)

- `Enter`: play selected clip
- `Delete`: remove selected clip
- `Alt+\`: stop playback
- Per-clip hotkeys are user-defined (no default bind)
- Global hotkeys work on X11 (dwm) when `python-xlib` is installed.

## Notes

- Clips are saved in `~/.config/arch-soundpad/clips.json`.
- The app uses `ffmpeg` for playback.
- If you hear nothing, verify PipeWire/PulseAudio is running and `pactl info` works.
