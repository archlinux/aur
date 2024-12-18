# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("usage-$pkgver.tar.gz::https://github.com/jdx/usage/releases/download/v$pkgver/usage-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('62a89199410fa137f15979a85acd255579d1b41d9d87f444803c011d4a94f3f7839b4ec3df46d29365ced9c85a2d427e9b50377bb8055076c52bd9c8169abed9')

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
