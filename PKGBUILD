# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=tekaim
pkgver=1.6.0
pkgrel=1
pkgdesc='A simple tool to take and upload screenshots to teknik.io'
arch=(any)
url='https://github.com/IvanFon/tekaim'
license=(GPL3)
depends=('python' 'curl' 'xclip')

source=(https://github.com/IvanFon/tekaim/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('78f7fd651f96fb0711277ed097dcaf75e9b9d39a003a88600270c1d47b993fda')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Run setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}

