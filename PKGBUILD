# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-wenkai-lite
pkgname=(ttf-lxgw-wenkai-lite ttf-lxgw-wenkai-mono-lite)
pkgver=1.211
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

sha256sums=('6d1e9aa8a4b4ff5b15b12bcd7f0e8a7e7d83b7b96ace9a26b110ab6256c14384'
            '8628addbdf771c293d8b71b6370e6fcad09601ffeaf0d8bf08b7405f45057ac8'
            '03764c3a8348e23f7c447f188533c06351163ef6c405e7b08e2bd5dea043f7bc'
            'cf21de4cb2214fd547d771725d85f063c4fe5dd89e32ab939b6ca5b48d5dfb44'
            'bd060a31fd4ec2498a43298b26b57432a70bc9f866c2283e5933bdd055560dfd'
            '2cb6c39d14a5d698aa650cefa0ccb56c2f2a57aedf747af3f55ac9b1e5dcaf6f'
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
