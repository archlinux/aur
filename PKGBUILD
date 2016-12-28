# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-aplpy
pkgver=1.1.1
pkgrel=1
pkgdesc="An astronomical plotting library in python"
arch=('any')
url="http://aplpy.sourceforge.net/"
license=("MIT")
depends=('python' 'python-matplotlib>=1.0.0' 'python-numpy>=1.4' 'python-pyregion' 'python-pillow' 'python-astropy' 'python-pyavm')
source=("https://files.pythonhosted.org/packages/source/a/aplpy/APLpy-${pkgver}.tar.gz")
md5sums=('634422c006dcd366d5504af3349e9d10')

package() {
  cd ${srcdir}/APLpy-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
