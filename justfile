publish tagname:
  sed -i 's/^pkgver=.*/pkgver="{{tagname}}"/' PKGBUILD
  updpkgsums
  makepkg --printsrcinfo > .SRCINFO
  git add PKGBUILD .SRCINFO
  git commit -m 'v{{tagname}}'
  git push
