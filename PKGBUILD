pkgname=python-arpeggio
_srcname=Arpeggio
pkgver=1.5
pkgrel=1
pkgdesc="Recursive descent parser with memoization based on PEG grammars (aka Packrat parser)."
arch=('any')
url="http://igordejanovic.net/Arpeggio/"
license=('MIT')
depends=('python')
source=(https://github.com/igordejanovic/$_srcname/archive/v$pkgver.tar.gz)
md5sums=('cb3de639d0150a044368041c5808d88e')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
