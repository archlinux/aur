# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.7.5
pkgrel=1
pkgdesc="Reads and writes spatial data files"
arch=('any')
url="https://github.com/Toblerity/Fiona"
license=('BSD')
checkdepends=('python-click-plugins' 'python-nose')
depends=('python' 'cython' 'python-six' 'python-cligj' 'python-munch' 'gdal')
optdepends=('python-click-plugins: for fio command line tool.')
options=(!emptydirs)
source=("https://pypi.python.org/packages/6d/d6/4b6535985347609e2096885497519b69e1231dcc77d8b829e02c57baf327/Fiona-$pkgver.tar.gz")
sha256sums=('7875f64f717c97ac5d54521fbeb1f0a1594463119d8fd43d5aa2aa28d8bccffd')

#check() {
#    cd "$srcdir/Fiona-$pkgver"
#    python setup.py build_ext --inplace
#    nosetests
#}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
