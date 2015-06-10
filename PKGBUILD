# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-arxiv2bib
pkgver=1.0.5
pkgrel=2
pkgdesc="Provides a command line tool to get metadata for an academic paper posted at arXiv.org in BibTeX format."
arch=('any')
url="https://pypi.python.org/pypi/arxiv2bib"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/a/arxiv2bib/arxiv2bib-$pkgver.tar.gz)

build() {
  cd "$srcdir/arxiv2bib-$pkgver"
  chmod 644 arxiv2bib.egg-info/*
  python setup.py build
}

package(){
  cd "$srcdir/arxiv2bib-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
md5sums=('67041f21b15ba52991b9d90a418fbff7')
