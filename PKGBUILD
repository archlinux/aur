# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lowcharts-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.8
pkgrel=3
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('85b2a7e6d122ad7c0d7a1cfb463143d57081c7c23e36dfd3b54042f198f66484')
sha256sums_i686=('bae75ea25bfe1b89ca0db42c8986f250a4ba392ff8192de70bf6e2eac0584a3f')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
