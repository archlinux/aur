# Maintainer: Serverbread <serverbread-DEV@qq.com>

pkgname='liteloader-qqnt-llonebot-bin'
_pkgname='LiteLoaderQQNT-LLOneBot-bin'
pkgver='3.29.2'
pkgrel=1
pkgdesc='使你的NTQQ支持OneBot11协议进行QQ机器人开发 '
arch=('any')
url="https://github.com/LLOneBot/LLOneBot"
license=('MIT')
depends=('liteloader-qqnt')
provides=("liteloader-qqnt-llonebot")
conflicts=("liteloader-qqnt-llonebot")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LLOneBot.zip")
sha256sums=('c845b3653b71e08f98d32665634d7898c2c3bc586bbbe54954dffec2c36a26d0')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot"
    rm "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot/${pkgname}-${pkgver}.zip"
}

