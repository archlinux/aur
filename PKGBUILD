# Maintainer: kalter@deadsoftware.ru

pkgname=bashimget
pkgver=1.1
pkgrel=1
pkgdesc="Simple reader bash.im written in Java"
arch=('i686' 'x86_64')
url="https://bitbucket.org/kalterfive/bashimget"
depends=('jdk8-openjdk')
makedepends=('git'
             'jdk8-openjdk')
source=("git+https://bitbucket.org/kalterfive/bashimget")
md5sums=('SKIP')

build() {
	cd "${srcdir}/bashimget"
	make
}

package() {
	cd "${srcdir}/bashimget"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
