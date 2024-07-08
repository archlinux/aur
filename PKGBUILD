# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-telegram-theme-bin'
_pkgname='LiteLoaderQQNT-Telegram-Theme'
pkgver='4.4.2'
pkgrel=1
pkgdesc="LiteLoaderQQNT 插件，高仿 Telegram 风格的 QQNT 主题"
arch=('any')
url="https://github.com/festoney8/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-telegram-theme-bin")
conflicts=("liteloader-qqnt-telegram-theme-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('5dc3bcaba460de00b0c71accac9d44593de010d9c83316bfa9d24c75c6f02c26')
b2sums=('2b2f5a0ff349e9462e21d684ff7e18e597b080435fe3be1656842bc38f86f25e7946fdfc4d54a558a7d74606d8aa56c206868996028025023a574933e5ff2910')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
