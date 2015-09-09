# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.6
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('96aae2b9eb4a4bf0f63f518a202d6a90')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
