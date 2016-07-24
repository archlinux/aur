# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-slicerator
pkgver=0.9.7
pkgrel=2
pkgdesc="a lazy-loading, fancy-sliceable iterable "
url="https://github.com/soft-matter/slicerator"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/s/slicerator/slicerator-$pkgver.tar.gz")

check() {
    cd $srcdir/slicerator-"$pkgver"
    nosetests3
}

package() {
    cd $srcdir/slicerator-"$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('2730493509da7c269a5afac80bcfbedb')
