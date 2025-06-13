pkgname=python-giphypop
pkgver=0.3
pkgrel=1
arch=('x86_64')
url='https://github.com/shaunduncan/giphypop'
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'git')
pkgdesc="giphypop is a wrapper around the Giphy api. It aims to provide a more intuitive, pythonic way for interacting with the Giphy api"
source=("$pkgname-$pkgver::git+https://github.com/shaunduncan/giphypop")
sha256sums=('SKIP')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir"
}
