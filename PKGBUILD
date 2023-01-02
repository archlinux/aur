# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.0
pkgrel=2
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}-amd64.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('93416eea4924d9b8da002e99651687f145239ffdffc6689d92b71b72c57f2edc')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
