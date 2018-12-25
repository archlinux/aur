# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=btmenu
pkgver=1.1.0
pkgrel=1
pkgdesc='Control bluetooth devices with dmenu'
url='http://github.com/cdown/btmenu'
arch=('any')
license=('ISC')
depends=(dmenu)

source=("https://github.com/cdown/btmenu/archive/${pkgver}.zip")
md5sums=('487aade34654c902f81e6249f0b36c7b')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/btmenu" \
        "$pkgdir/usr/bin/btmenu"
}
