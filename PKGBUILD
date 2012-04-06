# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pymysql
pkgver=0.5
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="http://www.pymysql.org/"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/P/PyMySQL/PyMySQL-$pkgver.tar.gz" LICENSE)

build() {
	cd "$srcdir/PyMySQL-$pkgver"
	python2 setup.py install --root="$pkgdir" --prefix=/usr
	install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


md5sums=('125e8a3449e05afcb04874a19673426b'
         'c4667d5973931f7f10e60889c2365ba7')
