# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=python2-relatorio
pkgver=0.6.1
pkgrel=1
pkgdesc="A templating library able to output odt and pdf files"
arch=('i686' 'x86_64')
url="https://code.google.com/p/python-relatorio"
license=('GPL')
depends=('python2-genshi>=0.5' 'python2-lxml>=1.3.6')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/r/relatorio/relatorio-$pkgver.tar.gz")
md5sums=('07e53dca16116963da8166569c6ce5b4')

build() {
  cd $srcdir/relatorio-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/relatorio-$pkgver
  python2 setup.py install --root=$pkgdir
}
