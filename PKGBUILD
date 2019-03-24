# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=tokentool-bin
_pkgname=tokentool
pkgver=2.0
pkgrel=2
pkgdesc="A Token creation tool to create png images suitable for Virtual Table Tops."
arch=('x86_64')
url="http://rptools.net"
license=('AGPL3')
provides=('tokentool')
conflicts=('tokentool')
source=("https://github.com/RPTools/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.deb")
sha256sums=('25aa5f9653c9c1a7dea4498771c963b1a82efb25e8c28682a5687d96e1d9e366')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/${_pkgname}/runtime/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/runtime/COPYRIGHT" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
