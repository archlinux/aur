# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-pyteomics
pkgver=3.1.1
pkgrel=1
pkgdesc="A framework for proteomics data analysis."
arch=('any')
url="http://pythonhosted.org/pyteomics"
license=('Apache')
depends=('python' 'python-setuptools')
optdepends=('python-matplotlib: for pylab_aux module, optional'
            'python-pandas: for convenient filtering of CSV tables from search engines'
            'python-lxml: for XML parsing modules, recommended'
            'python-numpy: for most of features, highly recommended')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pyteomics/pyteomics-${pkgver}.tar.gz")
md5sums=('e367dc7eb11fd7d589183ec7e9b15650')
changelog="CHANGELOG"
package() {
  cd "${srcdir}/pyteomics-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
