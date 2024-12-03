# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage-bin
pkgver=1.3.4
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("usage-$pkgver.tar.gz::https://github.com/jdx/usage/releases/download/v$pkgver/usage-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('038069dcfb7290a6a827f9a9bb720e905d16218d96349efcb2bf385d019ef06b2b97dc21f4b3898079ddfb0399bea588aabb0ff69935b2e11af539c3b18c115a')

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
