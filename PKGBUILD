# Maintainer:  <clu>

pkgbase=python-atpy
pkgname=python-atpy
_pkgname=ATpy
pkgver=0.9.7
pkgrel=1
pkgdesc="A high-level Python package providing a way to manipulate tables of astronomical data in a uniform way."
url="http://atpy.readthedocs.org/"
arch=('any')
license=('MIT')
makedepends=('python' 'python-distribute')
depends=('python-numpy' 'python-astropy')
optdepends=('pygresql: for PostGreSQL tables'
  'mysql-python: for MySQL tables'
  'python-h5py: for HDF5 tables')
#source=(https://github.com/downloads/atpy/atpy/ATpy-${pkgver}.tar.gz)
source=(https://pypi.python.org/packages/source/A/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('93525db0a36770b7cbbafefa6041fc80aac51c61')

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

