# pcurses-git

AUR package for pcurses - A curses package management tool using libalpm (git version)

## About

This package builds pcurses from a patched fork that includes important security fixes.

- **Upstream**: https://github.com/schuay/pcurses (original project)
- **Fork**: https://github.com/ajiepangestu/pcurses (patched version)
- **AUR Package**: pcurses-git

## Patches Applied

This package uses a fork with the following patches already integrated:

### Format Security Fix

- Fixes build errors with `-Werror=format-security` flag
- Prevents potential format string vulnerabilities
- Ensures compatibility with modern GCC/Clang security flags

See [PATCHES.md](https://github.com/ajiepangestu/pcurses/blob/master/PATCHES.md) in the fork repository for detailed patch information.

## Building

```bash
makepkg -si
```

## Installation from AUR

```bash
# Using yay
yay -S pcurses-git

# Using paru
paru -S pcurses-git

# Manual installation
git clone https://aur.archlinux.org/pcurses-git.git
cd pcurses-git
makepkg -si
```

## Why a Fork?

The original upstream project has not been actively maintained, and modern build systems require format security compliance. This fork maintains the patches necessary for successful compilation on current Arch Linux systems while remaining compatible with the original project.

## Maintainer

- Ajie Pangestu <paangestu@gmail.com>

## Original Author

- Jakob Gruber <jakob.gruber@gmail.com>

## License

GPL2
