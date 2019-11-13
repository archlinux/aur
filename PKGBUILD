# Maintainer: Hinerk <hinerk.stender@mail.de>

pkgname=newtonwars
arch=('any')
pkgdesc='turn-based strategic shooter with lots of gravity'
pkgver=1
pkgrel=2
url='https://github.com/Draradech/NewtonWars'
depends=('freeglut')

source=('https://github.com/Draradech/NewtonWars/archive/master.zip')
sha256sums=('8fa0e5f53fce3eb862dd95aa6c8d8debc4dddf327e15733d9652d92403b388b2')

build() {
	cd ${srcdir}/NewtonWars-master
	./build-linux.sh
}

package() {
	install -D ${srcdir}/NewtonWars-master/nw ${pkgdir}/usr/bin/nw
}
