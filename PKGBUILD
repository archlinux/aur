# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sirocco
pkgver=2.0
pkgrel=1
pkgdesc="C++ library that allows to compute piecewise linear approximations of the path followed by the root of a complex polynomial"
arch=(i686 x86_64)
url="https://iuma.unizar.es/es/investigacion/software/sirocco"
license=(GPL3)
depends=(mpfr)
source=("https://iuma.unizar.es/sites/default/files/software/libsirocco-$pkgver.tar_.gz")
md5sums=('e3e775144ae2bf66eed0066e98e167e9')

build() {
  cd libsirocco-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd libsirocco-$pkgver
  make DESTDIR="$pkgdir" install
}

