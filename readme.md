# Biscuit

## Always

Generate .SRCINFO

`makepkg --printsrcinfo > .SRCINFO`

## release package

``` bash

makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "useful commit message"
git push aur master

```
