# Maintainer: Srevin Saju <srevin03@gmail.com>
pkgname=gwebsockets-git
pkgver=0.7.g
pkgrel=5
pkgdesc="A websocket server written in Python"
arch=('any')
url="https://github.com/sugarlabs/gwebsockets"
license=('Apache-2.0')
makedepends=('python-setuptools')
source=("git+https://github.com/sugarlabs/gwebsockets.git")
sha256sums=('SKIP')



build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
