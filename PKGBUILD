# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.21.0'
pkgrel=2
pkgdesc='LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效'
arch=('any')
url="https://github.com/xiyuesaves/${_pkgname}"
license=('MIT')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-lite-tools')
conflicts=('liteloader-qqnt-lite-tools')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('95974baae1dbe61f77421f7f9206e244d5c9003852661e3bc4f36f5477769061')
b2sums=('8094f6901f5d1180e46f654e61cee7036c30a7f1391bf670280d81d263732b67f59bcb745c16194d34bd7a46fff44b66531ea6eb1951589ac656cfa7d73b1dce')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
