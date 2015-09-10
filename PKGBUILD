# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.7
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('e257cadc8935acc4ae56b99b5b8eaba6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
