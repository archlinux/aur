# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=python-pyftdi
pkgver=0.52.0
pkgrel=1
pkgdesc="FTDI device driver written in pure Python"
arch=('any')
url="https://github.com/eblot/pyftdi"
license=('LGPL')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e45b92eb1094196cd8ac62ba76e80d0d2c0a1f8c53cd7ab1c8643954c951927d')

package() {
    cd "pyftdi-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
