# Maintainer: LabRicecat <labricecat@duck.com>
pkgname='mkfh-git'
pkgver='1.0'
pkgrel=1
epoch=
pkgdesc="Make File Hierarchy"
arch=('any')
url="https://codeberg.org/LabRicecat/mkfh"
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
	git clone "https://codeberg.org/LabRicecat/mkfh.git"
}

build() {
	cd "mkfh"
    make
}

package() {
	cd "mkfh"
	sudo make install
}
