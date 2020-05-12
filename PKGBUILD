# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-pyexcel
pkgver=0.6.1
pkgrel=1
pkgdesc="A wrapper library that provides one API to read, manipulate and write data in different excel formats"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-texttable' 'python-pyexcel-io' 'python-lml')
source=("https://github.com/pyexcel/pyexcel/archive/v$pkgver.tar.gz")
sha256sums=('e2a58d55647c90fa9435290c3b8b100f66581458e1653dae0e08dd517d5515e3')

package() {
      cd "$srcdir/pyexcel-${pkgver}"
      python setup.py install --root=${pkgdir}
}
