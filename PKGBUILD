#Maintainer: Guillaume Dott <guillaume+github at dott dot fr>

pkgname=python-pysonic
pkgver=0.7.7
pkgrel=1
pkgdesc="A python library to wrap the Subsonic REST API"
arch=('any')
url="https://github.com/crustymonkey/py-sonic"
license=('GPL3')
depends=(
    'python-setuptools')
makedepends=('python')
provides=('python-pysonic')
source=("https://github.com/crustymonkey/py-sonic/archive/${pkgver}.tar.gz")
sha256sums=('2de521d5c79d73025f32ac261ab581bdef1e100c00e7fd0d8992310af662d998')

package() {
  cd "$srcdir/py-sonic-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
