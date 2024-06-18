# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-telegram-theme-bin'
_pkgname='LiteLoaderQQNT-Telegram-Theme'
pkgver='4.3.2'
pkgrel=1
pkgdesc="LiteLoaderQQNT 插件，高仿 Telegram 风格的 QQNT 主题"
arch=('any')
url="https://github.com/festoney8/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-telegram-theme-bin")
conflicts=("liteloader-qqnt-telegram-theme-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('2f4a25bb1b289ce80e958e5d82fed0f0df499ba6afdd78e03fae12403f325526')
b2sums=('9f2c669b884631f6561a1bcfb0f6c27a7770ee0fa7b4f0509460164b46f46949eaecf8c1b6eeffa9272234cdb735249622890d197965d66b61e7795d79ce99ef')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
