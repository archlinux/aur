# Maintainer: M0Rf30

pkgname=python2-pyee
pkgver=0.0.9
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python"
arch=(any)
url="https://github.com/jesusabdullah/pyee"
license=('MIT')
depends=('python2')
source=(https://pypi.python.org/packages/source/p/pyee/pyee-$pkgver.tar.gz)

package(){
  cd $srcdir/pyee-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('d72a257a2507ab2376746bfd75c402be')
