```sh
$ git remote add origin ssh://aur@aur.archlinux.org/goweb.git
```

```sh
$ makepkg --printsrcinfo > .SRCINFO
```

To upgrade the version of your AUR package, follow these steps:

1. Edit your PKGBUILD file:
   - Change the `pkgver` variable to the new version.
   - Update the `source` URL if it includes the version number.
   - Update the `sha256sums` to match the new source tarball (or use 'SKIP' for testing).
2. Regenerate the `.SRCINFO` file:
   ```
   makepkg --printsrcinfo > .SRCINFO
   ```
3. Build and test the package:
   ```
   makepkg -si
   ```
4. Commit your changes:
   ```
   git add PKGBUILD .SRCINFO
   git commit -m "Upgrade to version x.y.z"
   ```
5. Push to the AUR:
   ```
   git push origin master
   ```