# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=ttf-lxgw-neo-xihei-code
pkgver=1.305
pkgrel=1
pkgdesc='A monospaced CJK font merged from LXGW NeoXiHei and legacy M+ for programming use.'
arch=('any')
url='https://github.com/lxgw/NeoXiHei-Code'
license=('IPA')
source=("$pkgname-$pkgver.ttf::$url/raw/v$pkgver/NeoXiHeiCode-Regular.ttf"
        "License-$pkgver.txt::$url/raw/v$pkgver/License.txt")
b2sums=('2882312d1a426510cb6d0028b3ad0e681a69e445d6ddca382cc4be60b950eb8a2bf8f2cb58c0f7a13d415fa12e51035959797f5bfb91f2f89fd5ff63cf0a8a8f'
        'ccb79bec5d352b18591f925ddbbaf6d86a6274bfbbea318e126690e5b52ee8be80d2deb99ab7e5b5b1194e2b8c8ee47464713b89e75c629dd462f1a80691e38d')

package() {
  install -Dm644 "$pkgname-$pkgver.ttf" "$pkgdir/usr/share/fonts/TTF/NeoXiHeiCode-Regular.ttf"
  install -Dm644 "License-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
