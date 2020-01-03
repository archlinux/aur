# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=wallpaper-lightning
pkgver=1
pkgrel=6
pkgdesc="'Lightning' wallpaper that used to be included in kdeartwork-weatherwallpapers"
arch=('any')
url="https://www.opendesktop.org/c/1460899771"
license=('GPL')
source=('https://dllb2.pling.com/api/files/download/id/1460899772/s/9e23b59d91cd584071a06f17b833cb8fb324d647b71c097970f24012f4621915e43773bc6bf069b32f70569e4ab95af12c6b8edae65ee442338c0293852e08e7/t/1578021887/c/65b0b189dcb333087222e00ff83551cad3048a36b6551087ad2cf4ff8fa4f25cf1ec5ab4f78fbdd444fc17a0faff8d4750597aa56915d905c9e1f25ccaee3f5e/lt/download/78438-Lightning1920.jpg')
md5sums=('5ec093bbe2b9d1d1c44d61078ea4949b')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/wallpapers/Lightning/
  cp 78438-Lightning1920.jpg $pkgdir/usr/share/wallpapers/Lightning/Lightning1920.jpg
}
