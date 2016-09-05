# Maintainer: fclad <fcladera at fcladera.com>

_pkgname=plotly
pkgname=python-plotly
pkgver=1.12.9
pkgrel=1
pkgdesc="An interactive, browser-based charting library for python"
arch=('any')
url="https://plot.ly/python/"
license=('MIT')
depends=('python-requests' 'python-pytz')
makedepends=('git' 'python' 'python-setuptools')
source=('https://pypi.python.org/packages/ce/4b/1b7c4bb89b7708d4127b4ebcb2b6e5961c9e1bc3847b4705d57fdc66212f/'$_pkgname'-'$pkgver'.tar.gz')
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
