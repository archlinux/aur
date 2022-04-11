# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-wenkai-lite
pkgname=(ttf-lxgw-wenkai-lite ttf-lxgw-wenkai-mono-lite)
pkgver=1.233.5
pkgrel=1
url="https://github.com/lxgw/LxgwWenKai-Lite"
depends=('fontconfig')
license=("custom:OFL")
arch=(any)
source=(
    "${url}/releases/download/v$pkgver/LXGWWenKaiLite-Bold.ttf"
    "${url}/releases/download/v$pkgver/LXGWWenKaiLite-Light.ttf"
    "${url}/releases/download/v$pkgver/LXGWWenKaiLite-Regular.ttf"
    "${url}/releases/download/v$pkgver/LXGWWenKaiMonoLite-Bold.ttf"
    "${url}/releases/download/v$pkgver/LXGWWenKaiMonoLite-Light.ttf"
    "${url}/releases/download/v$pkgver/LXGWWenKaiMonoLite-Regular.ttf"
    "LICENSE::https://raw.githubusercontent.com/lxgw/LxgwWenKai-Lite/main/License.txt"
)

sha256sums=('acff75f76bbf522de1827bde1e52d60949003d8a7d5d17e12fc5cec4ba04eb83'
            '4170c263f1452168450d04b368f2d4912158631ebda5241aaccde4f43ebe496c'
            '232cdd1355c90d4e09390d66a9fe0d9644ecba5d7c1b2d4ba2b7675589458054'
            '5796a27a25ba55597542f74664c9cc4665056021fee77d384ab553f266037b5d'
            '007582b74d32a1133666bb416126850e5e510d2e533387cdffa73c2d4a420b2f'
            '52c1e6ff15ef0dfb877782439ac143ec8456af228dace169024def7fe245ff6d'
            '7f18ec1ebb6b50e3ed0f74b2c61f25b8d7cd69e43f4de66e991bcfd3c419a8bb')

package_ttf-lxgw-wenkai-lite() {
    pkgdesc="LXGW WenKai Lite / 霞鹜文楷轻便版 An open-source Chinese font derived from Fontworks' Klee One. 一款基于 FONTWORKS 出品字体 Klee One 改造的开源中文字体。"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -d "$pkgdir/usr/share/licenses/${pkgname}"
    install -m644 LXGWWenKaiLite-Bold.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 LXGWWenKaiLite-Light.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 LXGWWenKaiLite-Regular.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/"

}

package_ttf-lxgw-wenkai-mono-lite(){
    pkgdesc="LXGW WenKai Mono Lite / 霞鹜文楷等宽轻便版 An open-source Chinese font derived from Fontworks' Klee One. 一款基于 FONTWORKS 出品字体 Klee One 改造的开源中文字体。"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -d "$pkgdir/usr/share/licenses/${pkgname}"
    install -m644 LXGWWenKaiMonoLite-Bold.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 LXGWWenKaiMonoLite-Light.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 LXGWWenKaiMonoLite-Regular.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/"
}
# vim: ts=4 sw=4 et
