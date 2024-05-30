# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ab5_x <lxl66566@gmail.com>
pkgname=tdl-bin
pkgver=0.17.1
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
sha256sums_aarch64=('44b6e283cd977899468b2953e621fbb7d6849391a104a79a72f2be0df1e18d50')
sha256sums_armv7h=('d656cd48f12b8c3c984e63534bce3f7f86c3e915639dc3f839461bb038b416b6')
sha256sums_i686=('7968835bc32e8ba0d4b128d07d570e6296ce416c5247608f8b783f4be0ac12c9')
sha256sums_x86_64=('aa553b3109cb1bf7320a0e125de0c08e76c29ef9690ef6a7e0208374b3a73b93')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}