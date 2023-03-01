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

Package (1)    Old Version  New Version  Net Change

community/tea  0.9.2-1      0.9.2-1        0,00 MiB

Total Installed Size:  22,09 MiB
Net Upgrade Size:       0,00 MiB

:: Proceed with installation? [Y/n]
(1/1) checking keys in keyring
(1/1) checking package integrity
(1/1) loading package files
(1/1) checking for file conflicts
(1/1) checking available disk space
:: Processing package changes...
(1/1) reinstalling tea
:: Running post-transaction hooks...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Checking repro status...
NOT REPRODUCED: tea 0.9.2-1 status BAD
```

## Installation

Run `make install`, or install from the [AUR](https://aur.archlinux.org/packages/pacman-hook-reproducible-status).

## License

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.

See `LICENSE`.
