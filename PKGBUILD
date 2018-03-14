# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=tekaim
pkgver=1.0.1
pkgrel=1
pkgdesc='A simple tool to take and upload screenshots to teknik.io'
arch=(any)
url='https://github.com/IvanFon/tekaim'
license=(GPL3)
depends=('python' 'curl')

source=(https://github.com/IvanFon/tekaim/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('abbf71f8df9bb79fedd16b2d60ff8861d568fdd07932125ef98b41a2c98b93bc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

