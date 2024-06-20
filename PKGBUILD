# Maintainer: Logicle (LogicleQ) <logiclight123@yahoo.com>

pkgname="lettercell-git"
pkgver="1.0.0"
pkgrel="2"
pkgdesc="An esoteric programming language which looks like a jumble of letters."
arch=("x86_64" "arm")
license=("MIT")
source=("https://github.com/LogicleQ/lettercell")
sha256sums=('SKIP')

build(){
	mkdir ${srcdir}/git
	cd ${srcdir}/git
	git clone ${source}
	cd lettercell
	make build
}

package(){
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/git/lettercell/lettercell ${pkgdir}/usr/bin/
}

