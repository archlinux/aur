# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgbase='python-krpc'
_pyname='krpc'
pkgname=('python-krpc' 'python2-krpc')
pkgver=0.3.8
pkgrel=1
pkgdesc="Client library for kRPC, a Remote Procedure Call server for Kerbal Space Program"
url="https://github.com/krpc/krpc"
license=("LGPL3")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/krpc/krpc/releases/download/v$pkgver/krpc-python-$pkgver.zip")
sha256sums=('0063d94c25db486d7ad97b1daadc55b9e68ca89b42141ba4b55404084456edb6')

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
