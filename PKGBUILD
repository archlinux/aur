# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-aplpy
pkgver=2.0.3
pkgrel=1
pkgdesc="An astronomical plotting library in python"
arch=('any')
url="http://aplpy.sourceforge.net/"
license=("MIT")
depends=('python' 'python-matplotlib' 'python-numpy' 'python-pyregion' 'python-pillow' 'python-astropy' 'python-pyavm')
source=("https://files.pythonhosted.org/packages/source/a/aplpy/APLpy-${pkgver}.tar.gz")
md5sums=('e84db8f2447ea624a231e6bc4613dc22')

package() {
  cd ${srcdir}/APLpy-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
