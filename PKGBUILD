# Maintainer: LabRicecat <labricecat@duck.com>
pkgname='mkfh-git'
pkgver='1.0'
pkgrel=1
pkgdesc="Make File Hierarchy"
arch=('any')
url="https://codeberg.org/LabRicecat/mkfh"
license=('MIT')
provides=('mkfh')

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
