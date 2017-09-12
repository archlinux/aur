# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=python-pyftdi
pkgver=0.22.1+87+ge2d2ffc
pkgrel=1
pkgdesc="FTDI device driver written in pure Python"
arch=('any')
url="https://github.com/eblot/pyftdi"
license=('LGPL')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools' 'git')
_commit=e2d2ffc81ec3fa5bfabcc07fa7375e4c7ad9e5dd
source=("git+https://github.com/eblot/pyftdi#commit=${_commit}")
sha256sums=('SKIP')

package() {
    cd "pyftdi"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
