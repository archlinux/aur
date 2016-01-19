# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=py_time_widget
pkgver=1.0
pkgrel=1
pkgdesc="Sends the current time to libnotify. Desktop widget"
arch=('i686' 'x86_64')
url="https://github.com/rndmh3ro/py_time_widget"
depends=('python' )
makedepends=('python')
license=('GPL3')
source=('https://pypi.python.org/packages/source/p/py_time_widget/py_time_widget-1.0.tar.gz')
md5sums=('0bee9afd0079fae16b0670ab26e63b80')

build() {
    cd $srcdir/py_time_widget-1.0
    python setup.py build
}

package() {
    cd $srcdir/py_time_widget-1.0
    python setup.py install --root="$pkgdir" --optimize=1
}
