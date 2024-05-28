# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ab5_x <lxl66566@gmail.com>
pkgname=tdl-bin
pkgver=0.17.0
pkgrel=2
pkgdesc="A Telegram downloader/tools written in Golang"
arch=(
	'aarch64'
	'armv7h'
	'i686'
	'x86_64'
)
url="https://docs.iyear.me/tdl"
_ghurl="https://github.com/iyear/tdl"
license=("AGPL-3.0-or-later")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_armv7.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_32bit.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_64bit.tar.gz")
sha256sums_aarch64=('2c34a9255ae7a79a6cac0c74dd72e79d539813f4f39c4f904f940b44b2b30bb5')
sha256sums_armv7h=('ea7a126b120682e8130dbe87e07e790c2d9cc5bc41c8ba464cd27d3b5e5f7062')
sha256sums_i686=('f5894dddf44f9d848d051853299429b7397ff1d07ba91738977c3f72e8a98d3e')
sha256sums_x86_64=('2d9ac6d36530ba08da44572447120691f5487443a1eb65be189850ddaa6d6c7d')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}