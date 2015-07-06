# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=xanalyser
pkgver=1.32
pkgrel=1
pkgdesc="A program to analyse a stereo audio signal."
arch=('i686' 'x86_64')
url="http://arvin.schnell-web.net/xanalyser"
license=('GPL')
depends=('alsa-lib' 'lesstif')
source=($url/$pkgname-$pkgver.tar.bz2)
md5sums=('400a3035b5a1f893b97e205c6c6ea3fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
