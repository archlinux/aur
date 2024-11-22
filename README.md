# filen-cli-bin

## Release checklist

- [ ] Update `pkgver`.
- [ ] Update `pkgrel`, if needed.
- [ ] Gen hash sums and substitute old with new ones:

  ```bash
  makepkg -g >> PKGBUILD
  ```

- [ ] Check for common formatting issues:

  ```bash
  namcap PKGBUILD
  ```

- [ ] Commit and push.
