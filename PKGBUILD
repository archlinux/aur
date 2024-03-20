# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.16.1'
pkgrel=2
pkgdesc="LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效"
arch=('any')
url="https://github.com/xiyuesaves/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-lite-tools")
conflicts=("liteloader-qqnt-lite-tools")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('d648964375ee1b0afe82fcfa4ac4f0930dfb844dd1a32b6da61442c434402a96')
b2sums=('d805f09525e59b7f7ad9e349dd56ab28e8c5fa429506b53c3d553bafd2f12643347ed4a33f4d26e10c31889a32cb054fbc24408a936c8bd7cb9d20157c3167c5')

package() {
	mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
	chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
