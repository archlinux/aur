# pug-hook-noupgrade-git

This package is derived from [pug-hook-git](https://aur.archlinux.org/packages/pug-hook-git), which is derived from the canonical [pug](https://aur.archlinux.org/packages/pug).

Like `pug-hook-git`, this package downloads the latest version directly - it also has a cleaner PKGBUILD, and the titular patch, which removes the `Upgrade` operation from the hook, so that you can back up your package lists at install and remove without horifically slowing down day-to-day upgrades.
