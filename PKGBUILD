# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python2-pyteomics
pkgver=4.4.0
pkgrel=1
pkgdesc="A framework for proteomics data analysis."
arch=('any')
url="https://pyteomics.readthedocs.io"
license=('Apache')
depends=('python2' 'python2-pip')
optdepends=('python2-matplotlib: for pylab_aux module'
            'python2-sqlalchemy: for mass.unimod module'
            'python2-pandas: for convenient filtering of CSV tables from search engines'
            'python2-lxml: for XML parsing modules'
            'python2-numpy: for most of features, highly recommended'
            'python2-dill: needed for multiprocessing when pickle is not enough'
            'python2-pynumpress: for Numpress support')
options=(!emptydirs)
source=("https://pypi.debian.net/pyteomics/pyteomics-${pkgver}-py2.py3-none-any.whl")
sha256sums=('d170c57ccdbe148668ff3c8e8324637b6f7bc67964d6b73b9228134d6a2c1cd1')
changelog=CHANGELOG

package() {
  pip2 install --ignore-installed --root "$pkgdir" "pyteomics-${pkgver}-py2.py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
