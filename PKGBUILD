# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=webscrapbook
pkgname=python-$_pkgname
pkgver=1.7.0
pkgrel=1
pkgcommit=66bbe80d8be3c6687c01698ca79ff61eabf36d2f

pkgdesc="PyWebScrapBook is a command line toolkit and backend server for WebScrapBook browser extension"
arch=('any')
url="https://github.com/danny0838/PyWebScrapBook"
license=('MIT')
depends=('python' 'python-commonmark' 'python-flask' 'python-lxml' 'python-pyopenssl' 'python-werkzeug' 'python-jinja')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgcommit}.tar.gz")
sha256sums=('d7e91a52643dffe3d22332cc6ef5c06137ebe598880f2f2c26c4368559372a00')

package() {
    cd "$srcdir/PyWebScrapBook-${pkgcommit}"
    python setup.py install --root="$pkgdir/" --optimize=1
}