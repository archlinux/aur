# AUR package repo

This directory is ready to be used as the root of an AUR repository for `wsjtcb`.

Suggested flow:

```bash
cd aur/wsjtcb
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD .SRCINFO
git init
git remote add origin ssh://aur@aur.archlinux.org/wsjtcb.git
git add PKGBUILD .SRCINFO
git commit -m "Initial import"
git push origin master
```

Notes:

- The package tracks the tagged release `WSJT-CB-1.1.0` via a pinned git source, so it stays on the stable release while avoiding GitHub archive checksum churn.
- Documentation generation and manpages are disabled to keep Arch build dependencies minimal.
- The upstream CMake install already ships the desktop file, icon, shared data, helper binaries, and docs.
