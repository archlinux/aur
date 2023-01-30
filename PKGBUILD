# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: xgdgsc<xgdgsc at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=opencv-docs
pkgver=4.7.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library docs"
arch=('any')
license=('BSD')
url="http://opencv.org/"

source=("$pkgname-$pkgver.tar.xz::https://docs.opencv.org/$pkgver.tar.xz")
sha256sums=('0d51c113523c06a3f88adc31ef51cc7a956d69fde472ec98313cc65332866f27')

build() {
  cd "$srcdir/$pkgver"
}

package() {
  cd "$srcdir/$pkgver"
  mkdir -p "$pkgdir/usr/share/doc/opencv/html"
  cp -r * "$pkgdir/usr/share/doc/opencv/html/"
}

# vim:set ts=2 sw=2 et:
