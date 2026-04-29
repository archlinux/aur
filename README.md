# skull-shell-git AUR package

This directory contains the AUR packaging files for `skull-shell-git`.

```sh
makepkg --printsrcinfo > .SRCINFO
makepkg -si
```

To publish, copy `PKGBUILD`, `.SRCINFO`, and `skull-shell.install` into the
`skull-shell-git` AUR repository, then commit and push them there.
