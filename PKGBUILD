# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-pyvisa-py
pkgver=0.5.0
pkgrel=1
pkgdesc="A pure python backend for PyVISA"
arch=('any')
license=('MIT')
depends=('python' 'python-pyvisa')
conflicts=('python-pyvisa-py-git')

_gitproject='pyvisa-py'

source=(https://github.com/pyvisa/pyvisa-py/archive/${pkgver}.tar.gz)
md5sums=('5fa46bd2eda3b8f2893caea1f2219447')
url="https://github.com/pyvisa/pyvisa-py"

package() {
  cd ${_gitproject}-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
