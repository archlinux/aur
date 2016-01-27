# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=buku
pkgver=1.6
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/$pkgver)
sha256sums=('4b0297b3fceed9e691f7468894421c2d28c2ab7695e8ac988d5f661a0bf1ae55')

package() {
  cd "$srcdir/Buku-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
