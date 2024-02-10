# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lowcharts-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.9
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4d6162734fd316a2385fe8b36f1ba6eff58fe5a4893c4a3efe8b1fb92384d8a4')
sha256sums_i686=('0cc220e374672e1ef3ddd0c112873355c41a15d4aefa41994a253a1a086b1a14')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
