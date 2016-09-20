#Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=python2-pysonic
pkgver=0.5.1
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
sha256sums=('a1d44fd008c63da8f968c2c07a51097ff78b1990937600a3e81c80a06e35a0b7')

package() {
  cd "$srcdir/py-sonic-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
