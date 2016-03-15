# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=1.7
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/$pkgver)
sha256sums=('0baf1594b1bf4bf47dc6b6c1e011a49e07bb6f8b6ce5f637c321f17382d9fdb2')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
