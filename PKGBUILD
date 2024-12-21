# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage-bin
pkgver=1.7.3
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("usage-$pkgver.tar.gz::https://github.com/jdx/usage/releases/download/v$pkgver/usage-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('d7bc64f283696eef0f8b9c93d934c7f23ca8616a6a110ea1b7f36a167978ce59a72ec197a8c9004adbb412c4fb09b9da02f4978016c5c1cf025dc0b945b65f89')

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
