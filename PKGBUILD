# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.230
pkgrel=1
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-v$pkgver.tar.gz")

sha256sums=('37e2c9645b5eb87ae2b048095ea97308a1de729e1ddbc850b18df7b08aae4fdc')

package() {
    cd "lxgw-wenkai-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
