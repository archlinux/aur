# Maintainer: Sukanka <su975853527@gmail.com>

pkgname=mpfrc++
pkgver=3.6.9
pkgrel=2
pkgdesc='Multiple-precision floating-point library  for C++'
arch=(any)
url='http://www.holoborodko.com/pavel/'
license=(GPL3)
depends=('mpfr')
provides=('mpreal')
source=("https://github.com/advanpix/mpreal/archive/mpfrc++-${pkgver}.tar.gz")
sha256sums=('7ff631e530778f459d74aff624868a7a2aed91c0f694ed32bd6c3501dc7f8540')


package() {
  cd mpreal-mpfrc-$pkgver
  install -Dm644 mpreal.h $pkgdir/usr/include/mpreal.h
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  rm mpreal.h
  mv * $pkgdir/usr/share/doc/${pkgname}
}
