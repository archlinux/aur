# Maintainer: Shanoa Ice <fuyutsuki98_r@outlook.com>
# Contributor: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-gb
pkgver=1.522
pkgrel=1
pkgdesc="An open-source Chinese font derived from Klee One, modified to conform to GB2312 standard."
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiGB'
license=('OFL-1.1')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-gb-v$pkgver.tar.gz")

b2sums=('a784cb76548eff66e9c1e3963f3d3a5f44a7368d4e3205ce5dfe12ff08d45a68bb8a5917c24f1c43d49ed89521a59123567bd2cc79e875505cad2a776c1fbcbc')

package() {
    cd "lxgw-wenkai-gb-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
