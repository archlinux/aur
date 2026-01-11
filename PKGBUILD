# Maintainer: sorrow
pkgname=xecli
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python CLI to manage xEclipsity tools and releases"
arch=('any')
url="https://github.com/xEclipsity/xecli"
license=('MIT')
depends=('python' 'python-requests' 'python-typer')
makedepends=('python-setuptools' 'python-wheel')

source=("xecli-1.0.0.tar.gz")  
sha256sums=('SKIP') 

build() {
    cd "$srcdir/xecli-1.0.0"
    python setup.py build
}

package() {
    cd "$srcdir/xecli-1.0.0"
    python setup.py install --root="$pkgdir" --optimize=1
}