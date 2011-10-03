# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Yejun Yang <yejunx AT gmail DOT com>

pkgname=python2-dbutils
pkgver=1.1
pkgrel=1
pkgdesc="DBUtils is a suite of Python modules allowing to connect in a safe and efficient way between a threaded Python application and a database. "
url="http://www.webwareforpython.org/DBUtils"
license=(Open Software License)
depends=('python2')
arch=('any')
source=(http://www.w4py.org/downloads/DBUtils/DBUtils-$pkgver.tar.gz LICENSE)
md5sums=('aa13d60db0377234c5f9469212da5022'
         'b4ca5ed7b0cf090b1c01afe3e67135af')

build() {
  cd "$srcdir/DBUtils-$pkgver"
  python2 setup.py install --root="$pkgdir"

  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

