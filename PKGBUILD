# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.200
pkgrel=4
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-v$pkgver.tar.gz")

sha256sums=('1c949bc931cc22e7d00b3778832ed62a70bb217797f5b118db53934832b76f9e')

package() {
    cd "lxgw-wenkai-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
