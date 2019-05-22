There is the commands I used to create and check the package:

1. Update version in PKGBUILD

```
# Генерация desktop файла. Надо описать на основе чего он генерится.
# Сейчас он в целом подходит, но создается иконка по умолчанию, которая не нужна.
gendesk PKGBUILD
# обновляет чексуммы файлов в PKGBUILD
updpkgsums
# check pkgbuild
namcap PKGBUILD
makepkg -f
# checking by own eyes that all is as expected
pacman -Qip medivia-2.4.0-1-x86_64.pkg.tar.xz
pacman -Qlp medivia-2.4.0-1-x86_64.pkg.tar.xz
# check package
namcap medivia-2.4.0-1-x86_64.pkg.tar.xz
# Update SRCINFO
makepkg --printsrcinfo > .SRCINFO
```

`namcap` shows some errors and warnings thougt, but I can't figure out what I can ignore and what I shound fix.

This is my first package, so any criticism and suggestions is appreciated.
