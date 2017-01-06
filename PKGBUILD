# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=bashimget
pkgver=1.1
pkgrel=1
pkgdesc="A simple bash.im reader written in Java"
arch=('i686' 'x86_64')
url="https://bitbucket.org/kalterfive/bashimget"
depends=('java-runtime')
makedepends=('java-environment')
source=("git+https://bitbucket.org/kalterfive/bashimget")
md5sums=('SKIP')

build() {
	cd "$srcdir/bashimget"
	make
}

package() {
	cd "$srcdir/bashimget"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
