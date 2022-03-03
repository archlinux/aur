# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-wenkai-lite
pkgname=(ttf-lxgw-wenkai-lite ttf-lxgw-wenkai-mono-lite)
pkgver=1.220
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

sha256sums=('27da8d589d906d6f1a83aad83e92d76fee7bb46badb2636ac209386518b48de1'
            '4c33e22edf4edf3501faf7b9afc722b7e1e3a9f78b663858a21b1b5567b87ec1'
            'beb4a060315b511cc75aebd35c3cfe60dd0c26afd25a81767461916c0870e4e6'
            '3bad38d1ffe793d68792f3addae95f044d45069652daa29e7aaf046de30c77a6'
            '48454a25de71d190a4d9eb3e69af9726f2ad434e1311aff91030c90db4ce9c69'
            '453ca18ce7c80ddc664b50e0167bcee8be4c0ca60debba4e8e74b899f21d27e6'
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
