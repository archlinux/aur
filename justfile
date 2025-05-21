publish tagname:
  sd 'pkgver=.*' 'pkgver="{{tagname}}"' PKGBUILD
  sd '\nsha256sums=.*' '' PKGBUILD
  makepkg -g >> PKGBUILD
  makepkg --printsrcinfo > .SRCINFO
  git add .
  git commit -m 'v{{tagname}}'
  # run git push
