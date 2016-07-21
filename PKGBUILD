# Maintainer: fclad <fcladera at fcladera.com>

_pkgname=plotly
pkgname=python-plotly
pkgver=1.12.4
pkgrel=1
pkgdesc="An interactive, browser-based charting library for python"
arch=('any')
url="https://plot.ly/python/"
license=('MIT')
depends=('python-requests' 'python-pytz')
makedepends=('git' 'python' 'python-setuptools')
source=('https://pypi.python.org/packages/02/e0/5b739403c3180298ebe277cbc9f5ee99e546ab24768b1732a2d6b381091b/'$_pkgname'-'$pkgver'.tar.gz')
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
