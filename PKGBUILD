# Maintainer: Sukanka <su975853527@gmail.com>

pkgname=mpfrc++
pkgver=3.7.1
pkgrel=1
pkgdesc='Multiple-precision floating-point library  for C++'
arch=(any)
url='http://www.holoborodko.com/pavel/'
license=(GPL3)
depends=('mpfr')
provides=('mpreal')
source=("https://github.com/advanpix/mpreal/archive/mpfrc++-${pkgver}.tar.gz")
sha256sums=('f83b4a850e6f93e7770286fd615a656142d6ca856768e2c43a72df2d077e939b')

package() {
  cd mpreal-mpfrc-$pkgver
  install -Dm644 mpreal.h $pkgdir/usr/include/mpreal.h
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  rm mpreal.h
  mv * $pkgdir/usr/share/doc/${pkgname}
}
