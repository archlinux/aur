# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python2-pyteomics
pkgver=3.5.1
pkgrel=1
pkgdesc="A framework for proteomics data analysis."
arch=('any')
url="http://pyteomics.readthedocs.io/"
license=('Apache')
depends=('python2' 'python2-setuptools')
optdepends=('python2-matplotlib: for pylab_aux module'
            'python2-sqlalchemy: for mass.unimod module'
            'python2-pandas: for convenient filtering of CSV tables from search engines'
            'python2-lxml: for XML parsing modules'
            'python2-numpy: for most of features, highly recommended')
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/pyteomics/pyteomics-${pkgver}.tar.gz")
sha256sums=('acd95d8e139e42c113f3f0bc4f512b9a7081d94eefd5bd73e183e1b4a848c364')
changelog="CHANGELOG"
package() {
  cd "${srcdir}/pyteomics-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
