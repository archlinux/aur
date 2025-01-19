# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.510
pkgrel=1
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('OFL-1.1-RFN')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-v$pkgver.tar.gz")

sha256sums=('459faf7050ca316eb7a18cf899e36f35223211d63d239b0a86a3803ca94f3f84')

package() {
    cd "lxgw-wenkai-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
