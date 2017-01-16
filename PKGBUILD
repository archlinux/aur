# Maintainer: Jan Korte <j.korte@me.com>

pkgname=treenote-git
pkgver=20170116
pkgrel=1
pkgdesc="An intuitive outliner for personal knowledge and task management."
arch=('any')
url="http://treenote.org"
license=('GPL3')
depends=('python-pip' 'python-pyqt5')
makedepends=('git')
source=("git+https://github.com/TreeNote/TreeNote")
md5sums=('SKIP')

package() {
  cd "$srcdir/TreeNote"
  python setup.py install --root="$pkgdir"
}
