# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=python-neteria
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple game networking library."
url="http://www.neteria.org"
depends=('python')
license=('GPLv3')
arch=('any')
source=('https://pypi.python.org/packages/source/n/neteria/neteria-1.0.1.tar.gz')
md5sums=('cd084ad1ee7ab7cff5fa83e585475887')

build() {
    cd $srcdir/neteria-1.0.1
    python setup.py build
}

package() {
    cd $srcdir/neteria-1.0.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
