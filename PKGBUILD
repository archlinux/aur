pkgname=python-flask_autoindex
pkgver=0.6.6
pkgrel=2
arch=('x86_64')
url='https://github.com/general03/flask-autoindex'
license=('MIT')
depends=('python' 'python-flask' 'python-flask-silk')
makedepends=('python-setuptools' 'git')
pkgdesc="A mod_autoindex for Flask"
source=("$pkgname-$pkgver::git+https://github.com/general03/flask-autoindex#tag=v$pkgver")
sha256sums=('6f9ce24a65d36d68c3ab70acbfd75e265e7f37d47c575f1ef3141ddb33e2afd2')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir"
}
