# typeless-bin

Repackages the official Typeless 2.2.0 x86_64 Linux release for Arch Linux.
The upstream Debian package revision is 2.2.0-25.

Build and install with `makepkg -si`.

For global keyboard capture, the user must belong to the `input` group.
If needed, run `sudo usermod -aG input "$USER"`, then log out and back in.
The package supplies a uinput module configuration and device access rule.
After first installation, reboot or run `sudo modprobe uinput` and
`sudo udevadm control --reload-rules`, then
`sudo udevadm trigger --subsystem-match=misc --sysname-match=uinput`.

The upstream IBus VoiceIME component is included. IBus and python-gobject are
optional; the upstream build does not contain the Fcitx5 addon binary.
Debian-specific installation scripts, automatic changes to all user accounts,
and system-wide autostart are not executed. Use the application's own settings
to choose startup behavior. Sign-in and actual dictation require user interaction.

Typeless is distributed under its [service terms](https://www.typeless.com/terms).
The Debian metadata says MIT, but the archive supplies only Electron/Chromium
license notices, so this package conservatively uses LicenseRef-proprietary.
