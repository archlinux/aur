# code-server-aur

Arch User Repository package for [code-server](https://github.com/cdr/code-server).
Feel free to file issues here or comment on the AUR page.

Previously maintained by [KSXGitHub](https://github.com/KSXGitHub)

## Updating

If there are no breaking changes with the release, updating the package is as
simple as updating `pkgver` in `PKGBUILD` to the new version.

After updating, run this command on an Arch machine to update the `.SRCINFO`.
This is the file that is used by the AUR to show package info.

```bash
makepkg --printsrcinfo > .SRCINFO
```

Then, just push to the AUR git repo.
