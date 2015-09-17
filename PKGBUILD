# Maintainer: Andrew Boktor <andrew dot boktor at gmail dot com>
pkgname=python-graphics
pkgver=4.3
pkgrel=1
pkgdesc="Simple python graphics library."
arch=('any')
url="http://mcsp.wartburg.edu/zelle/python/"
license=('GPL')
depends=('python')
source=(http://mcsp.wartburg.edu/zelle/python/graphics.py)
md5sums=('68dcab955c000313558067476e3a859d')

package() {
    cd "$srcdir"
    install -Dm644 graphics.py "$pkgdir/usr/lib/python3.4/site-packages/graphics/__init__.py"
}

