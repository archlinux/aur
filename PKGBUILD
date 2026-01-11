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
source=("https://files.pythonhosted.org/packages/source/p/xecli/xecli-${pkgver}.tar.gz")
sha256sums=('SKIP')  

build() {
    cd "$srcdir/xecli-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/xecli-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}