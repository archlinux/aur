# First run from the AUR

Full documentation: https://nomadcxx.github.io/sysc/docs/

Start Niri with `niri-session` (or your display manager), so the systemd user
manager has `NIRI_SOCKET`, `WAYLAND_DISPLAY` and an active graphical session.
Run the commands below as your normal user inside that session.

The packaged service creates a missing configuration with sysc-lock selected
and tray presentation enabled. It preserves an existing configuration. For a
manual launch without systemd, create that same starter configuration:

```sh
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/sysc-shell"
mkdir -p "$config_dir"
if [ ! -e "$config_dir/config.json" ]; then
    install -m644 /usr/share/doc/sysc-shell/config.example.json "$config_dir/config.json"
fi
```

For an existing configuration, choose sysc-lock in Settings or merge the
`session.locker` and `tray.enabled` settings from the example. Keep your other
settings. Choose idle locking explicitly in Settings; the example sets no timeout.

Stop your existing bar and notification daemon and remove their startup entries
before starting the shell. Remove duplicate sysc-shell startup entries from Niri.
Then run:

```sh
systemctl --user daemon-reload
systemctl --user enable --now sysc-shell.service
```

The shell unit starts notifications, tray, clipboard and the session lock owner
before the shell. Clipboard persistence needs a running Secret Service provider,
such as gnome-keyring or KeePassXC, or a configured `--key-file`. Starting the lock
owner does not lock the screen. sysc-lock uses the existing PAM `login` stack.

Merge the bindings in `/usr/share/doc/sysc-shell/niri-bindings.kdl` into your Niri
config's existing `binds` block. Click the clock to open the control centre.
Configure weather location, theme, wallpapers and plugins in Settings. The shell
starts with its built-in bar and theme when no config exists. Install
sysc-terminal for animated wallpaper, or swaybg/gSlapper for image/video wallpaper.

For packaged plugins, keep one source per plugin ID: installing the same ID through
the catalog or a source checkout as well causes the shell to reject the collision.

## Moving from the guided installer

User units in `~/.config/systemd/user` override packaged units. Back up and move
aside the installer-created SYSC unit files and review drop-ins with
`systemctl --user cat sysc-shell.service` before reloading the user manager. Keep
units and overrides you wrote yourself. Use `systemctl --user cat` to confirm
`ExecStart=/usr/bin/...` for the shell and each companion, then restart the units
when your screen is unlocked. Back up and move aside obsolete `~/.local/bin/sysc-*`
binaries that shadow `/usr/bin`; preserve your shell config and state.

The guided installer downloads binaries into your home directory. Use your AUR
helper for updates after switching to pacman-owned packages.
