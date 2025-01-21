# filen-cli-bin

## Release checklist (scripted)

- [ ] Update `pkgver`.
- [ ] Update `pkgrel`, if needed.
- [ ] Execute `./update.sh`.

## Release checklist (manual)

- [ ] Update `pkgver`.
- [ ] Update `pkgrel`, if needed.
- [ ] Gen hash sums and substitute old with new ones:

  ```bash
  makepkg -g >> PKGBUILD
  ```

- [ ] Update `.SRCINFO`:

  ```bash
  makepkg --printsrcinfo > .SRCINFO
  ```

- [ ] Check for common formatting issues:

  ```bash
  namcap PKGBUILD
  ```

- [ ] Commit and push.
