# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=python-access_points
_pkgname=access_points
pkgver=0.2.31
pkgrel=1
pkgdesc="Scan your WiFi and get access point information and signal quality"
url='https://github.com/kootenpv/accces_points'
arch=('any')
license=('MIT')
depends=('python')
source=('https://pypi.python.org/packages/47/7b/1cc26fbdbf770e9c0b04bdc7a0788a4b366261f65ab9741693959105a87e/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('fcbc7f910c8bdf9107e4424413598062')


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
