# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=1.13.1
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1bf96c18a22e38b9b6f6c69fbdfeba99177fa458b3893f6cdc9fad8cba5998a4')

package() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
