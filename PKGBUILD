# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-colorful
pkgver=0.5.4
pkgrel=1
pkgdesc="Terminal string styling done right, in Python"
arch=('any')
url="https://github.com/timofurrer/colorful"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6800079a7bd4a3d17b4915b195267f80802703df8fe276565e5cedf7691807dd')

build() {
	cd "colorful-$pkgver"
	python setup.py build
}

package() {
	cd "colorful-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
