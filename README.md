There is the commands I used to create and check the package:

```
updpkgsums
gendesk PKGBUILD
namcap PKGBUILD
makepkg -f
pacman -Qip medivia-2.4.0-1-x86_64.pkg.tar.xz
pacman -Qlp medivia-2.4.0-1-x86_64.pkg.tar.xz
namcap medivia-2.4.0-1-x86_64.pkg.tar.xz
makepkg --printsrcinfo > .SRCINFO
```

`namcap` shows some errors and warnings thougt, but I can't figure out what I can ignore and what I shound fix.

This is my first package, so any criticism and suggestions is appreciated.
