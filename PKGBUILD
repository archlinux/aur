# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-slicerator
pkgver=0.9.4
pkgrel=1
pkgdesc="a lazy-loading, fancy-sliceable iterable "
url="https://github.com/soft-matter/slicerator"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/soft-matter/slicerator/archive/v$pkgver.zip)

check() {
    cd $srcdir/slicerator-"$pkgver"
    nosetests3
}

package() {
    cd $srcdir/slicerator-"$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('527e2ecf8e417f98156cf0b13ee83f12')
