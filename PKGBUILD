# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgbase='python-krpc'
_pyname='krpc'
pkgname=('python-krpc' 'python2-krpc')
pkgver=0.3.5
pkgrel=4
pkgdesc="Client library for kRPC, a Remote Procedure Call server for Kerbal Space Program"
url="https://github.com/krpc/krpc"
license=("LGPL3")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=('https://pypi.python.org/packages/5a/32/384b36e6d983a0af26878b2f7e7292b2d4796f25caab2bf2cc3ce70942eb/krpc-0.3.5.zip')
md5sums=('389cc10b519ecbf4a86a74c0da0bf7dd')

package_python-krpc() {
  depends=('python' 'python-protobuf3')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
}

package_python2-krpc() {
  depends=('python2' 'python2-protobuf3')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
}
