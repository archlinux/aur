# Maintainer: Serverbread <serverbread-DEV@qq.com>

pkgname='liteloader-qqnt-llonebot-bin'
_pkgname='LiteLoaderQQNT-LLOneBot-bin'
pkgver='4.7.4'
pkgrel=1
pkgdesc='使你的NTQQ支持OneBot11协议进行QQ机器人开发 '
arch=('any')
url="https://github.com/LLOneBot/LLOneBot"
license=('MIT')
depends=('liteloader-qqnt')
provides=("liteloader-qqnt-llonebot")
conflicts=("liteloader-qqnt-llonebot")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LLOneBot.zip")
sha256sums=('664f2a89da94a6cba943478c87e8f3a895d39fcbe2669c149c9bb8810e1a47ed')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot"
    rm "${pkgdir}/opt/LiteLoaderQQNT/plugins/LLOneBot/${pkgname}-${pkgver}.zip"
}

