# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=python-pyftdi
pkgver=0.28.8
pkgrel=1
pkgdesc="FTDI device driver written in pure Python"
arch=('any')
url="https://github.com/eblot/pyftdi"
license=('LGPL')
depends=('python-pyusb' 'python-pyserial')
makedepends=('python-setuptools')
source=("https://github.com/eblot/pyftdi/archive/v${pkgver}.tar.gz")
sha256sums=('6c22d1f8f85137f42e0dd854ec99b8228da43fe5ab70d14a45ac1cda17d5aa1c')

package() {
    cd "pyftdi-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
