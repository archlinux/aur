# 🖥 fish-screen-time

A lightweight daily screen time tracker that shows up in your Fish shell greeting. Resets automatically every day at midnight. Uses ~1–3 MB of RAM.

## Install via AUR

```bash
yay -S fish-screen-time
```

or with paru:

```bash
paru -S fish-screen-time
```

## After installing

**1. Start the background tracker:**
```bash
systemctl --user enable --now screen-time-tracker
```

**2. Add to your fish greeting:**
```fish
function fish_greeting
    show_screen_time
end
funcsave fish_greeting
```

That's it. Open a new terminal and you'll see:

```
🟢 Screen time today: 1h 23m
🟡 Screen time today: 5h 10m  Consider a break soon.
🔴 Screen time today: 8h 45m  Take a long break!
```

## How it works

A systemd user service runs `screen_time_tracker.sh` silently in the background. Every 60 seconds it adds 60 to a date-stamped file in `~/.local/share/screen_time/`. When midnight passes, a new file starts for the new day — no cron job needed.

`show_screen_time` reads that file and formats it whenever you open a terminal.

## Manual install (non-Arch systems)

```bash
# Clone the repo
git clone https://github.com/YOURUSERNAME/fish-screen-time
cd fish-screen-time

# Install tracker script
mkdir -p ~/.local/bin
cp screen_time_tracker.sh ~/.local/bin/
chmod +x ~/.local/bin/screen_time_tracker.sh

# Install fish function
cp show_screen_time.fish ~/.config/fish/functions/

# Install and start systemd service
mkdir -p ~/.config/systemd/user
cp screen-time-tracker.service ~/.config/systemd/user/
systemctl --user enable --now screen-time-tracker
```

## Dependencies

- `fish` shell
- `bash`
- `systemd`

## License

MIT
