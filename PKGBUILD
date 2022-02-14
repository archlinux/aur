# Maintainer: Leontios Mavropalias
# Contributor: Leontios Mavropalias
pkgname=zeitkatze
pkgver=0.1.2
pkgrel=1
pkgdesc="CLI stopwatch with cat ASCII art"
arch=("x86_64")
url="https://github.com/leonmavr/zeitkatze"
license=("MIT")
source=(https://github.com/leonmavr/$pkgname/archive/refs/tags/$pkgver.tar.gz)
sha512sums=("99a9b9e940f6f5a162f6a27907bb1891b9c0274824cd6cb00f966031f93ea330ef1c91f56bfd9f3684e2c76c36d12306ab8f1f41f482dc229837584203ea6f77")

build() {
    cd "${srcdir}/$pkgname-$pkgver"
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  # make install requires make
  make PREFIX="$pkgdir/usr" install
}

