# aliyun-cli-bin

This repo maintains the `PKGBUILD` for the `aliyun-cli-bin` AUR package.

## Getting Started

The Aliyun CLI is a tool used to manage and interact with Alibaba Cloud resources through a command line interface.  Its repo exists [here](https://github.com/aliyun/aliyun-cli).  For the `aliyun-cli-bin` to be useful, an Alibaba Cloud account should be created along with a user with sufficient permissions attached.  Access keys should also be created for this user.

## Installation

This `PKGBUILD` is intended to be used on Arch Linux (or other Arch-based Linux distros).  A secure AUR helper is recommended.  Exact installation steps will vary depending on the AUR helper, but here is an example:
```
yay -S aliyun-cli-bin
```

## Publishing

* Edit `PKGBUILD`: will likely only need to change the version number and the sha256sums
* Ensure package is generated successfully: `makepkg` (Add `-f` flag to overwrite existing)
* Check `PKGBUILD` for errors: `namcap PKGBUILD`
* Generate .SRCINFO: `makepkg --printsrcinfo > .SRCINFO`
* Commit and push to remotes (`origin` and `upstream`)
