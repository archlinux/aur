# Maintainer: Shanoa Ice <fuyutsuki98_r@outlook.com>
# Contributor: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-gb
pkgver=1.521
pkgrel=1
pkgdesc="An open-source Chinese font derived from Klee One, modified to conform to GB2312 standard."
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiGB'
license=('OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-gb-v$pkgver.tar.gz")

b2sums=('003f385a9282eddaec95ded556d26f214e56d4b3e248fa8b1e3f36abfd4757382d674ef6bb09cfc65cbc98c603eee2208905bfb8cc18d35d938fd6de873c7541')

package() {
    cd "lxgw-wenkai-gb-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
