# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmweather
_appname=wmWeather
pkgver=1.31
pkgrel=3
pkgdesc="Shows local weather conditions in a WindowMaker dockapp"
arch=('i686' 'x86_64')
url="http://www.dockapps.org/file.php/id/17"
license=('GPL')
groups=('x11')
depends=('libxpm')
source=(http://dockapps.windowmaker.org/download.php/id/24/$_appname-$pkgver.tar.gz)
md5sums=('b7982ef0ced0c700d23e152b6ddbd338')

build() {
  cd "$srcdir/$_appname-$pkgver/Src"
  make
}
package() {
  cd "$srcdir/$_appname-$pkgver/Src"
  install -Dm755 $_appname "$pkgdir/usr/bin/$_appname"
}

