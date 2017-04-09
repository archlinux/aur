#Maintainer: fclad <fcladera at fcladera.com>

_pkgname=plotly
pkgname=python-plotly
pkgver=2.0.7
pkgrel=1
pkgdesc="An interactive, browser-based charting library for python"
arch=('any')
url="https://plot.ly/python/"
license=('MIT')
depends=('python-requests' 'python-pytz')
makedepends=('git' 'python' 'python-setuptools')
source=('https://pypi.python.org/packages/8c/4a/9e42d13f74a2c7872ba6e7a868b152bd815c01038144570ec729ff13c065/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('SKIP')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
