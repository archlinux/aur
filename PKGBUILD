# Maintainer: LabRicecat <labricecat@duck.com>
pkgname='mkfh'
pkgver='1.0'
pkgrel=1
epoch=
pkgdesc="Make File Hierarchy"
arch=('any')
url="https://codeberg.org/LabRicecat/$pkgname"
license=('MIT')
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
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	git clone "https://codeberg.org/LabRicecat/$pkgname.git"
}

build() {
	cd "$pkgname"
    make
}

package() {
	cd "$pkgname"
	sudo make install
}
