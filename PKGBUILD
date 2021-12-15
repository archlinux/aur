# Maintainer: Ahmed ES <ahmed.es.egypt@gmail.com>
pkgname=('vramsteg-git')
pkgver=1
pkgrel=1
pkgdesc="A command line utility that provides shell scripts with a full-featured progress indicator."
provides=('vramsteg')
arch=('x86_64')
url="https://github.com/mogaal/vramsteg"
license=('MIT')
makedepends=('git' 'cmake')
source=("git+https://github.com/mogaal/vramsteg.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/vramsteg"
	cmake .
	make
}

package() {
	cd "$srcdir/vramsteg"
	sudo make install
}
