# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=1.8
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/$pkgver)
sha256sums=('523b4e63697444d1ad7605f2db41f4c5192fa262b416dd111d0b6a6e620b9f47')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
