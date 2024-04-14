# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.23.4'
pkgrel=2
pkgdesc='LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效'
arch=('any')
url="https://github.com/xiyuesaves/${_pkgname}"
license=('MIT')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-lite-tools')
conflicts=('liteloader-qqnt-lite-tools')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('5272a0c27cbd39b1763f0ebf229b0029117c2bfd80c6d108a7ddf53441a2dc0e')
b2sums=('94ccee323fa75487ea05c2f0db1ed9adc8314c83bd9a0cefd2cec162775b2eae86fa0bd9a073c97937b03df43dbec9a039bdbe63df97ddc24d5a51483470c0e5')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
