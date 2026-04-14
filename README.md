# way-thumbsense-git (AUR)

AUR packaging for [way-thumbsense](https://github.com/nagamine-git/way-thumbsense) — a ThumbSense-style helper for Linux/Wayland that holds a virtual key while your thumb touches the trackpad.

This repository only contains the `PKGBUILD` and related packaging files. Source code lives upstream.

## Install

With an AUR helper:

```sh
paru -S way-thumbsense-git
# or
yay -S way-thumbsense-git
```

Manually:

```sh
git clone https://aur.archlinux.org/way-thumbsense-git.git
cd way-thumbsense-git
makepkg -si
```

## Post-install setup

The package installs a udev rule granting the `input` group access to `/dev/uinput`. You still need to:

1. Add your user to the `input` group:

   ```sh
   sudo usermod -aG input "$USER"
   ```

2. Reload udev rules (or reboot):

   ```sh
   sudo udevadm control --reload-rules
   sudo udevadm trigger
   ```

3. Log out and back in.

## Files

- `PKGBUILD` — build recipe
- `way-thumbsense.install` — post-install notes
- `99-uinput.rules` — udev rule installed to `/usr/lib/udev/rules.d/`
- `.SRCINFO` — generated metadata (regenerate with `makepkg --printsrcinfo > .SRCINFO`)

## Maintenance

After editing `PKGBUILD`, regenerate `.SRCINFO`:

```sh
makepkg --printsrcinfo > .SRCINFO
```

Test build in a clean chroot before pushing:

```sh
makepkg -f
```

## License

The packaging files in this repository are MIT-licensed (matching upstream). The packaged software itself is licensed by its upstream authors.
