# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-formlayout
pkgver=1.0.15
pkgrel=1
pkgdesc="Tiny Python module for creating form dialogs/widgets to edit various type of parameters"
arch=('any')
url="http://code.google.com/p/formlayout/"
license=('GPL')
depends=('python2-pyqt4')
makedepends=('python2-distribute' 'unzip')
options=(!emptydirs)

source=(http://formlayout.googlecode.com/files/formlayout-$pkgver.zip)
md5sums=('db2d06281158506bee84732da9888ff0')

build() {
  cd "$srcdir/formlayout-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/formlayout-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

