# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-wenkai-lite
pkgname=(ttf-lxgw-wenkai-lite ttf-lxgw-wenkai-mono-lite)
pkgver=1.501
pkgrel=1
url="https://github.com/lxgw/LxgwWenKai-Lite"
makedepends=('fontconfig')
license=("OFL-1.1")
arch=(any)
source=(
    "lxgw-wenkai-lite-v$pkgver.tar.gz::${url}/releases/download/v${pkgver}/lxgw-wenkai-lite-v${pkgver}.tar.gz"
)

sha256sums=('2f295b6ffa748846f836afdba6ba4c62da5ad7ca8d1dcdd2665faf56322f4a8d')

package_ttf-lxgw-wenkai-lite() {
    pkgdesc="LXGW WenKai Lite / 霞鹜文楷轻便版 An open-source Chinese font derived from Fontworks' Klee One. 一款基于 FONTWORKS 出品字体 Klee One 改造的开源中文字体。"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cd ${srcdir}/lxgw-wenkai-lite-v$pkgver
    cp -rv LXGWWenKaiLite-*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

package_ttf-lxgw-wenkai-mono-lite() {
    pkgdesc="LXGW WenKai Mono Lite / 霞鹜文楷等宽轻便版 An open-source Chinese font derived from Fontworks' Klee One. 一款基于 FONTWORKS 出品字体 Klee One 改造的开源中文字体。"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cd ${srcdir}/lxgw-wenkai-lite-v$pkgver
    cp -rv LXGWWenKaiMonoLite-*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
# vim: ts=4 sw=4 et
