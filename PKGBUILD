# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('add5c5cd5a407a375617a0538e14157a2c34cff78f6a97958706f44f3332876b')

package() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}