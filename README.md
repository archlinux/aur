# OpenBot for Arch Linux

`openbot-bin` repackages the official Nightly Labs OpenBot Linux release.
It supports x86_64 and aarch64, installs a desktop launcher and the `openbot://`
URL handler, and uses the bundled Electron runtime with its sandbox enabled.
The AppImage is extracted during packaging, so FUSE is not required.

Install from AUR:

```sh
yay -S openbot-bin
```

Or build manually:

```sh
git clone https://aur.archlinux.org/openbot-bin.git
cd openbot-bin
makepkg -si
```

Update with the package manager. Upstream disables its in-app updater for an
unpacked Linux installation. Provider runtimes are downloaded separately by
OpenBot when selected.

The optional x86_64 remote-desktop server shipped by upstream targets Ubuntu
libraries (`libicuuc.so.74` and `libminiupnpc.so.17`). Those versions are not
provided by current Arch core/extra packages. Its remote-desktop hosting feature
needs compatible libraries; the main desktop application and agent computer-use
driver do not need them. Upstream supplies no remote-desktop server on aarch64.

OpenBot is licensed under PolyForm Noncommercial 1.0.0. See the upstream license
and notice installed under `/usr/share/licenses/openbot-bin/`. This repository's
packaging files are licensed under 0BSD.
