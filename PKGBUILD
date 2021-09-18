# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>

pkgname=lugat
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for Turkish Language Association's Güncel Türkçe Sözlük"
arch=('any')
url="https://github.com/ademozay/lugat"
license=('MIT')
depends=('python' 'python-termcolor' 'python-requests')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('82e00f76bfdd71d28eb8a9cda0c11c76f3f99f2bf196744ee0056be4b4b4e9b3')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
