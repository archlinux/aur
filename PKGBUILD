# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=python-sphinxcontrib-bibtex
_pkgname=sphinxcontrib-bibtex
pkgver=0.3.2
pkgrel=1
pkgdesc="A Sphinx extension for BibTeX style citations"
arch=('any')
url="http://sphinxcontrib-bibtex.readthedocs.org"
license=('BSD')
depends=('python-sphinx' 'python-pybtex')
makedepends=('git')
source=("http://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ddaad24a22267a35c2519c18a64dbc4fe7981facd81cdfcd208f6b037dd94bea')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
