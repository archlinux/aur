# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=2.7
pkgrel=0
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('9ebc95a665e56460d91b9d98711f1eba722b14a14a058e2ef330b117b79943fe')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
