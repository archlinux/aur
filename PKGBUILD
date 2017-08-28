# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=python-pyftdi
_pkgname=pyftdi
pkgver=0.22.1
_pkgver=.022.1
pkgrel=1
pkgdesc="FTDI device driver written in pure Python"
arch=('any')
url="https://github.com/eblot/pyftdi"
license=('LGPL')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=("https://github.com/eblot/pyftdi/archive/v${_pkgver}.tar.gz")
sha256sums=('c98a5c71493d9d4a2aaacaae8f3bdd1e9ad8ca98cd3ac06a8826d532bfd3d7d9')

package() {
	cd "${_pkgname}-v${_pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
