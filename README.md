# declan-setup AUR package

Tiny Arch package that installs the `declan-setup` command.

The command clones or updates:

```text
https://github.com/dclnc/declan-dotfiles.git
```

Then it runs that repository's `bootstrap.sh`.

## Local build

```bash
makepkg -si
```

## Publish to AUR

```bash
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO declan-setup
git commit -m "Initial import"
git push aur master
```
