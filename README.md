There is the commands I used to create and check the package.

```sh
# update checksums in the PKGBUILD
updpkgsums
# check pkgbuild
namcap PKGBUILD
makepkg -f
# checking by own eyes that all is as expected
pacman -Qip hunspell-multilingual-ru-en-*.zst
pacman -Qlp hunspell-multilingual-ru-en-*.zst
# check package
namcap hunspell-multilingual-ru-en-*.zst
# Update SRCINFO
makepkg --printsrcinfo > .SRCINFO
```
