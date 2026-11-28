# sidra-bin (AUR)

[![Update AUR Package](https://github.com/BUR4KBEY/sidra-bin/actions/workflows/update.yml/badge.svg)](https://github.com/BUR4KBEY/sidra-bin/actions/workflows/update.yml)

This repository contains the build files for the [sidra-bin](https://aur.archlinux.org/packages/sidra-bin) package on the Arch User Repository (AUR).

**[Sidra](https://github.com/wimpysworld/sidra)** is an elegant Apple Music desktop client for Linux. No frippery, just quality.

---

## 🚀 Features

- **Automated Upstream Tracking**: A custom GitHub Action monitors the [wimpysworld/sidra](https://github.com/wimpysworld/sidra) repository for new releases every day at 06:00 UTC. Only stable releases are picked up, and the version only ever moves forward.
- **Self-Updating PKGBUILD**: When a new version is detected, the workflow automatically:
  - Updates `pkgver` and resets `pkgrel`.
  - Downloads the new AppImage to calculate fresh `sha256sums`, and stops if the hash differs from the SHA-256 digest GitHub recorded for the release asset.
  - Regenerates `.SRCINFO`.
  - Commits changes back to this repository.

  If any step fails, `update.sh` restores `PKGBUILD` and `.SRCINFO`, so the two never disagree.
- **Seamless AUR Synchronization**: Automatically mirrors all changes from the `main` branch of this repo to the AUR `master` branch, ensuring the package is always up-to-date for Arch users. The workflow refuses to publish a `.SRCINFO` that does not match the `PKGBUILD`, connects to the AUR only with its pinned SSH host keys, and never runs two syncs at once.

> [!NOTE]
> After editing `PKGBUILD` by hand, run `makepkg --printsrcinfo > .SRCINFO` before pushing to `main`, or the sync stops.

## 🛠 Installation

You can install this package using your favorite AUR helper:

```bash
yay -S sidra-bin
# or
paru -S sidra-bin
```

Alternatively, manual installation:

```bash
git clone https://aur.archlinux.org/sidra-bin.git
cd sidra-bin
makepkg -si
```

## 🤖 Built with AI

This automation pipeline and repository structure were architected and refined through a collaborative effort between the maintainer and AI coding agents (**Claude** and **Gemini**).

## 🤝 Contributing

Contributions are more than welcome! Whether it's:
- Improving the `PKGBUILD` packaging logic.
- Refining the automation scripts.
- Enhancing the documentation.

Please feel free to open an Issue or submit a Pull Request.

## ⚖️ License

The packaging files in this repository are licensed under the same terms as the original project where applicable, or as specified in the `PKGBUILD`.
