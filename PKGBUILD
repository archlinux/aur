# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python2-aplpy
pkgver=1.1.1
pkgrel=1
pkgdesc="An astronomical plotting library in python"
arch=('any')
url="http://aplpy.sourceforge.net/"
license=("MIT")
depends=('python2' 'python2-matplotlib>=1.0.0' 'python2-numpy>=1.4' 'python2-pyregion' 'python2-pillow' 'python2-astropy' 'python2-pyavm')
source=("https://files.pythonhosted.org/packages/source/a/aplpy/APLpy-${pkgver}.tar.gz")
md5sums=('634422c006dcd366d5504af3349e9d10')

package() {
  cd ${srcdir}/APLpy-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
