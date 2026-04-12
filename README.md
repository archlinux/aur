# kidle

KDE Plasma Wayland idle screen lock & DPMS daemon.

## The Problem

On KDE Plasma 6 running on Wayland, screens don't turn off before the first lock. The built-in DPMS (Display Power Management Signaling) never triggers from idle. This is particularly damaging for OLED displays, which suffer burn-in when left on with static content.

The bug manifests in two scenarios:

1. **Before first lock** — Plasma's idle timeout never turns off the display. The screen stays on indefinitely until you manually lock.
2. **At the login/greeter screen** — plasmalogin shows the greeter, but no idle timeout turns off the display.

This is a known Plasma Wayland bug. KWin's `org.freedesktop.ScreenSaver.GetSessionIdleTime` returns 0 on Wayland (unsupported), and logind's `IdleHint` is never set by Plasma. The standard DPMS pipeline is broken.

## How kidle Works

kidle works around the bug by implementing its own idle detection and screen control:

1. **Input device monitoring** — Reads `/dev/input/event*` devices directly to track keyboard and mouse activity. After the configured idle timeout (default: 300s / 5 minutes), screens turn off via `kscreen-doctor --dpms off`.

2. **Lock delay** — By default, the screen turns off immediately on idle, but the lock is delayed by 60 seconds. This gives you a window to wake the screen with a keypress or mouse movement without needing to enter your password. If you stay away for the full 60 seconds, the screen locks via `loginctl lock-sessions`.

3. **Session-aware operation** — Runs as a system service (root). Automatically discovers the active display session (greeter or user) by scanning `/run/user/` directories. Sets `WAYLAND_DISPLAY`, `XDG_RUNTIME_DIR`, `DBUS_SESSION_BUS_ADDRESS`, and `QT_QPA_PLATFORM=wayland` environment variables so `kscreen-doctor` can reach KWin regardless of whether the greeter or user session is active. Since kidle runs as root, it cannot connect to user session DBus — it relies on `loginctl lock-sessions` for locking and `kscreen-doctor` for screen control through the Wayland display directly.

4. **Activity detection** — When a keypress or mouse movement is detected while the screen is off, kidle wakes the display via `kscreen-doctor --dpms on` (on the greeter screen) or lets PowerDevil handle it (when a user is logged in). Any activity during the lock delay window cancels the pending lock and restores the screen without requiring a password.

## Installation

### Arch Linux (AUR)

```
paru -S kidle
```

### From source

```
make
makepkg -cf
sudo pacman -U kidle-*.pkg.tar.zst
```

## Usage

```
sudo systemctl enable --now kidle
```

The default idle timeout is 300 seconds (5 minutes) with a 60-second lock delay. To customize:

Edit `/usr/lib/systemd/system/kidle.service` and modify the `ExecStart` line:

```
ExecStart=/usr/bin/kidle --timeout 600 --lock-delay 120
```

Then reload and restart:

```
sudo systemctl daemon-reload
sudo systemctl restart kidle
```

## Command Line Options

| Option | Default | Description |
|--------|---------|-------------|
| `-t, --timeout=SECS` | 300 | Idle timeout in seconds before screens turn off (minimum: 10) |
| `-l, --lock-delay=SECS` | 60 | Delay between screens off and screen lock (0 = immediate) |
| `-d, --debug` | off | Enable debug output |

## How It Differs from Plasma's Built-in DPMS

| | Plasma DPMS | kidle |
|---|---|---|
| Works before first lock | No (broken on Wayland) | Yes |
| Works at login screen | No | Yes |
| Idle detection method | KWin (broken on Wayland) | `/dev/input` direct |
| Screen off mechanism | KWin DPMS (broken) | `kscreen-doctor --dpms off` |
| Lock mechanism | KWin locker | `loginctl lock-sessions` |
| Separate lock delay | No | Yes (default: 60s) |
| Runs as | User session | System service |

## Requirements

- KDE Plasma 6 (Wayland)
- `kscreen` (provides `kscreen-doctor`)
- `kwin`
- `glib2`

## License

MIT — Copyright (c) 2026 Danilo Falcão