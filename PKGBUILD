# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-aplpy
pkgver=2.1.0
pkgrel=1
pkgdesc="An astronomical plotting library in python"
arch=('any')
url="https://aplpy.github.io/"
license=("MIT")
depends=('python' 'python-matplotlib' 'python-numpy' 'python-pyregion' 'python-pillow' 'python-astropy' 'python-pyavm' 'python-reproject')
source=("https://files.pythonhosted.org/packages/source/a/aplpy/aplpy-${pkgver}.tar.gz")
sha512sums=('16e058eb6696a0e981024d62896973449f73342c3629368b1d420a9118eb35969d3a8acba069d0892cb585aca47df815d0eab780eda1004e082f0ca8cb82d5cf')

package() {
  cd ${srcdir}/aplpy-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
