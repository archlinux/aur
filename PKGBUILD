# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=eqmodgui
pkgver=1.7.1
pkgrel=1
_pkgrev=149
pkgdesc="User interface for INDI Eqmod telescope driver"
arch=('x86_64')
url="https://sourceforge.net/projects/eqmodgui"
license=('GPL3')
depends=('libindi' 'gtk2' 'sdl_mixer' 'pango')
provides=('eqmodgui')
md5sums=('ecc583f1397d0dd7a0877f6e2edcbeac')

source=("https://sourceforge.net/projects/eqmodgui/files/eqmodgui_$pkgver/eqmodgui-$pkgver-${_pkgrev}-linux_${arch}.tar.xz")

package() {
	mkdir "${pkgdir}"/usr/
	tar -xf "${srcdir}/eqmodgui-$pkgver-${_pkgrev}-linux_${arch}.tar.xz" --strip 1 -C "${pkgdir}/usr/"
	chown -R root:root "${pkgdir}/usr/"
}
