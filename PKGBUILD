# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-formlayout
pkgver=1.1.0
pkgrel=1
pkgdesc="Tiny Python module for creating form dialogs/widgets to edit various type of parameters"
arch=('any')
url="https://github.com/PierreRaybaut/formlayout"
license=('GPL')
depends=('python2-pyqt4')
makedepends=('python2-distribute' 'unzip')
options=(!emptydirs)

source=("https://github.com/PierreRaybaut/formlayout/archive/v${pkgver}.tar.gz")
md5sums=('bdc143d6af61bf0092910ea6234454f5')

build() {
  cd "$srcdir/formlayout-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/formlayout-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

