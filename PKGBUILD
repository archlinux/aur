# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-pyteomics
pkgver=4.6.1
pkgrel=1
pkgdesc="A framework for proteomics data analysis."
arch=('any')
url="https://pyteomics.readthedocs.io"
license=('Apache')
depends=('python' 'python-pip')
optdepends=('python-matplotlib: for pylab_aux module'
            'python-sqlalchemy: for mass.unimod module'
            'python-pandas: for convenient filtering of CSV tables from search engines'
            'python-lxml: for XML parsing modules'
            'python-numpy: for most of features, highly recommended'
            'python-dill: needed for multiprocessing when pickle is not enough'
            'python-pynumpress: for Numpress support')
options=(!emptydirs)
source=("https://pypi.debian.net/pyteomics/pyteomics-${pkgver}-py2.py3-none-any.whl")
sha256sums=('349aeff0a3be8e276866ce1aa5325a976a159af770d794d1a8b5b94a50f937e7')
changelog=CHANGELOG

package() {
  pip install --ignore-installed --root "$pkgdir" "pyteomics-${pkgver}-py2.py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
