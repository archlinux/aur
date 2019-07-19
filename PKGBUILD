# Maintainer: Jean-Luc Juganniere <jljug@hotmail.com>
pkgname=xpuz-arch
_pkgname=xpuz-arch
pkgver=2.5
pkgrel=1
pkgdesc="This is a is a fork of xjig 2.5, the jigsaw puzzle."
arch=('x86_64')
url=" https://sourceforge.net/projects/xpuz/"
license=('GPL')
makedepends=('git' 'libx11' 'libjpeg-turbo')
depends=('libx11' 'libjpeg-turbo')
source=("$pkgname::git+https://github.com/JeanLucJFr/$_pkgname.git")
md5sums=(SKIP)

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
