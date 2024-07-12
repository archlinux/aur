# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-telegram-theme-bin'
_pkgname='LiteLoaderQQNT-Telegram-Theme'
pkgver='4.4.3'
pkgrel=1
pkgdesc="LiteLoaderQQNT 插件，高仿 Telegram 风格的 QQNT 主题"
arch=('any')
url="https://github.com/festoney8/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-telegram-theme-bin")
conflicts=("liteloader-qqnt-telegram-theme-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('26714081fd7d979d6cb003fc5dbcc3eb755f63ff8eed923d5493c1675d489b0e')
b2sums=('42344949a9efb63c3e0f517408f6d1a4c2946043e4caa3cd68d8d7b869192654ef6a1d7697579d0b48c98a7d2f5613761d86b052852dba38d062fe072d2c68c6')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
