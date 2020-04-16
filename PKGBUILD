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
sha256sums=('62a34fa0906b1298e191ed599914ce6c45565f8581a21f1e6226bbb900b90cd5')
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
