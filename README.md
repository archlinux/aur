# hyprbole

terminal UI for managing the [Hyprland](https://hyprland.org) config.

includes options for keybinds, monitors, window rules, animations, and more.

![bash](https://img.shields.io/badge/bash-5%2B-orange) ![license](https://img.shields.io/badge/license-MIT-blue)

## what it does

writes to a separate `hyprbole-managed.conf` that gets sourced into your main `hyprland.conf`, so it never touches your hand-written config.

sections:
- keybinds
- monitors
- workspaces (special, named, persistent)
- window rules (windowrulev2)
- general, decoration, animations, input, misc
- autostart (exec-once / exec)
- env vars

all changes are backed up before writing.

## install

```bash
git clone https://github.com/vlensys/hyprbole
cd hyprbole
chmod +x hyprbole.sh
# optionally, add it to your PATH
sudo cp hyprbole.sh /usr/local/bin/hyprbole
```

or just drop it somewhere on your `$PATH`.

## usage

```
hyprbole           # launch
hyprbole --debug   # log all keypresses to /tmp/hyprbole-debug.log
hyprbole --fixes   # number of successful bug hunting sessions
```

**keys**
- `↑↓` / `j k` — navigate
- `enter` / `space` — select
- `n` — add new entry
- `d` — delete selected
- `q` / `ESC` — back
- `ctrl+q` — cancel current form

## requirements

- bash 5+
- tput (ncurses)
- runs inside a terminal, doesn't need Hyprland running (but `reload` does)

## how it works

on first run, hyprbole creates `~/.config/hypr/hyprbole-managed.conf` and appends a `source =` line to your `hyprland.conf`. all edits go into the managed file. backups live in `~/.config/hypr/hyprbole-backups/`.
