# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

pkgname=python-pyexcel
pkgver=0.6.3
pkgrel=1
pkgdesc="A wrapper library that provides one API to read, manipulate and write data in different excel formats"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-texttable' 'python-pyexcel-io' 'python-lml')
source=("https://github.com/pyexcel/pyexcel/archive/v$pkgver.tar.gz")
sha256sums=('29a5705b060b80dd4bfa889646d4924cbb4b1159e273392c7430dc4ba99da93f')

package() {
      cd "$srcdir/pyexcel-${pkgver}"
      python setup.py install --root=${pkgdir}
}
