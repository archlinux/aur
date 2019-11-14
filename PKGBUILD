# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-pyregion
pkgver=2.0
pkgrel=2
pkgdesc="A python module to parse ds9 and ciao region files"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pyregion"
license=("MIT")
depends=('python' 'python-numpy>=1.3')
source=("https://files.pythonhosted.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
sha512sums=('5fce3ae7f461c5b73cf847bbe7576054e39d7dd8cbff9ff5fda9b389becd49478ed7287cd03d40fec41b19b2888a7992ebd09e3d7560a392ad30bec0f4eb00d4')

build() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py install --root=${pkgdir}/ --optimize=1
}
