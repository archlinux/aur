# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-rpy2-bioconductor
pkgver=0.2.5
_pkgver=$pkgver-dev
pkgrel=1
pkgdesc="Bioconductor extensions for rpy2"
arch=('any')
url="http://pypi.python.org/pypi/rpy2-bioconductor-extensions/"
license=('GPLv3')
depends=('python2-rpy2') # 'r-bioconductor')
source=("http://pypi.python.org/packages/source/r/rpy2-bioconductor-extensions/rpy2-bioconductor-extensions-$_pkgver.tar.gz")
md5sums=('ea81c5c92c3b9de1b024ff7bfec5156a')

package() {
  cd "$srcdir/rpy2-bioconductor-extensions-$_pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

