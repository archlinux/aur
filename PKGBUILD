# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-pyexcel-io
pkgver=0.5.1
pkgrel=2
pkgdesc="A python library to read and write structured data in csv, zipped csv format and to/from databases"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel-io"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-lml')
source=("https://github.com/pyexcel/pyexcel-io/archive/v$pkgver.tar.gz")
md5sums=('4f0873325c91f5d8baecdbd4e3425d32')

package() {
      cd "$srcdir/pyexcel-io-${pkgver}"
      python setup.py install --root=${pkgdir}
}
