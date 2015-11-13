# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-slicerator
pkgver=0.9.4
pkgrel=1
pkgdesc="a lazy-loading, fancy-sliceable iterable "
url="https://github.com/soft-matter/slicerator"
arch=(any)
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=(https://github.com/soft-matter/slicerator/archive/v$pkgver.zip)

check() {
    cd $srcdir/slicerator-"$pkgver"
    nosetests2
}

package() {
    cd $srcdir/slicerator-"$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('527e2ecf8e417f98156cf0b13ee83f12')
