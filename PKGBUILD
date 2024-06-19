# Maintainer: Logicle (LogicleQ) <logiclight123@yahoo.com>

pkgname="lettercell-git"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="An interpreter for the LetterCell esoteric programming language."
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

