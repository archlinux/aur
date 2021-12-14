# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-aplpy
pkgver=2.0.3
pkgrel=3
pkgdesc="An astronomical plotting library in python"
arch=('any')
url="https://aplpy.github.io/"
license=("MIT")
depends=('python' 'python-matplotlib' 'python-numpy' 'python-pyregion' 'python-pillow' 'python-astropy' 'python-pyavm')
source=("https://files.pythonhosted.org/packages/source/a/aplpy/APLpy-${pkgver}.tar.gz")
sha512sums=('ad9e2079bc5cc3d60c88b49d11ef452d674a2223753d3c4b39db55bdb7b0ec598cff1edcd27d0539c3a3127b4c3bc7e0d57a3723841850fd49ed2206db5893d2')

package() {
  cd ${srcdir}/APLpy-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
