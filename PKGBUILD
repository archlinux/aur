# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.1
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('01e83df419e6a18c95d06dd73c8ef811')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 clockr "${pkgdir}/usr/bin/clockr"
}
