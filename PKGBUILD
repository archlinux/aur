# Maintainer: John Downey <jdowney@gmail.com>
pkgname=libnss-cache
pkgver=0.20
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
sha256sums=('71324b6035674028a0f39c98aedfbaed94adbcddd72dc1c4ab81308b135dd586')
validpgpkeys=()

build() {
  cd "$pkgname-version-$pkgver"
  make
}

package() {
  cd "$pkgname-version-$pkgver"
  make DESTDIR="$pkgdir/" install
}
