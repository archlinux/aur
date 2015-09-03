# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-pyvisa-py
pkgver=0.2
pkgrel=1
pkgdesc="A pure python backend for PyVISA"
arch=('any')
license=('MIT')
depends=('python' 'python-pyvisa')

_gituser='hgrecco'
_gitproject='pyvisa-py'

source=(https://github.com/${_gituser}/${_gitproject}/archive/${pkgver}.tar.gz)
md5sums=('518b7e0a79d5d841ec22d665e1c6fd12')
url="https://github.com/${_gituser}/${_gitproject}"

package() {
  cd ${_gitproject}-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
