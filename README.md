# travis-conditions


This repo maintains the `PKGBUILD` for the `travis-conditions` AUR package.

## Getting Started

`travis-conditions` is a boolean language for conditional builds, stages, jobs 

## Installation

This `PKGBUILD` is intended to be used on Arch Linux (or other Arch-based Linux distros).  A secure AUR helper is recommended.  Exact installation steps will vary depending on the AUR helper, but here is an example:
```
yay -S travis-conditions
```

## Publishing

* Edit `PKGBUILD`: will likely only need to change the version number and the sha256sums
* Ensure package is generated successfully: `makepkg` (Add `-f` flag to overwrite existing)
* Check `PKGBUILD` for errors: `namcap PKGBUILD`
* Generate .SRCINFO: `makepkg --printsrcinfo > .SRCINFO`
* Commit and push to remotes (`origin` and `upstream`)

## Maintainer

Trevor Facer <trevordf@protonmail.com>
