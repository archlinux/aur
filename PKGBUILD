# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.3
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}-amd64.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('68bca3b935d4aec5eb2659fb07babf3cdc08728de33cf900ddff90d88160d95e')

package() {
	cd "${srcdir}"
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
