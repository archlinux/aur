# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.7
pkgrel=3
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4b158befe343ba29948a2e58bd636d78a44a42f23508af3024e5ac1a66283e7b')
sha256sums_i686=('6ec10ad5535003f46b908b96f23404d6e2b3241c0cb90e7c36ae34ecf280f04a')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
