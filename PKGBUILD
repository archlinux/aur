# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=freedink-data
pkgver=1.08.20140901
pkgrel=1
pkgdesc="Free game data for GNU freedink"
arch=('any')
url="http://www.freedink.org/"
license=('GPL' 'custom')
source=(ftp://ftp.gnu.org/gnu/freedink/$pkgname-$pkgver.tar.gz)
md5sums=('5ef494109cecb5e8d07515953c61f825')

package() {
   cd $startdir/src/$pkgname-$pkgver/
   make install DESTDIR=$pkgdir PREFIX=/usr || return 1
}

