# pacman-hook-reproducible-status

A pacman hook to check whether installed/upgraded packages are reproducible.

After every transaction which installs or upgrades packages it

- fetches the current package list from <https://reproducible.archlinux.org/>,
- checks the reproducible status of each installed or upgraded package, and
- reports all packages which are not reproducible or unknown.

```console
# pacman -S tea mdcat
resolving dependencies...
looking for conflicting packages...

Package (2)      New Version  Net Change

community/mdcat  1.0.0-1        6,85 MiB
community/tea    0.9.2-1       22,09 MiB

Total Installed Size:  28,94 MiB

:: Proceed with installation? [Y/n]
(2/2) checking keys in keyring
(2/2) checking package integrity
(2/2) loading package files
(2/2) checking for file conflicts
(2/2) checking available disk space
:: Processing package changes...
(1/2) installing tea
(2/2) installing mdcat
Optional dependencies for mdcat
    less: for mdless [installed]
    librsvg: used to render SVG images in kitty [installed]
:: Running post-transaction hooks...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Checking repro status...
tea 0.9.2-1 is not reproducible, status BAD
```

## installation

Run `make install`, or install from the [AUR](https://aur.archlinux.org/packages/pacman-hook-reproducible-status).

## License

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.

See `LICENSE`.
