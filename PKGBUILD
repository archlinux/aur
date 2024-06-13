# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.29.6'
pkgrel=2
pkgdesc='LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效'
arch=('any')
url="https://github.com/xiyuesaves/${_pkgname}"
license=('MIT')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-lite-tools')
conflicts=('liteloader-qqnt-lite-tools')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('6859fabac84236ea069e4b81b77471f01dc4ac01a4d4601b2081d84f2e9d2e3a')
b2sums=('1a68d3d0ae91978b14af6a8580b72596491d852f6404724681dcd622849cf1a8caa8e8f39ce417522634501d7f08aa0511dbb316b4eebad67a80190307553ecb')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
