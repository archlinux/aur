# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=docker-cloud
pkgver=1.0.7
pkgrel=1
pkgdesc="CLI for Docker Cloud"
url="http://cloud.docker.com/"
depends=('python2' 'python2-ago' 'python2-dockercloud' 'python2-yaml' 'python2-future' 'python2-dateutil' 'python2-requests' 'python2-six' 'python2-tabulate' 'python2-websocket-client' )
makedepends=('python2' )
license=('Apache v2')
arch=('any')
source=('https://pypi.python.org/packages/0b/37/5dab4fa0559b0402736d5f23a2ef0b3252baccde45f1d571583cadd6e50b/docker-cloud-1.0.7.tar.gz')
md5sums=('b03867a0a6a0a845c469df84b34488fd')

build() {
    cd $srcdir/docker-cloud-1.0.7
    python2 setup.py build
}

package() {
    cd $srcdir/docker-cloud-1.0.7
    python2 setup.py install --root="$pkgdir" --optimize=1
}
