
pkgname=python2-clusterpy
_pkgname=clusterPy
pkgver=0.9.9
_pkgver=0.9.9
pkgrel=1
pkgdesc="Clusterpy is a librery of spatially constrained clustering algorithms."
arch=(any)
url="http://www.rise-group.org/risem/clusterpy/"
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-nose' 'python2-scipy' 'python2-polygon')
makedepends=('python2-distribute')
#source=($pkgname::git://github.com/clusterpy/clusterpy.git#branch=master)
source=('https://github.com/clusterpy/clusterpy/releases/download/v0.9.9/clusterPy-0.9.9.tar.gz')
md5sums=('392beb2c03b14f710055c33547ec7ced')

build() {
    cd $_pkgname-$_pkgver/
    python2 setup.py build
}

package() {
    cd $_pkgname-$_pkgver/
    python2 setup.py install --root="$pkgdir"
}
