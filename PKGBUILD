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
depends=('curl>=1.0.0' 'unzip>=3.0.0' 'tar>=1.0' 'ncurses>=4.0.0')
makedepends=('make>=3.0.0')
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
md5sums=()
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	sudo make install
}

uninstall() {
	sudo rm -rf /usr/bin/marvin
	sudo rm -rf /usr/share/marvin
}
