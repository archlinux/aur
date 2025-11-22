# Maintainer: Sukanka <su975853527@gmail.com>

pkgname=mpfrc++
pkgver=3.7.2
pkgrel=1
pkgdesc='Multiple-precision floating-point library  for C++'
arch=(any)
url='http://www.holoborodko.com/pavel/'
license=(GPL3)
depends=('mpfr')
provides=('mpreal')
source=("https://github.com/advanpix/mpreal/archive/mpfrc++-${pkgver}.tar.gz")
sha256sums=('5e31deda0809da078bff43eda7d1117545818f4704f97289c92c34b6f91c2923')

package() {
  cd mpreal-mpfrc-$pkgver
  install -Dm644 mpreal.h $pkgdir/usr/include/mpreal.h
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  rm mpreal.h
  mv * $pkgdir/usr/share/doc/${pkgname}
}
