# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ab5_x <lxl66566@gmail.com>
pkgname=tdl-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="A Telegram downloader/tools written in Golang.(Prebuilt version)"
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
sha256sums_aarch64=('a135d3708fb16a596ae95640c40a2140f2e1680ae54388dd43d77d65fb431edb')
sha256sums_armv7h=('3c68840e1a302cb26e97baa2f69165dc5b0741bd0c76b01379dbb9b3cbd87398')
sha256sums_i686=('12fba37583af1b0fbda0780fe55a9c199c0aa27d88f47e30efbcfa97721cbff4')
sha256sums_x86_64=('3d9e6f940518673db9b3cd8e743057b75f93b4eca3f3925fb6bfe055c62cebd7')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
