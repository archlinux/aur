#Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=python2-pysonic
pkgver=0.6.2
pkgrel=1
pkgdesc="A python library to wrap the Subsonic REST API"
arch=('any')
url="https://github.com/crustymonkey/py-sonic"
license=('GPL3')
depends=(
    'python2-setuptools')
makedepends=('python2')
provides=('python2-pysonic')
source=("https://github.com/crustymonkey/py-sonic/archive/${pkgver}.tar.gz")
sha256sums=('6199be3cb76f6949e827db57f5731a2c894e2d2912ca6895c71ade8d31e3f450')

package() {
  cd "$srcdir/py-sonic-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
