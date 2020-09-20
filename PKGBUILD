# Maintainer: John Downey <jdowney@gmail.com>
pkgname=libnss-cache
pkgver=0.17
pkgrel=1
epoch=
pkgdesc="A NSS module for reading directory service information for Linux hosts from an indexed, local disk cache"
arch=("x86_64")
url="https://github.com/google/libnss-cache"
license=("LGPL")
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
source=("https://github.com/google/libnss-cache/archive/version/${pkgver}.tar.gz")
noextract=()
sha256sums=("3777cbc46dc8d08144b99321d1f039718cd347d3be8ed66a8cb3722d3e6692f5")
validpgpkeys=()

build() {
  cd "$pkgname-version-$pkgver"
  make
}

package() {
  cd "$pkgname-version-$pkgver"
  make DESTDIR="$pkgdir/" install
}
