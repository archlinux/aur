# AUR package repo

This is the AUR repository for `wsjtcb`.

Suggested flow:

```bash
git clone ssh://aur@aur.archlinux.org/wsjtcb.git
cd wsjtcb
# Update PKGBUILD, then build and validate the package.
makepkg -s
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD wsjtcb-*.pkg.tar.zst
git add PKGBUILD .SRCINFO
git commit -m "Update to 1.4.0"
git push origin master
```

Notes:

- Version 1.4.0 (Scarlet) pins upstream commit `28a6f156827bf76df4f8e70b532289da3e108362`, the merge into `main`. No 1.4.0 tag was available when preparing this update. The fixed commit keeps builds independent of later branch changes.
- Documentation generation and manpages are disabled to keep Arch build dependencies minimal.
- The upstream CMake install already ships the desktop file, icon, shared data, helper binaries, and docs.
