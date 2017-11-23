pkgname="python-pyaxmlparser"
pkgver=0.3.7
pkgrel=1
pkgdesc='Parser for Android XML file and get Application Name without using Androguard '
arch=('any')
url='https://github.com/appknox/pyaxmlparser'
makedepends=('python-setuptools')
depends=('python' 'python-lxml')
license=('MIT')
source=("pyaxmlparser-${pkgver}.tar.gz::https://github.com/appknox/pyaxmlparser/archive/v${pkgver}.tar.gz")
md5sums=('c9c881afd809f492ffac5bea88787107')

build() {
    cd "$srcdir/pyaxmlparser-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyaxmlparser-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
