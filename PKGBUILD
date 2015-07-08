# Maintainer: John Jenkins twodopeshaggy@gmail.com


pkgname=ptop
pkgver=0.0.6
pkgrel=1
pkgdesc="An awesome task manager written in python"
arch=('any')
url="https://github.com/black-perl/ptop"
license=('MIT')
depends=('ncurses' 'python2' 'drawille-git' 'npyscreen-git' 'python2-argparse' 'psutils' 'python2-setuptools')
source=(https://github.com/black-perl/ptop/archive/$pkgver.tar.gz)
md5sums=('84bbfa602758173c749a885fb6556e5b')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python2 setup.py install --root="$pkgdir/" --optimize=1
}
