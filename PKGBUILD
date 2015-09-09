# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.2
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('0d864b8a441f6952dbd0fec907209379')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 clockr "${pkgdir}/usr/bin/clockr"
}
