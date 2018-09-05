# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=wallpaper-lightning
pkgver=1
pkgrel=5
pkgdesc="'Lightning' wallpaper that used to be included in kdeartwork-weatherwallpapers"
arch=('any')
url="https://www.opendesktop.org/c/1460899771"
license=('GPL')
source=('https://dl.opendesktop.org/api/files/download/id/1460899772/s/5473a38a7c69dcacd18c5e4bb1854d4c/t/1536188456/u/78438-Lightning1920.jpg')
md5sums=('5ec093bbe2b9d1d1c44d61078ea4949b')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/wallpapers/Lightning/
  cp 78438-Lightning1920.jpg $pkgdir/usr/share/wallpapers/Lightning/Lightning1920.jpg
}
