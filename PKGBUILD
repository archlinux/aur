# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=clockr
pkgver=0.9
pkgrel=1
pkgdesc="simple curses clock wirtten in python"
arch=('any')
url="https://github.com/shaggytwodope/clockr"
license=('MIT')
depends=('python' 'ncurses')
source=("https://github.com/shaggytwodope/clockr/archive/v$pkgver.tar.gz")
md5sums=('572968183b93372d0dfbd3400ed45baa')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
