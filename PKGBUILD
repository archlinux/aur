# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ab5_x <lxl66566@gmail.com>
pkgname=tdl-bin
pkgver=0.17.2
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
sha256sums_aarch64=('3f84026e3d75505cbbb1693b842a39cbc6d060731aac17bcbce49f66c7861328')
sha256sums_armv7h=('2ed3886320f010733368297a8ec5c18495ca98c5cf9573f5006ae928c4ba5ede')
sha256sums_i686=('b85863f40aa910358e9f02ea4296bc60a220d7093a0f82ef5364df38a3c09c56')
sha256sums_x86_64=('71fa7497c9ef6bbaaf939d2a980abc23f4a91242cbd83c59459da9edf288585f')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}