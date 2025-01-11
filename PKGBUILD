# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: xgdgsc<xgdgsc at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=opencv-docs
pkgver=4.11.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library docs"
arch=('any')
license=('BSD')
url="http://opencv.org/"

source=("$pkgname-$pkgver.tar.xz::https://docs.opencv.org/$pkgver.tar.xz")
sha256sums=(52c8eeb8cd2cb3b6b77007c7a5f13a312b8b194ad0d92c136368c8ddbe758af9)

build() {
  cd "$srcdir/$pkgver"
}

package() {
  cd "$srcdir/$pkgver"
  mkdir -p "$pkgdir/usr/share/doc/opencv/html"
  cp -r * "$pkgdir/usr/share/doc/opencv/html/"
}

# vim:set ts=2 sw=2 et:
