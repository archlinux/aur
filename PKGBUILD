# Maintainer: Vekhir <vekhir AT yahoo DOT com>
pkgname=python-i18n
pkgver=0.3.9
pkgrel=2
pkgdesc="Easy to use i18n library for Python"
arch=('any')
url="https://github.com/danhper/python-i18n"
license=('GPL')
depends=('python-yaml')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('df97f3d2364bf3a7ebfbd6cbefe8e45483468e52a9e30b909c6078f5f471e4e8')


build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
