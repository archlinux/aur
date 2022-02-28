# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=1.3.1
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3018cd7a3b8ef955f295b1c1dbb94201f2e2f7b08a10919afb51d64c0e170ffe')

package() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}