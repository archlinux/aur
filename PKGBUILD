# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("usage-$pkgver.tar.gz::https://github.com/jdx/usage/releases/download/v$pkgver/usage-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('1d0d883e9f07082423e75e9fa785798e2bf921c8eec230b3eb6181d1c0e13863a4d589bf0ed541f230c1b722ffef6eb7950f81d022f96bc3d5f89b84aee2c9be')

build() {
  cd "$srcdir/"
}

package() {
  cd "$srcdir/"
  install -Dm755 usage "$pkgdir/usr/bin/usage"
}

check() {
  "$srcdir/usage" --version
}
