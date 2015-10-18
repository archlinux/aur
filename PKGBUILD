# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=1.0
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('65dea52c5af733a97815827e2ce61148')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
