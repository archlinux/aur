# Maintainer: fclad <fcladera at fcladera.com>

_pkgname=plotly
pkgname=python-plotly
pkgver=1.9.9
pkgrel=1
pkgdesc="An interactive, browser-based charting library for python"
arch=('any')
url="https://plot.ly/python/"
license=('MIT')
depends=('python-requests' 'python-pytz')
makedepends=('git' 'python' 'python-setuptools')
source=('https://pypi.python.org/packages/source/p/'$_pkgname'/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('SKIP')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
