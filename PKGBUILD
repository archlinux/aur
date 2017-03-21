# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=python2-dockercloud
pkgver=1.0.9
pkgrel=1
pkgdesc="Python Library for Dockercloud"
url="http://cloud.docker.com/"
depends=('python2' 'python2-future' 'python2-requests' 'python2-six' 'python2-websocket-client' )
makedepends=('python2' )
license=('Apache v2')
arch=('any')
source=('https://pypi.python.org/packages/51/bd/a5c4d69dec3f663f2183db0ffb0b9ae25060441c08d1b192c337d772efa8/python-dockercloud-1.0.9.tar.gz')
md5sums=('18a5a7571cc5ee6594a1fe4e000f6341')

build() {
    cd $srcdir/python-dockercloud-1.0.9
    python2 setup.py build
}

package() {
    cd $srcdir/python-dockercloud-1.0.9
    python2 setup.py install --root="$pkgdir" --optimize=1
}
