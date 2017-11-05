# Maintainer: Cory Driscoll (doomworks) <cory@doomworks.net>

pkgname=ttf-zalgo
pkgver=1
pkgrel=1
pkgdesc="He comes."
url="https://fontstruct.com/fontstructions/show/262218/zalgo_2"
arch=(any)
license=(custom)
_tarname=zalgo
source=("https://github.com/zyxwvutsrqponmlkjihgfedcba/zalgo/archive/$_tarname-$pkgver.tar.gz")
sha256sums=('4e2287d5dee36f717ef10d70a38f3e52decc864ce1b35edb0410679118f03c01')

package() {
  cd "$srcdir/zalgo-zalgo-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname"
}
