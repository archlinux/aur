pkgname=microcom
pkgver=2014.09.0
pkgrel=1
pkgdesc="terminal emulator"
arch=('i686' 'x86_64')
license=('GPL')
url='http://git.pengutronix.de/?p=tools/microcom.git'
source=("git://git.pengutronix.de/git/tools/microcom.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 microcom "${pkgdir}/usr/bin/microcom"
}
