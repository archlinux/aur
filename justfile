publish tagname:
  sed -i 's/pkgver=.*/pkgver="{{tagname}}"/' PKGBUILD
  sed -i 's/\nsha256sums=.*//' PKGBUILD
  makepkg -g >> PKGBUILD
  makepkg --printsrcinfo > .SRCINFO
  git add .
  git commit -m 'v{{tagname}}'
  run git push
