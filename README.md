# aur-luch

AUR for [Luch](https://github.com/alexindigo/luch) (release version).

## Install

```bash
# Clone and build
git clone ssh://aur@aur.archlinux.org/luch.git
cd luch
makepkg -si
```

When AUR is available, install via your AUR helper:

```bash
yay -S luch
```

The rolling `-git` counterpart lives at
[aur/luch-git](https://aur.archlinux.org/packages/luch-git); both
conflict, so install exactly one.
