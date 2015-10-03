# Maintainer: CyrIng <labs[at]cyring[dot]fr>
# Contributor: CyrIng <labs[at]cyring[dot]fr>
pkgname=coremod-git
pkgver=1.1.6
pkgrel=1
pkgdesc="System information of the Intel Core Processor, BIOS, and RAM"
arch=('x86_64')
url="http://github.com/cyring/CoreMod"
license=('GPL2')
makedepends=('git')
source=("git+https://github.com/cyring/CoreMod.git")
md5sums=('SKIP')

_gitname=CoreMod

build() {
	cd ${srcdir}/${_gitname}
	make
}

package() {
	cd ${srcdir}/${_gitname}
	install -Dm755 bin/coremod "${pkgdir}/usr/bin/coremod"
}
