# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.4
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('711a68094cfd5eec7fbc79f31d74d66f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 clockr "${pkgdir}/usr/bin/clockr"
}
