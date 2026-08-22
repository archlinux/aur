# cinnamon-aliveos

Repackaged Cinnamon desktop environment for AliveOS (without Nemo dependency, with Dory integration, GTK3 dialog replacements, and custom enhancements).

## What this package does

This package takes the official Cinnamon package from Arch Linux and applies the following modifications:

1. **Nemo-free Architecture:**
   * Removes `nemo` dependency and integrates with [Dory](https://github.com/Twilight0/dory).
   * Replaces `cinnamon.session` to use `dory-autostart`.
   * Patches `cs_actions.py` to launch `dory-action-layout-editor` instead of Nemo.

2. **100% Pure GTK3 Dialog Replacements:**
   * **Power Off / Reboot / Logout Dialog:** Replaced with `zenity-session-quit.py` (GTK3 Zenity dialog).
   * **Alt + F2 Run Command Dialog:** Replaced with `zenity-run-dialog.py` (native GTK3 dialog featuring live `$PATH` command autocompletion).
   * **Polkit Password Prompts:** Replaced Cinnamon's internal Clutter/St polkit agent dialog with a GTK3 Zenity password prompt (`zenity-polkit-dialog.py`) driven by `polkitAuthenticationAgent.js`.
   * **NetworkManager Secret Prompts:** Disabled internal Clutter NM agent to let `nm-applet` (`libnma` GTK3) handle Wi-Fi and VPN password prompts natively.
   * **SSH / Keyring Password Prompts:** Disabled internal Clutter keyring agent to let `gcr-prompter` (`gcr-3` GTK3) handle password prompts natively.
   * **Force Quit / Unresponsive Windows:** Handled natively by Muffin + `zenity-gtk3`.

---

## Included Helper Scripts

### 1. `zenity-run-dialog.py`
A GTK3 Run Command dialog featuring:
* Live `$PATH` command autocompletion (`Gtk.EntryCompletion`).
* Inline and popup completion matching.
* Native GTK3 styling and keyboard shortcuts (`Enter` to run, `Esc` to cancel).

### 2. `zenity-session-quit.py`
A GTK3 Zenity-based Session Quit dialog handling:
* Power Off, Reboot, Log Out, and Cancel actions.
* Command-line argument parsing (`--logout`, `--power-off`, `--reboot`, `--no-prompt`).

---

## Installation & Rebuilding

```bash
cd ~/Projects/cinnamon-aliveos
makepkg -s
sudo pacman -U --overwrite '/usr/bin/cinnamon-session-quit,/usr/share/cinnamon-session/cinnamon-session-quit.py' cinnamon-aliveos-*.pkg.tar.zst
```

---

## Reverting to official cinnamon

```bash
sudo pacman -Rdd cinnamon-aliveos
sudo pacman -S cinnamon
```

---

## License

GPL-2.0-or-later (same as Cinnamon)
