# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=wallpapers-altlinuxclub
pkgver=1.0
pkgrel=1
pkgdesc="Wallpapers for Alt Linux Active Users Club"
arch=('i686' 'x86_64')
url="http://forum.russ2.com/index.php?showtopic=3227"
source=("http://altlinuxclub.ru/arhiv/wallpapers.tar.bz2")
md5sums=('b1d1b7fb0cb45341578d3d516b29f596')
license=('GPL2')

package() {
  cd "$srcdir/wallpapers"
  mkdir -p $pkgdir/usr/share/backgrounds/altlinuxclub
  cp -r *.jpg $pkgdir/usr/share/backgrounds/altlinuxclub/
}

