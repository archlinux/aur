# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=2.2
pkgrel=2
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('f3aa56404ac08f03b87a6b1d4606fab0404993677facad2beb195e6f2b251c3d')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
