pkgname="python-pyaxmlparser"
pkgver=0.3.12
pkgrel=1
pkgdesc='Parser for Android XML file and get Application Name without using Androguard '
arch=('any')
url='https://github.com/appknox/pyaxmlparser'
makedepends=('python-setuptools')
depends=('python' 'python-lxml' 'python-click')
license=('MIT')
source=("pyaxmlparser-${pkgver}.tar.gz::https://github.com/appknox/pyaxmlparser/archive/v${pkgver}.tar.gz")
md5sums=('6dbb6db8c238bda9d5b5a1f2ade56e5c')

build() {
    cd "$srcdir/pyaxmlparser-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyaxmlparser-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
