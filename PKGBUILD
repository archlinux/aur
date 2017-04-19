# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=python2-dockercloud
pkgver=1.0.10
pkgrel=1
pkgdesc="Python Library for Dockercloud"
url="http://cloud.docker.com/"
depends=('python2' 'python2-future' 'python2-requests' 'python2-six' 'python2-websocket-client')
makedepends=('python2-distribute' 'python2')
license=('Apache v2')
arch=('any')
source=('https://pypi.python.org/packages/98/1f/335af231fcf9036b3bcaa0395afada415e6ecc46e6b57b2ee2964ae490c1/python-dockercloud-1.0.10.tar.gz')
md5sums=('53e6ab60cda702272509d80d548d8d95')

build() {
    cd $srcdir/python-dockercloud-1.0.10
    python2 setup.py build
}

package() {
    cd $srcdir/python-dockercloud-1.0.10
    python2 setup.py install --root="$pkgdir" --optimize=1
}
