# Maintainer: Stuart Mumford
pkgname=python-wcsaxes
_module_name=wcsaxes
pkgver=0.9
pkgrel=1
pkgdesc="Framework for plotting astronomical and geospatial data"
arch=(any)
url="http://wcsaxes.readthedocs.org"
license=('BSD')
depends=('python-astropy' 'python-matplotlib')
options=(!emptydirs)
source=("https://pypi.io/packages/source/w/${_module_name}/${_module_name}-${pkgver}.tar.gz")
md5sums=('5df63a4ab8fe3445fc101a9c62edea79')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 licenses/LICENSE.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
