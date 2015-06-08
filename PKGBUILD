# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

pkgname=python2-gitdb
pkgver=0.6.4
pkgrel=1
pkgdesc="IO of git-style object databases"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/gitdb"
license=('BSD')
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-smmap>=0.8.5')
source=("http://pypi.python.org/packages/source/g/gitdb/gitdb-${pkgver}.tar.gz")

md5sums=('44e4366b8bdfd306b075c3a52c96ae1a')

package() {
  cd "$srcdir/gitdb-$pkgver"
  python2 setup.py install --root="$pkgdir/" || return 1
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
