# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=btmenu
pkgver=1.0.0
pkgrel=1
pkgdesc='Control bluetooth devices with dmenu'
url='http://github.com/cdown/btmenu'
arch=('any')
license=('ISC')
depends=(dmenu)

source=("https://github.com/cdown/btmenu/archive/${pkgver}.zip")
md5sums=('a92ab4069be88e6da5910df60eb71138')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/btmenu" \
        "$pkgdir/usr/bin/btmenu"
}
