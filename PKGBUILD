# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=tokentool-bin
_pkgname=TokenTool
pkgver=2.1
pkgrel=1
pkgdesc="A Token creation tool to create png images suitable for Virtual Table Tops."
arch=('x86_64')
url="http://rptools.net"
license=('AGPL3')
provides=('tokentool')
conflicts=('tokentool')
source=("https://github.com/RPTools/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.deb")
sha256sums=('0fe9b8bd7be8757e1088640edb1d4f5c78c6c2a2f92ca52639db1a10d1c5d39e')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.AFFERO" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.AFFERO"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/app/COPYING.LESSER" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.LESSER"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
