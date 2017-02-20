# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=2.9
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'python-requests' 'python-urllib3')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('d4175aab5fab72d41cd646f688311bc347d5fcdad23dc58ee87dffb695c5a51b')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
