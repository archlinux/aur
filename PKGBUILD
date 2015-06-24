# Maintainer: masutu Subric <masutu dot arch at gmail dot com>
# Contributor: masutu Subric <masutu dot arch at gmail dot com>
pkgname=python2-wcsaxes
_module_name=wcsaxes
pkgver=0.3
pkgrel=1
pkgdesc="Framework for plotting astronomical and geospatial data"
arch=(any)
url="http://wcsaxes.readthedocs.org"
license=('BSD')
depends=('python2-astropy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/w/${_module_name}/${_module_name}-${pkgver}.tar.gz")
md5sums=('d4e6b55fae2435642b984935bc71ec78')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 licenses/LICENSE.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
