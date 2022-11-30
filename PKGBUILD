# Maintainer: Your Name <finitodoer@bureau.eu.org>
pkgname=finitodo
pkgver=2.0
pkgrel=2
pkgdesc="Finitodo is a simple yet versatile graphical task / todo list manager for Linux."
arch=(x86_64)
url="git://gitlab.com/finitodo/finitodo.git"
license=('GPL')
depends=(gtk3)
makedepends=(git make)
optdepends=()
provides=(finitodo)
source=('git+https://gitlab.com/finitodo/finitodo.git')
md5sums=('SKIP')

build() {
	cd finitodo
	make
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	install -m 755 finitodo/finitodo ${pkgdir}/usr/bin
}
