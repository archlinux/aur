# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=tekaim
pkgver=1.1.0
pkgrel=1
pkgdesc='A simple tool to take and upload screenshots to teknik.io'
arch=(any)
url='https://github.com/IvanFon/tekaim'
license=(GPL3)
depends=('python' 'curl' 'xclip')

source=(https://github.com/IvanFon/tekaim/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('0b7214824ba2a0b29e15c87c7d1935c8eaf7821a99a8fa4ecc97bb3a50f4fc5f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

