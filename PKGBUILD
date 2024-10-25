# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage-bin
pkgver=0.11.1
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("usage-$pkgver.tar.gz::https://github.com/jdx/usage/releases/download/v$pkgver/usage-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('d2ce0e9aa340111c5a7eb92699fe4bd4768e23f85d121083a8f6444126c59327366d5f28cce66d388bed004fa7de4a54f9852d8ead9c42a17fda5dac96f85ef5')

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
