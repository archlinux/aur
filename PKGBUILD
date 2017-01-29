# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=python2-sphinxcontrib-bibtex
_pkgname=sphinxcontrib-bibtex
pkgver=0.3.4
pkgrel=1
pkgdesc="A Sphinx extension for BibTeX style citations"
arch=('any')
url="http://sphinxcontrib-bibtex.readthedocs.org"
license=('BSD')
depends=('python2-sphinx' 'python2-pybtex')
makedepends=('git')
source=("https://pypi.io/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8eea947b55cf70937e7d2b4fcb425f116cab85eaf2909c991797e66cc1cf0168')

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
