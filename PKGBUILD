# Maintainer: Guillaume Brogi <gui-gui at netcourrier dot com>
pkgname=python-progress
_pkgname=progress
pkgver=1.3
pkgrel=1
pkgdesc="Easy to use progress bars for Python"
arch=('any')
url="https://github.com/verigak/progress"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f0294eca56eed70f3459e434e8fe4c223a677bdfea6a28a97740f91a86130c43')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

