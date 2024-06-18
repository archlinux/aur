# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.30.1'
pkgrel=2
pkgdesc='LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效'
arch=('any')
url="https://github.com/xiyuesaves/${_pkgname}"
license=('MIT')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-lite-tools')
conflicts=('liteloader-qqnt-lite-tools')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('df1fb7cbe93698814be3b139dd4473dbfd524f45fe1730c3aabf59aa2c885082')
b2sums=('f78c5837f4d3124a55951df6b8cf48848d5bef399f97a675a845adad9bf8746f010b8230e19fa1c33126cf582170dc1ba382b482ec23f0cf513e1d025454b436')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
