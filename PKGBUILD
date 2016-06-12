pkgname=python2-textx
_srcname=textX
pkgver=1.4
pkgrel=1
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="http://igordejanovic.net/textX/"
license=('MIT')
depends=('python2')
source=(https://github.com/igordejanovic/$_srcname/archive/v$pkgver.tar.gz)
md5sums=('cb3de639d0150a044368041c5808d88e')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
