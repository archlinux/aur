# Maintainer: John Downey <jdowney@gmail.com>
pkgname=libnss-cache
pkgver=0.16
pkgrel=1
epoch=
pkgdesc="A NSS module for reading directory service information for Linux hosts from an indexed, local disk cache"
arch=("x86_64")
url="https://github.com/google/libnss-cache"
license=("GPL")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/google/libnss-cache/archive/version/0.16.tar.gz")
noextract=()
sha256sums=("09099ce2a3becb9cc4c282f7809198ac9707929dbc767030e32da8b824110bfe")
validpgpkeys=()

build() {
  cd "$pkgname-version-$pkgver"
  make
}

package() {
  cd "$pkgname-version-$pkgver"
  make DESTDIR="$pkgdir/" install
}
