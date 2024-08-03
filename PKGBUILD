# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <creeperxie@hotmail.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.33.0'
pkgrel=3
pkgdesc='LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效'
arch=('any')
url="https://github.com/xiyuesaves/${_pkgname}"
license=('MIT')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-lite-tools')
conflicts=('liteloader-qqnt-lite-tools')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('9ddf953b48325240034aaeb6d7b5b1bab88966ac8a13d16c621d8a4893b11af3')
b2sums=('c54fee91146949a9429f235d353a818055be2e6b12bbbfb068ea829756192551f4a33de62fc4a89b0a9e284c3b361080eb7eb0caf125604e431ac37a394c8af9')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    rm "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}/${pkgname}-${pkgver}.zip"
}

