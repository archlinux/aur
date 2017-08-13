# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-pyexcel-ods
pkgver=0.4.0
pkgrel=2
pkgdesc="A wrapper library to read, manipulate and write data in ods format"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel-ods"
license=('BSD')
depends=('python' 'python-odfpy' 'python-pyexcel-io')
source=("https://github.com/pyexcel/pyexcel-ods/archive/v$pkgver.tar.gz")
md5sums=('c1e9496ad987abd28f89bcd434989d9a')

package() {
      cd "$srcdir/pyexcel-ods-${pkgver}"
      python setup.py install --root="${pkgdir}"
}
