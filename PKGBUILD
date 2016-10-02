# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=python-access_points
_pkgname=access_points
pkgver=0.2.38
pkgrel=1
pkgdesc="Scan your WiFi and get access point information and signal quality"
url='https://github.com/kootenpv/accces_points'
arch=('any')
license=('MIT')
depends=('python')
source=('https://pypi.python.org/packages/81/51/25a003b795ee857b0043a1dc6506869b14007078d4186cbc8a5129d31ea9/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('e6db0b72d2da2c3176b2c50433743627')


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
