# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.3
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('1cee275122c2c42c3c07e429c2fe61a7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 clockr "${pkgdir}/usr/bin/clockr"
}
