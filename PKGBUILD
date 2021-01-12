# Maintainer: 雨宫恋叶 <shadowrz at disroot dot org>
arch=(any)
pkgname=ttf-resource-han-rounded
pkgver=0.990
pkgrel=1
pkgdesc="A rounded font family derived from Source Han Sans"
url="https://github.com/CyanoHao/Resource-Han-Rounded"
license=('custom:OFL')
source=(
    "https://github.com/CyanoHao/Resource-Han-Rounded/releases/download/v${pkgver}/RHR-TTF-${pkgver}.7z"
    "https://raw.githubusercontent.com/CyanoHao/Resource-Han-Rounded/master/LICENSE.txt"
)
sha256sums=(
    '7bff6f66daf1501e8eca73fb347d99defac771d876aabe5db3552c00a0d0d86c'
    '7abe5f490780cd2fd5a67502b993e244ef87d631fb7b98244e9819ff590da4af'
)

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "${srcdir}"/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE.txt"
}
