# AUR sveltosctl binary

CLI tool for [project sveltos](https://projectsveltos.github.io/sveltos/)


## build
```bash
makepkg --printsrcinfo > .SRCINFO
makepkg -g >> PKGBUILD # replace ssha256sums
makepkg -Sifc
```
