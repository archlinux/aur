# Contributor: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=python2-relatorio
pkgver=0.8.0
pkgrel=1
pkgdesc="A templating library able to output odt and pdf files"
arch=('i686' 'x86_64')
url="http://relatorio.tryton.org/"
license=('GPL')
depends=('python2-genshi>=0.5' 'python2-lxml>=2.0')
optdepends=('python2-pycha>=0.4.0: chart support' 'python2-yaml'
	'python2-magic: fodt support')
makedepends=('python2-distribute')
source=("https://pypi.io/packages/source/r/relatorio/relatorio-$pkgver.tar.gz")
md5sums=('ba7061dfb512b57dfd54317a183f5278')

build() {
  cd $srcdir/relatorio-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/relatorio-$pkgver
  python2 setup.py install --root=$pkgdir
}
