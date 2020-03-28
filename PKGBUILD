# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=python-pyftdi
pkgver=0.49.0
pkgrel=1
pkgdesc="FTDI device driver written in pure Python"
arch=('any')
url="https://github.com/eblot/pyftdi"
license=('LGPL')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=("https://github.com/eblot/pyftdi/archive/v${pkgver}.tar.gz")
sha256sums=('c3553cefc0c73ac6874f489a7294e1f8c08d2d2e4ec2749338dddbed02a55223')

package() {
    cd "pyftdi-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
