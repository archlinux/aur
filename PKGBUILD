# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=('python-polyline' 'python2-polyline')
pkgver=1.3
pkgrel=1
pkgdesc="A Python implementation of Google's Encoded Polyline Algorithm Format."
arch=("any")
url="https://github.com/hicsail/polyline"
license=('MIT')
makedepends=("python2-setuptools" "python-setuptools")
source=("https://github.com/hicsail/polyline/archive/v$pkgver.tar.gz")

package_python-polyline() {
	depends=("python")
	cd "$srcdir/polyline-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-polyline() {
	depends=("python2")
	cd "$srcdir/polyline-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('b153232f7b2ac11c9976c54fcc93aaf5')
