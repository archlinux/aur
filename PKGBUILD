# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python-drms
_module_name=drms
pkgver=0.6.2
pkgrel=1
pkgdesc="The drms module provides an easy-to-use interface for accessing HMI, AIA and MDI data with Python."
arch=(any)
url="http://sunpy.org"
license=('MIT')
depends=('python-numpy' 'python-six' 'python-pandas')
source=("https://pypi.io/packages/source/d/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('21df2b3caf2aabbd601e7e432a7122ecba74f351856dc16d194faff3d565b7da')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
