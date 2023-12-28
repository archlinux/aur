# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: xgdgsc<xgdgsc at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=opencv-docs
pkgver=4.9.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library docs"
arch=('any')
license=('BSD')
url="http://opencv.org/"

source=("$pkgname-$pkgver.tar.xz::https://docs.opencv.org/$pkgver.tar.xz")
sha256sums=('259d8335ae1ceae1f084481d7e7f46202cfa1443a9d59f790ba595d922adf334')

build() {
  cd "$srcdir/$pkgver"
}

package() {
  cd "$srcdir/$pkgver"
  mkdir -p "$pkgdir/usr/share/doc/opencv/html"
  cp -r * "$pkgdir/usr/share/doc/opencv/html/"
}

# vim:set ts=2 sw=2 et:
