# Maintainer: sorrow
pkgname=python-xecli
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python CLI to manage xEclipsity tools and releases"
arch=('any')
url="https://github.com/xEclipsity/xecli"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/a1/33/c618301c950ae701c89c07fed2b44c6ec8c9392a645daab26c3ab4e14cc7/xecli-1.0.0.tar.gz")
sha256sums=('5022ef3cc59a4b5d0621dca4d3204a4618caa445a73ba7b62e7b61ab0f7ef52b')

build() {
    cd "$srcdir/xecli-1.0.0"
    python setup.py build
}

package() {
    cd "$srcdir/xecli-1.0.0"
    python setup.py install --root="$pkgdir" --optimize=1
}