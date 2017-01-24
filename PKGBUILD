# Maintainer: fclad <fcladera at fcladera.com>

_pkgname=plotly
pkgname=python-plotly
pkgver=1.13.0
pkgrel=1
pkgdesc="An interactive, browser-based charting library for python"
arch=('any')
url="https://plot.ly/python/"
license=('MIT')
depends=('python-requests' 'python-pytz')
makedepends=('git' 'python' 'python-setuptools')
source=('https://pypi.python.org/packages/a6/77/f58428e17a3251a9d245fb5920e7e6af56ae8de8de12fa8431c176fce329/'$_pkgname'-'$pkgver'.tar.gz')
#source=('https://pypi.python.org/packages/source/p/'$_pkgname'/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('SKIP')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
