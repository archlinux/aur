# Maintainer: Coelacanthus <coelacanthus@outlook.com>

pkgname=puppy-browser
pkgver=0.1.0
pkgrel=1
pkgdesc="An example implementation of a tiny Web browser for educational purposes."
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/lmt-swallow/puppy-browser"
license=('MIT')
groups=()
depends=('gcc-libs' 'ncurses' 'glibc' 'openssl')
makedepends=('cargo')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=${pkgname}.install
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/lmt-swallow/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
#md5sums=()
#sha1sums=()
#sha256sums=()
#sha384sums=()
#sha512sums=()
b2sum=()

prepare() {
  return 0
}

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}

# vim:set ts=2 sw=2 et:

b2sums=('17a2917060402117a216bec2e1404fc782fcc2e8acf6b918e841180abf6e2756b5244d071b0215c83d49133245ea54c23fdb38fd5c129fcc963ebf1a79151afa')
