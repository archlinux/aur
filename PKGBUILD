# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python-stdeb
pkgver=0.8.5
pkgrel=1
pkgdesc='Python to Debian source package conversion utility'
arch=('any')
url='https://github.com/astraw/stdeb'
license=(' MIT')
depends=('python' 'python-setuptools' 'python-requests' 'dpkg')
source=("https://pypi.python.org/packages/source/s/stdeb/stdeb-$pkgver.tar.gz")
md5sums=('afebfb9ca1c545fa15ad575679879f91')

package() {
	cd "$srcdir/stdeb-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
