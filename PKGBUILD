# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.5
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('6073c0c8cb204cc91db1bd2a98ef396d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 clockr "${pkgdir}/usr/bin/clockr"
  install -Dm644 clockr.1 "${pkgdir}/usr/share/man/man1/clockr.1"
}
