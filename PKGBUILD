# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-pyexcel-ods
pkgver=0.5.0
pkgrel=4
pkgdesc="A wrapper library to read, manipulate and write data in ods format"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel-ods"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-odfpy' 'python-pyexcel-io')
source=("https://github.com/pyexcel/pyexcel-ods/archive/v$pkgver.tar.gz")
md5sums=('52a19821e58c4467c6612d8bc8f9b67b')

package() {
      cd "$srcdir/pyexcel-ods-${pkgver}"
      python setup.py install --root="${pkgdir}"
}
