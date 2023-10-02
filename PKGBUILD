# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-wenkai-lite
pkgname=(ttf-lxgw-wenkai-lite ttf-lxgw-wenkai-mono-lite)
pkgver=1.310
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

sha256sums=('ebd825083198da66efb96d1fdfe0b730a7e52f99ae212481a18127ac52bf339a'
            'caabf73fcf9fe0ec04ba0c3eeb92e96936e63c12aafb22f8af7783049c3db186'
            '36ac9aae5ac89bb0d6165dc6dc65e0ffc4900319ea4e10eba116df32d78b1512'
            '5a5da12989811d4a962e4fac65ca979d43682e1b68da03d6da2ef0e969031950'
            'aa02cbdd2e87f1bcacc8febb949e8cbfeb5067a10663eb3b6ba9237697dcf862'
            '8fe36e111d796eb05ae7c92ae06ff024daffc6e71e070f1d777af31a382e7bbd'
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
