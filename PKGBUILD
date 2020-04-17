# Maintainer: Govind K <theamazingndnivog@outlook.com>

pkgname=marvin_dsc
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A minimalist software which helps in setting up an android development environment."
arch=('x86_64')
url="https://github.com/Roidujeu/easy-android-sdk"
license=('MIT')
groups=()
depends=('curl' 'unzip' 'ncurses')
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
source=("$pkgname-$pkgver.tar.xz")
noextract=()
sha256sums=('004853f3075986b9d7427f0c763f894c2ce155f4d1d1c6028691e738ca56ca24')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	sudo make install
}
