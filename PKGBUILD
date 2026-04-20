pkgname=cpp-ps1
pkgver=1.0.3
pkgrel=2
pkgdesc='C++ base PS1 function, useful for programmers'
arch=('x86_64')
url='https://github.com/Emiliopg91/cpp-ps1'
license=('GPL-2')
depends=(
  'git'
)
makedepends=(
  'clang'
  'cmake'
)
source=(
  "git+$url.git#tag=$pkgver-$pkgrel"
)
sha256sums=(
  'SKIP'
)
install=${pkgname}.install

build() {
  cd "$srcdir/cpp-ps1"
  make build
}

package() {
  cd "$srcdir/cpp-ps1"

  install -Dm755 build/cpp-ps1 "$pkgdir/usr/bin/cpp-ps1"
}