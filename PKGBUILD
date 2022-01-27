# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=python-pyftdi
pkgver=0.53.3
pkgrel=1
pkgdesc="FTDI device driver written in pure Python"
arch=('any')
url="https://github.com/eblot/pyftdi"
license=('LGPL')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('66c2284137007aa8b4d19f70f81f2df7bc291a54e271accb0346234d36ece210')

package() {
    cd "pyftdi-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
