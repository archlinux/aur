# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=1.5
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/$pkgver)
sha256sums=('93fb403ac487afc609088b72a02613aaa3dd65e3358c1c332f3636371e4b3dc2')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
