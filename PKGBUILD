# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-requesocks
pkgver=0.10.8
pkgrel=1
pkgdesc="Python HTTP for Humans, with socks proxy support"
arch=('any')
url="https://pypi.python.org/pypi/requesocks"
license=('ISC')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/r/requesocks/requesocks-$pkgver.tar.gz)

build() {
  cd "$srcdir/requesocks-$pkgver"
  python2 setup.py build
}

package(){
  cd "$srcdir/requesocks-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('3f43bd8a00c704b3de4f1a212cc72818')
