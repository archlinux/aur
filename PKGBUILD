# Maintainer: Margret Riegert <margret at eowyn net>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=python-pyftdi
pkgver=0.54.0
pkgrel=1
pkgdesc="FTDI device driver written in pure Python"
arch=('any')
url="https://github.com/eblot/pyftdi"
license=('LGPL')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3989782dbc806fa1c7b89ba8bdcc51c282663be0d59a3b6dc47738d9975c6e0a')

package() {
    cd "pyftdi-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
