# Maintainer: Sukanka <su975853527@gmail.com>

pkgname=mpfrc++
pkgver=3.6.8
pkgrel=1
pkgdesc='Multiple-precision floating-point library  for C++'
arch=(x86_64)
url='http://www.holoborodko.com/pavel/'
license=(GPL3)
depends=('mpfr')
provides=('mpreal')
source=("https://github.com/advanpix/mpreal/archive/mpfrc++-${pkgver}.tar.gz")
sha256sums=('2b10063a1b0f6b1e2c3b02ac948152d18eaf3d8893dff296b40e226ba7ed062b')


package() {
  cd mpreal-mpfrc-$pkgver
  install -Dm644 mpreal.h $pkgdir/usr/include/mpreal.h
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  rm mpreal.h
  mv * $pkgdir/usr/share/doc/${pkgname}
}
