# Maintainer: Serverbread <serverbread-DEV@qq.com>

pkgname='liteloader-qqnt-llonebot-bin'
_pkgname='LiteLoaderQQNT-LLOneBot-bin'
pkgver='4.4.1'
pkgrel=1
pkgdesc='使你的NTQQ支持OneBot11协议进行QQ机器人开发 '
arch=('any')
url="https://github.com/LLOneBot/LLOneBot"
license=('MIT')
depends=('liteloader-qqnt')
provides=("liteloader-qqnt-llonebot")
conflicts=("liteloader-qqnt-llonebot")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LLOneBot.zip")
sha256sums=('ccb999a3cf47bba2bd4f168799b9adfc9fa63655b4d844f91fce5eae2f8ca9ff')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot"
    rm "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot/${pkgname}-${pkgver}.zip"
}

