# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-slicerator
pkgver=0.9.7
pkgrel=2
pkgdesc="a lazy-loading, fancy-sliceable iterable "
url="https://github.com/soft-matter/slicerator"
arch=(any)
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=("https://files.pythonhosted.org/packages/source/s/slicerator/slicerator-$pkgver.tar.gz")

check() {
    cd $srcdir/slicerator-"$pkgver"
    nosetests2
}

package() {
    cd $srcdir/slicerator-"$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('2730493509da7c269a5afac80bcfbedb')
