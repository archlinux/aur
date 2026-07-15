# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=ttf-lxgw-neo-xihei-code
pkgver=1.304
pkgrel=1
pkgdesc='A monospaced CJK font merged from LXGW NeoXiHei and legacy M+ for programming use.'
arch=('any')
url='https://github.com/lxgw/NeoXiHei-Code'
license=('IPA')
source=("$pkgname-$pkgver.ttf::$url/raw/v$pkgver/NeoXiHeiCode-Regular.ttf"
        "License-$pkgver.txt::$url/raw/v$pkgver/License.txt")
b2sums=('81f54824f2744f08dfb1ac37fdb7401f8465762428fb53024ff1df6c89b08d323c979fc2fd36b6a0199b030fa6a41f7d4d5ff86bcfa3d3a6972d85fac4b7be2e'
        'ccb79bec5d352b18591f925ddbbaf6d86a6274bfbbea318e126690e5b52ee8be80d2deb99ab7e5b5b1194e2b8c8ee47464713b89e75c629dd462f1a80691e38d')

package() {
  install -Dm644 "$pkgname-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/NeoXiHeiCode-Regular.ttf"
  install -Dm644 "License-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
