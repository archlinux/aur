# cinnamon-no-nemo

Repackaged Cinnamon desktop environment without Nemo dependency, designed to work with [Dory](https://github.com/Twilight0/dory) file manager.

## What this does

This package takes the official Cinnamon package from Arch Linux and:

1. Removes `nemo` from the dependencies
2. Replaces `cinnamon.session` to use `dory-autostart` instead of `nemo-autostart`
3. Removes any leftover Nemo desktop files
4. Conflicts with both `cinnamon` and `nemo`

## Installation

```bash
# From AUR
yay -S cinnamon-no-nemo

# Or with makepkg
git clone https://aur.archlinux.org/cinnamon-no-nemo.git
cd cinnamon-no-nemo
makepkg -si
```

## Requirements

- [dory-git](https://aur.archlinux.org/packages/dory-git) - The Dory file manager
- [cinnamon-dory-session](https://aur.archlinux.org/packages/cinnamon-dory-session) - Session configuration (optional, included in this package)

## How it works

1. Downloads the official Cinnamon package from Arch Linux mirrors
2. Extracts and repackages without Nemo
3. Installs modified `cinnamon.session` with `dory-autostart` as required component
4. Sets up Dory as the default file manager

## Differences from official cinnamon

| Feature | Official | This Package |
|---------|----------|--------------|
| Nemo dependency | Required | Removed |
| Session component | `nemo-autostart` | `dory-autostart` |
| File manager | Nemo | Dory |
| `.nemo_action` support | Yes | Yes (backward compatible) |

## Reverting to official cinnamon

```bash
sudo pacman -Rdd cinnamon-no-nemo
sudo pacman -S cinnamon
```

## Notes

- This is a binary repackaging - no compilation required
- The package version matches the official cinnamon package
- Dory maintains backward compatibility with `.nemo_action` files
- Desktop icon management is handled by `dory-desktop`

## License

GPL-2.0-or-later (same as Cinnamon)
