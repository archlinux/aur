# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=python-transmissionrpc
pkgver=0.11
pkgrel=1
pkgdesc="Module to communicate with Transmission BT client via JSON-RPC"
arch=(any)
url="https://bitbucket.org/blueluna/transmissionrpc/wiki/Home"
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=(https://bitbucket.org/blueluna/${pkgname:7}/get/release-${pkgver}.tar.gz)

package() {
	cd "$srcdir/blueluna-${pkgname:7}-eb2a32720f8a"
	python setup.py install --root="$pkgdir/" --optimize=1

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('2ec4dc465435cc970c20f1e10524439b')
