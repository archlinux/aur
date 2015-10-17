# Maintainer: Swift Geek
pkgname=python-textile
_pipname=textile
pkgver=2.2.2
pkgrel=1
pkgdesc="Python port of Textile, Dean Allen’s humane web text generator"
arch=('any')
url="https://github.com/textile/python-textile"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/t/${_pipname}/${_pipname}-${pkgver}.tar.gz")
md5sums=('bddc621231a6e7573310997543ef251f')

package() {
  cd "$srcdir/$_pipname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
