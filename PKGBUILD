# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.2R1
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}-amd64.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('04e92fc973855c512c0bca661b2cd070b20ff627d3db4991836955c05f842d9a')

package() {
	cd "${srcdir}"
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
