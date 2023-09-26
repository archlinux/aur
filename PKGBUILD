# Maintainer: Shanoa Ice <fuyutsuki98_r@outlook.com>
# Contributor: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-gb
pkgver=1.000
pkgrel=3
pkgdesc="An open-source Chinese font derived from Klee One, modified to conform to GB2312 standard."
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiGB'
license=('OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-gb-v$pkgver.tar.gz")

b2sums=('845d62e72f752fdaa0aabf0bea93a9b23171c13fe06e29cf551342aa736d0d12cc2c13cf73340614427c13bd6dd530a5f793bab23bfcc23fd259c75a6c1c56b5')

package() {
    cd "lxgw-wenkai-gb-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
