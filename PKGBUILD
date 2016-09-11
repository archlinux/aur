# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=2.4
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('55a0065389475b6993503e20271fcd1705a98c3c3aea8211971ffb055ae5d9fb')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
