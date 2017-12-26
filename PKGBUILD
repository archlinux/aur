# Maintainer: Eric Brandwein <brandweineric@gmail.com>

pkgname=monofonto
pkgver=1
pkgrel=1
pkgdesc="An unidealistic, monospaced utility font"
url="http://typodermicfonts.com/monofonto/"
arch=(any)
license=(custom)
source=("monofonto.ttf" typodermic-eula-02-2014.pdf)
sha256sums=("e58f97c59f7a155fda1e3e63293cb2db80831d990a9be8db1bf487b51277c930" f0495e87043d4fe436960909071543404d663f1b0a9ec830c5bcd13a2eb5dd2c)

package() {
  install -d "$pkgdir/usr/share/fonts/"
  install -t "$pkgdir/usr/share/fonts/" -m644 "monofonto.ttf"
  install -Dm644 typodermic-eula-02-2014.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}