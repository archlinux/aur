# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=freedink-data
pkgver=1.08.20140901
pkgrel=2
pkgdesc="Free game data for GNU freedink"
arch=('any')
url="http://www.freedink.org/"
license=('GPL' 'custom')
source=(ftp://ftp.gnu.org/gnu/freedink/$pkgname-$pkgver.tar.gz)
sha256sums=('5797a6e3a8d407cc46080206a0f18265231d6cf912b2b3dfc4607cf79052c111')

package() {
   cd $startdir/src/$pkgname-$pkgver/
   make install DESTDIR=$pkgdir PREFIX=/usr || return 1
}

