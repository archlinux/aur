# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python2-pyteomics
pkgver=4.5.1
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
sha256sums=('b56a36e5a27578a1c5b5fe96fa355cb2ad7a9f9d18beb647c0550f28f182215e')
changelog=CHANGELOG

package() {
  pip2 install --ignore-installed --root "$pkgdir" "pyteomics-${pkgver}-py2.py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
