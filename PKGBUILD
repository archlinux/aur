# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=1.9
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/$pkgver)
sha256sums=('0bac6f4f1b6bcca4eea639a3a6ff22c4937f22fc49271bb610f8b25ddbf890e2')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
