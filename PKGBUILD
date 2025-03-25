# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-wenkai-lite
pkgname=(ttf-lxgw-wenkai-lite ttf-lxgw-wenkai-mono-lite)
pkgver=1.511
pkgrel=1
url="https://github.com/lxgw/LxgwWenKai-Lite"
makedepends=('fontconfig')
license=("OFL-1.1")
arch=(any)
source=(
    "lxgw-wenkai-lite-v$pkgver.tar.gz::${url}/releases/download/v${pkgver}/lxgw-wenkai-lite-v${pkgver}.tar.gz"
)

sha256sums=('94963387b09b0e269a9fb89a97594f2e914e462ac624a537f90d742c2c0fb5fc')

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
