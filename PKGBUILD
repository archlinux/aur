# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ab5_x <lxl66566@gmail.com>
pkgname=tdl-bin
pkgver=0.17.3
pkgrel=1
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
sha256sums_aarch64=('50d79dff418d88c41b5b94e39ee88a7bbab7fd2b51ce2f1e5cb40a3bfe1aedb4')
sha256sums_armv7h=('7482f63031f31cf3dfccf9a598fe1693ebf91e8efa8904d30224c93cb83f0397')
sha256sums_i686=('ea0eef92ee9eefdd1cebb3764059058e1b9829b3ef1ca8d60b7449fed3f9beba')
sha256sums_x86_64=('080f423960562c85ebc62175f9ee982e04fe747394bf942f13128e2c5b445919')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}