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

`namcap` shows some errors and warnings thougt, but I can't figure out what I can ignore and what I shound fix. This is
the current warnings:

```
medivia E: ELF files outside of a valid path ('opt/').
medivia W: ELF file ('opt/medivia/libfmod.so.11') has executable stack.
medivia W: ELF file ('opt/medivia/libfmod.so.11') lacks FULL RELRO, check LDFLAGS.
medivia W: ELF file ('opt/medivia/medivia') lacks FULL RELRO, check LDFLAGS.
medivia W: ELF file ('opt/medivia/medivia') lacks PIE.
medivia E: unknown is not a common license (it's not in /usr/share/licenses/common/)
medivia W: Referenced library 'libfmod.so.11' is an uninstalled dependency
```

This is my first package, so any criticism and suggestions is appreciated.
