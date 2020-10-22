# Maintainer: Sematre <sematre at gmx dot de>
pkgname=asem51-bin
pkgver=1.3
_pkgver=1.3-2
pkgrel=1
pkgdesc="A two-pass macro assembler for the Intel MCS-51 family of microcontrollers."
arch=('i386' 'x86_64')
url="http://plit.de/asem-51/"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("http://plit.de/asem-51/${pkgname%-bin}_${_pkgver}_i386.deb")
md5sums=('e504c8ea6d2e26019590e3a45ac2230c')

package() {
	tar xf data.tar.gz -C "${pkgdir}"
	install -Dm644 "${pkgdir}/usr/local/share/asem-51/${pkgver}/license.doc" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}