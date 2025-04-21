# Maintainer: Shanoa Ice <fuyutsuki98_r@outlook.com>
# Contributor: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-gb
pkgver=1.511
pkgrel=1
pkgdesc="An open-source Chinese font derived from Klee One, modified to conform to GB2312 standard."
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiGB'
license=('OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-gb-v$pkgver.tar.gz")

b2sums=('f27840eb7ea4e3e536373cbdc3aba8218549c0231dd1fb36c273d75b9bce3d2ad35759225fdfaffb79448e462c03e647968aeb5511eed862e0230d87088791c2')

package() {
    cd "lxgw-wenkai-gb-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
