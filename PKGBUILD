# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git
pkgname=python-lml
pkgver=0.0.1
pkgrel=2
pkgdesc="Load me later. A lazy loading plugin management system."
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.python.org/packages/8c/7c/f6d8f39e3663d6db2b1ceb4c72bbc0b7e18d6b1fb4c66c879a0d973c42aa/lml-0.0.1.tar.gz")
md5sums=('6c4e9b0cc53c8be5195d696dcc09e6c9')

build() {
      cd "$srcdir/lml-${pkgver}"
      python setup.py build
}

package() {
      cd "$srcdir/lml-${pkgver}"
      python setup.py install --root=${pkgdir}
}
