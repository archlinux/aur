# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python2-pyteomics
pkgver=4.1
pkgrel=1
pkgdesc="A framework for proteomics data analysis."
arch=('any')
url="https://pyteomics.readthedocs.io"
license=('Apache')
depends=('python2' 'python2-setuptools')
optdepends=('python2-matplotlib: for pylab_aux module'
            'python2-sqlalchemy: for mass.unimod module'
            'python2-pandas: for convenient filtering of CSV tables from search engines'
            'python2-lxml: for XML parsing modules'
            'python2-numpy: for most of features, highly recommended'
            'python2-dill: needed for multiprocessing when pickle is not enough')
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/pyteomics/pyteomics-${pkgver}.tar.gz")
sha256sums=('d7eaa5a1c6f25a39a42c4846e8c39e23cd3ba6f1aeeeedb730c3911c82bf6633')
changelog="CHANGELOG"
package() {
  cd "${srcdir}/pyteomics-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
