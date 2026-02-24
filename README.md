# Elgato Key Light Controller (AUR)

AUR package for [elgato-keylight](https://github.com/monadplus/elgato-keylight)

## Pacman packaging

- Install `pacman -S devtools`
- `$ pkgctl build` on this repo: will try building your package in a [clean chroot](https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot)
  - To update checksum: `makepkg -g`
- Update `.SRCINFO`: `$ makepkg --printsrcinfo > .SRCINFO`

### Verify & format

- You can verify your `PKGBUILD` with:
  - `$ namcap PKGBUILD`
  - `$ shellcheck --shell=bash --exclude=SC2034,SC2154 PKGBUILD`
- You can verify your package with:
  - `$ namcap elgato-keylight-X.X.X-Y-x86_64.pkg.tar.zst`

### Hooks

```bash
cp update_srcinfo.sh .git/hooks/pre-commit
```

## Push changes

See <https://wiki.archlinux.org/title/AUR_submission_guidelines#Authentication>

- `$ git remote add aur ssh://aur@aur.archlinux.org/elgato-keylight.git`
