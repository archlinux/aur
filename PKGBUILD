pkgname=python-textx
_srcname=textX
pkgver=1.7.1
pkgrel=1
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="http://igordejanovic.net/textX/"
license=('MIT')
depends=('python' 'python-arpeggio')
source=(https://github.com/igordejanovic/$_srcname/archive/v$pkgver.tar.gz)
md5sums=('ad931a22301f45298977d6925b660295')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
