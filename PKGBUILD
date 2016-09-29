# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=python-access_points
_pkgname=access_points
pkgver=0.0.18
pkgrel=1
pkgdesc="Scan your WiFi and get access point information and signal quality"
url='https://github.com/kootenpv/accces_points'
arch=('any')
license=('MIT')
depends=('python')
source=('https://pypi.python.org/packages/6e/0c/6542fae79e27ad2f8f6e741bf810c3ebd38868647f1b8197ecc467e09e4d/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('d3a3ec325d888d5cc09710821162bff7')


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
