# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgbase='python-krpc'
_pyname='krpc'
pkgname=('python-krpc' 'python2-krpc')
pkgver=0.4.5
pkgrel=1
pkgdesc="Client library for kRPC, a Remote Procedure Call server for Kerbal Space Program"
url="https://github.com/krpc/krpc"
license=("LGPL3")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/krpc/krpc/releases/download/v$pkgver/krpc-python-$pkgver.zip")
sha256sums=('00eb17b1faaf437ddae64bb684202ec3c3f632025ee3d6c9faf69c5cec328cf2')

package_python-krpc() {
  depends=('python' 'python-protobuf')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
}

package_python2-krpc() {
  depends=('python2' 'python2-protobuf')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
}
