# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=0.43.0
pkgrel=1
pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d21ee9ea170363b4a432b9a0e7b9e51994b06ef5ba588e36dd867113dda03bc8')

package() {
    cd "$srcdir/PyWebScrapBook-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}