# -*- mode:sh -*-

# Maintainer: Alejandro Barocio A. <abarocio80@gmail.com>
pkgname=pacslim-git
pkgver=0.1.1
pkgrel=26
epoch=
pkgdesc="Put your system on package diet."
arch=(any)
url="https://gitlab.com/abarocio80/pacslim"
license=('GPL3')
groups=()
depends=("pacman")
makedepends=("make")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "pacslim"
	DESTDIR="$pkgdir/" PREFIX="/usr" make
}

package() {
	cd "pacslim"
	DESTDIR="$pkgdir/" PREFIX="/usr" make install
}
