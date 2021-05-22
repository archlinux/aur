# Maintainer: loredan13
_projectname='can'
pkgname="python2-$_projectname"
pkgver='3.3.4'
pkgrel='1'
pkgdesc="Python library to access CAN bus via SocketCAN, Kvaser's CANLIB, or CAN over Serial"
arch=('any')
url="https://pypi.python.org/pypi/python-can"
license=('LGPL3')
makedepends=('python2-setuptools')
depends=('python2')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/hardbyte/python-can/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('be084a1cedcfd39b394b151e75526fb4d7418a7fcb77c63bf5344e086cad7fcb')

package() {
	cd "$srcdir/python-$_projectname-$pkgver/"
	python2 setup.py install --root="$pkgdir/"
}
