# Maintainer: éclairevoyant

pkgname=ascii-image-converter
pkgver=1.12.0
pkgrel=1
pkgdesc="A command-line tool that converts images into ascii art and prints them out onto the console"
arch=('x86_64')
url="https://github.com/TheZoraiz/ascii-image-converter"
license=('Apache')
makedepends=('go')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheZoraiz/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bdecf5b41075e261aed47284c6ed14409ba7708bfc0b85d156e946b22162f2be')

build() {
  cd $pkgname-$pkgver
  go build
}

package() {
  install -Dm755 $pkgname-$pkgver/ascii-image-converter -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
