# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markit
pkgver=1.4
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'sqlite')
makedepends=('make')
url="https://github.com/jarun/MarkIt"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/MarkIt/tar.gz/$pkgver)
sha256sums=('1e25fd3252dee994ff5b8b3b8e0dec35fb83763bf75fc6f69574923ff049d87b')

package() {
  cd "$srcdir/MarkIt-$pkgver"

  msg2 'Installing...'
  make PREFIX="$pkgdir/usr" install
}
