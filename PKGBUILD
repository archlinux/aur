# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=btmenu
pkgver=1.1.2
pkgrel=1
pkgdesc='Control bluetooth devices with dmenu'
url='http://github.com/cdown/btmenu'
arch=('any')
license=('ISC')
depends=(dmenu)

source=("https://github.com/cdown/btmenu/archive/${pkgver}.zip")
md5sums=('9516f21f26018fde999ae8393be0560b')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/btmenu" \
        "$pkgdir/usr/bin/btmenu"
}
