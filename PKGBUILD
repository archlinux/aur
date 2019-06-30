# Maintainer: robertfoster

pkgname='python-flask-themes2'
pkgver=0.1.3
pkgrel=1
pkgdesc="Easily theme your Flask app"
url="https://github.com/sysr-q/flask-themes2"
license=('MIT')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-setuptools')
source=("https://github.com/sysr-q/flask-themes2/archive/$pkgver.tar.gz")

build() {
	cd $srcdir/${pkgname##python-}-$pkgver
	python setup.py build
}

package() {
	cd ${srcdir}/${pkgname##python-}-$pkgver
	python setup.py install --root=$pkgdir
}

md5sums=('4bcea481a74b4f3b125df63ff9b27b1f')
