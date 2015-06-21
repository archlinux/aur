# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-pyregion
pkgver=1.1.4
pkgrel=1
pkgdesc="A python module to parse ds9 and ciao region files"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pyregion"
license=("MIT")
depends=('python' 'python-numpy>=1.3')
source=("https://pypi.python.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
md5sums=('332f16542fbe1d6389c6cf27bd92c720')

build() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py install --root=${pkgdir}/ --optimize=1
}
