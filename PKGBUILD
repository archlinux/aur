# Maintainer: Sebastian Gumprich <aur at gumpri dot ch>
pkgname=python2-dockercloud
pkgver=1.0.12
pkgrel=1
pkgdesc="Python Library for Dockercloud"
url="http://cloud.docker.com/"
depends=('python2' 'python2-future' 'python2-requests' 'python2-six' 'python2-websocket-client')
makedepends=('python2-distribute' 'python2')
license=('Apache v2')
arch=('any')
source=('https://pypi.python.org/packages/97/66/776e420e7db5d3c20921e88f1cb333737ace862c8d02234367b32d969525/python-dockercloud-1.0.12.tar.gz')
md5sums=('53a44c6cf3491f4b9f9ef450420bf1f0')

build() {
    cd $srcdir/python-dockercloud-1.0.12
    python2 setup.py build
}

package() {
    cd $srcdir/python-dockercloud-1.0.12
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
