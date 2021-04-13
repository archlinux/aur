# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=python2-altgraph
pkgver=0.17
pkgrel=1
pkgdesc="Altgraph is a fork of graphlib: a graph (network) package for constructing graphs"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/altgraph"
   # http://pythonhosted.org/altgraph
   # https://bitbucket.org/ronaldoussoren/altgraph
license=("MIT")
depends=("python2")
makedepends=("python2-distribute")
source=("https://files.pythonhosted.org/packages/source/a/altgraph/altgraph-${pkgver}.tar.gz")
md5sums=('9450020282270749db205038b8c90b55')

package() {
  cd "$srcdir/altgraph-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

