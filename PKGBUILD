# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=zek-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Generate a Go struct from XML"
arch=('x86_64')
url='https://github.com/miku/zek'
license=('GPL-3.0')
provides=('zek')
source=("https://github.com/miku/zek/releases/download/v${pkgver}/zek_${pkgver}_amd64.deb")
md5sums=('209edfd497230c80663165fca98ede05')

package() {
	cd "${srcdir}"
	tar xf data.tar.xz -C "${pkgdir}"
	cd ${pkgdir}/usr
	mv sbin bin
	chmod 755 bin/zek
}