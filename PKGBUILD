pkgname=python2-textx
_srcname=textX
pkgver=2.0.1
pkgrel=1
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="http://textx.github.io/textX/"
license=('MIT')
depends=('python2' 'python2-arpeggio')
source=(https://github.com/textX/$_srcname/archive/v$pkgver.tar.gz)
md5sums=('cc4fe6d5db278477b15afd5d349c1cda')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv $pkgdir/usr/bin/textx $pkgdir/usr/bin/textx2
}

# vim:set ts=2 sw=2 et:
