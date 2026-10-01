publish tagname:
  sed -i 's/pkgver=.*/pkgver="{{tagname}}"/' PKGBUILD
  sed -i '/^sha256sums=.*/d' PKGBUILD
  makepkg -g >> PKGBUILD
  makepkg --printsrcinfo > .SRCINFO
  git add .
  git commit -m 'v{{tagname}}'
  git push
