# Maintainer: Sukanka <su975853527@gmail.com>

pkgname=mpfrc++
pkgver=3.7.0
pkgrel=1
pkgdesc='Multiple-precision floating-point library  for C++'
arch=(any)
url='http://www.holoborodko.com/pavel/'
license=(GPL3)
depends=('mpfr')
provides=('mpreal')
source=("https://github.com/advanpix/mpreal/archive/mpfrc++-${pkgver}.tar.gz")
sha256sums=('1a9209ca4e768bc52b6087710a2bebbfb9640f5134482f1cea252b43870fc4f1')


package() {
  cd mpreal-mpfrc-$pkgver
  install -Dm644 mpreal.h $pkgdir/usr/include/mpreal.h
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  rm mpreal.h
  mv * $pkgdir/usr/share/doc/${pkgname}
}
