# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=python2-tornadio2
_realname=TornadIO2
pkgver=0.0.4
pkgrel=1
pkgdesc='Socket.io server implementation on top of Tornado'
arch=('any')
url='http://github.com/MrJoes/tornadio2'
license=('APACHE')
depends=('python2' 'python2-distribute' 'python2-tornado')
source=("https://pypi.python.org/packages/source/T/TornadIO2/TornadIO2-0.0.4.tar.gz")
md5sums=('e500878c082746aa436116c88b3a1cdb')

build() {
	cd "$srcdir/TornadIO2-$pkgver"
	python2 setup.py build
}
package() {
	cd "$srcdir/$_realname-$pkgver"

	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}