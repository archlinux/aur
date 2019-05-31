# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python-drms
_module_name=drms
pkgver=0.5.6
pkgrel=1
pkgdesc="The drms module provides an easy-to-use interface for accessing HMI, AIA and MDI data with Python."
arch=(any)
url="http://sunpy.org"
license=('MIT')
depends=('python-numpy' 'python-six' 'python-pandas')
source=("https://pypi.io/packages/source/d/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('95cac0e14532893a44eeab8e329ddb76150e6848153d8cb1e4e08ba55569e6af')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
