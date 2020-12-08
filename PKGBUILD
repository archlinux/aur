# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python-stdeb
pkgver=0.10.0
pkgrel=1
pkgdesc='Python to Debian source package conversion utility'
arch=('any')
url='https://github.com/astraw/stdeb'
license=('MIT')
depends=('python' 'python-setuptools' 'python-requests' 'dpkg')
source=("https://pypi.python.org/packages/source/s/stdeb/stdeb-$pkgver.tar.gz")
md5sums=('683a7e783113b3297632733efbbc9ae2')

package() {
	cd "$srcdir/stdeb-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
