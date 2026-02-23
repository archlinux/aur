# dropdeck-git AUR scaffold

This folder contains an AUR-ready scaffold for a `dropdeck-git` package.

## What it includes

- `PKGBUILD` for a VCS (`-git`) package
- `.SRCINFO`
- `dropdeck.service` (systemd **user** service)
- `dropdeck@.service` (optional system-wide template service)
- `dropdeck.sh` wrapper (`/usr/bin/dropdeck`)
- `dropdeck-git.install` post-install instructions

## Update behavior

`-git` packages track latest upstream commit **when users upgrade packages**.
No background auto-update is installed.

## Notes

- User service is the recommended mode for Wayland desktop components.
- System-wide template service is provided as an advanced option and may need
  environment overrides in `/etc/dropdeck/<user>.env`.
- Settings persist to `~/.config/dropdeck/settings.json`.
- Built-in themes are read from `/usr/share/dropdeck/themes`; optional user
  themes can be placed in `~/.config/dropdeck/themes`.
