# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.234.56
pkgrel=2
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-v$pkgver.tar.gz")

sha256sums=('38e0487eaba6eb761615c51176e831910979364789b439a06f8779e25971c2da')

package() {
    cd "lxgw-wenkai-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
