# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-wenkai-lite
pkgname=(ttf-lxgw-wenkai-lite ttf-lxgw-wenkai-mono-lite)
pkgver=1.240
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

sha256sums=('32fe7b876af9f338ae1ac48f511b5d3a87a0e54c56e98fd8cb6988dc45e96fa6'
            '6c0b14e09bf6ee906f9a21406b9200871d68e216fca9b5146b6a1e71a7990277'
            'c758eeb4963eb7e182594caef5e1ba94dd1080701f2033299a864587cb33c5ef'
            'f92f5f28b59d1bf2d0a24745028952c0a1f7483aa60d101cc2eb477919c95b84'
            'fc9df1230471ebd453a827aefe721036b2ac277bec7fb614f9512176f1c84229'
            '6889e3efd1137a12d555ee1131893bf95a5f6da7f8ce0a125409557bc8363478'
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
