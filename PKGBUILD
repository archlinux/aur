# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-pyteomics
pkgver=3.0.1
pkgrel=1
pkgdesc="A framework for proteomics data analysis."
arch=('any')
url="http://pythonhosted.org/pyteomics"
license=('Apache')
depends=('python')
optdepends=('python-matplotlib: for pylab_aux module, optional' \
            'python-lxml: for XML parsing modules, recommended' \
            'python-numpy: for lots of features, highly recommended')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pyteomics/pyteomics-${pkgver}.tar.gz")
md5sums=('2c838cc1c16dce69148662b883c755b9')
changelog="CHANGELOG"
package() {
  cd "${srcdir}/pyteomics-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
