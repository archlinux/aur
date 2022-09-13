# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.2
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ec69223790f45534a160efc61d96774a201e2c1d816067fc2c9aa1e668035c43')
sha256sums_i686=('cb57ff85c759fe6dee068d4ca6beb4c5db42db5c02ffd053538a2bdcef23bd42')

package() {
	cd "${srcdir}"
	
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
