# Maintainer: éclairevoyant

pkgname=ascii-image-converter
pkgver=1.13.0
pkgrel=1
pkgdesc="A command-line tool that converts images into ascii art and prints them out onto the console"
arch=('x86_64')
url="https://github.com/TheZoraiz/ascii-image-converter"
license=('Apache')
makedepends=('go')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheZoraiz/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9774374d6d3e0504bba70e2499b5472a216c93c61a0cafd0265ae47e9c7c5e5')

build() {
  cd $pkgname-$pkgver
  go build
}

package() {
  install -Dm755 $pkgname-$pkgver/ascii-image-converter -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
