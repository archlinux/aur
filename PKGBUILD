# Maintainer: orumin <dev@orum.in>

pkgname=python2-jxmlease
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python module for converting XML to intelligent Python data structures, and converting Python data structures to XML."
arch=('any')
url="https://github.com/Juniper/jxmlease"
license=('MIT')
depends=('python2')
source=(https://github.com/Juniper/jxmlease/archive/1.0.1.tar.gz)
md5sums=('d567851b9a7ff0d3b588bac230a2050d')

package() {
  cd "$srcdir/jxmlease-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
