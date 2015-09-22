# Maintainer: brent s. <bts (AT) square-r00t [dot] net>
pkgname=libyuv
pkgver=0.000001
pkgrel=1
pkgdesc="A library for YUV scaling"
arch=('i686' 'x86_64')
url="https://github.com/lemenkov/libyuv"
license=('custom')
#depends=('')
#optdepends=('')
#install=$pkgname.install
#source=(
#md5sums=(

build() {
  cd "$srcdir/$pkgname$pkgver/src/current"
}

package() {
  cd "$srcdir/$pkgname$pkgver/src/current"
  make DESTDIR="$pkgdir" install
}
