# Maintainer: Shanoa Ice <fuyutsuki98_r@outlook.com>
# Contributor: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-gb
pkgver=1.321
pkgrel=1
pkgdesc="An open-source Chinese font derived from Klee One, modified to conform to GB2312 standard."
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiGB'
license=('OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-gb-v$pkgver.tar.gz")

b2sums=('088221c7b7f8bae162c32dab1ff40a0831fb5ac89fc2e0b8fb7d06683218a44f8afa2db59bee5edb316047b8e1d66f42874d09b55d8efd61967d75b857be05e4')

package() {
    cd "lxgw-wenkai-gb-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
