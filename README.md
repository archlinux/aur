# skillful-bin AUR package

AUR packaging for Skillful's binary GitHub Release artifact.

This package downloads `skillful-<version>-linux-x64.tar.gz` from the matching GitHub Release and installs it under `/opt/skillful`.

## First-time setup

Create the AUR package repository once:

```bash
git init
git remote add origin ssh://aur@aur.archlinux.org/skillful-bin.git
./update-aur-package.sh 1.0.0
git add PKGBUILD .SRCINFO skillful.desktop update-aur-package.sh README.md .gitignore
git commit -m "Initial import"
git push -u origin master
```

The `update-aur-package.sh` command requires Arch tooling:

```bash
sudo pacman -S --needed base-devel pacman-contrib git openssh
```

## Release updates

After the first manual push, Skillful's tagged release workflow can update this repository automatically when the main repository has an `AUR_SSH_PRIVATE_KEY` secret with push access to `ssh://aur@aur.archlinux.org/skillful-bin.git`.

Manual update:

```bash
./update-aur-package.sh 1.0.0
git diff
git add PKGBUILD .SRCINFO
git commit -m "Update to 1.0.0"
git push
```
