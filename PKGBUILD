# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-slicerator
pkgver=0.9.8
pkgrel=1
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
md5sums=('84a47c30fd06ba0f808f0d89e6a3e807')
