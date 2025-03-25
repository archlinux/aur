# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.511
pkgrel=1
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('OFL-1.1-RFN')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-v$pkgver.tar.gz")

sha256sums=('7081c6a13c3fbd6abb9eefb780281b61c254de1a52e0dc5d34b327bb6d6f6ee0')

package() {
    cd "lxgw-wenkai-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
