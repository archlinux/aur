# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <creeperxie@hotmail.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.33.9'
pkgrel=3
pkgdesc='LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效'
arch=('any')
url="https://github.com/xiyuesaves/${_pkgname}"
license=('MIT')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-lite-tools')
conflicts=('liteloader-qqnt-lite-tools')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=('896486cebf85756cd3eb533772b7cba1085ff04be6397e33d322ff5216d80a3d')
b2sums=('4749361ab43c4e1c437569555f0eddf93e9e0948038311cb84cf69d2cd6db1c21a84b84279953385f3bd53f71a033c8bf4f6c9c0040d31c133c513196d0520d5')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    rm "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}/${pkgname}-${pkgver}.zip"
}

