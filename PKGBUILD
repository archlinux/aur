# Maintainer: TDY <tdy@gmx.com>

pkgname=meteorite
pkgver=0.11
pkgrel=1
pkgdesc="A Matroska/MKV repair engine"
arch=('i686' 'x86_64')
url="http://meteorite.sourceforge.net/"
license=('GPL')
depends=('wxgtk')
source=(http://downloads.sourceforge.net/$pkgname/Meteorite-v$pkgver-src.tar.bz2)
md5sums=('9f608eee5a8f355beb8b59fb7e0a8718')

build() {
  cd "$srcdir/Meteorite"
  make
}

package() {
  cd "$srcdir/Meteorite"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
