# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-pyexcel-io
pkgver=0.4.4
pkgrel=1
pkgdesc="A python library to read and write structured data in csv, zipped csv format and to/from databases"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel-io"
license=('BSD')
depends=('python' 'python-lml')
source=("https://github.com/pyexcel/pyexcel-io/archive/v$pkgver.tar.gz")
md5sums=('2e7940daa14d1112c0c67a51478e686c')

package() {
      cd "$srcdir/pyexcel-io-${pkgver}"
      python setup.py install --root=${pkgdir}
}
