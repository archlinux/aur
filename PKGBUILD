# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=python-access_points
_pkgname=access_points
pkgver=0.4.60
pkgrel=1
pkgdesc="Scan your WiFi and get access point information and signal quality"
url='https://github.com/kootenpv/accces_points'
arch=('any')
license=('MIT')
depends=('python')
source=('https://files.pythonhosted.org/packages/0e/4f/695a9bb57f1e2d8ab86c1835c409c94b00533c2d4ec6f3eff4f187dc6579/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('ef6db5a7678d18276c672ccf9fba84e4')


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
