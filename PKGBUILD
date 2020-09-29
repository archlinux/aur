# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=btmenu
pkgver=1.2.0
pkgrel=2
pkgdesc='Control bluetooth devices with dmenu'
url='http://github.com/cdown/btmenu'
arch=('any')
license=('ISC')
depends=(dmenu bluez-utils)

source=("https://github.com/cdown/btmenu/archive/${pkgver}.zip")
md5sums=('d03939177e9a92484447fa4da7d742ad')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/btmenu" \
        "$pkgdir/usr/bin/btmenu"
}
