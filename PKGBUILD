# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-telegram-theme-bin'
_pkgname='LiteLoaderQQNT-Telegram-Theme'
pkgver='4.2.6'
pkgrel=1
pkgdesc="LiteLoaderQQNT 插件，高仿 Telegram 风格的 QQNT 主题"
arch=('any')
url="https://github.com/festoney8/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-telegram-theme-bin")
conflicts=("liteloader-qqnt-telegram-theme-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('693282aa2275e1f7f5ee53d644a4fdda36fd69ffd298ff8e34e2a880f57562d4')
b2sums=('ec3b1885e8489f10247d5cfc1ea65f6b41e8454b7c05a102c104da046b657d320fe48485636c4fab85af642c54f91f1ff561ec8cbed560416d02cb5e1baf63f7')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
