# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24-network
pkgver='1.0.9'
pkgrel=1
pkgdesc='Python bindings for networking with RF24 radio modules'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://tmrh20.github.io/RF24Network/'
license=('MIT')
depends=('boost-libs' 'rf24-network' 'python' 'python-rf24')
makedepends=('boost' 'python-setuptools')
source=('git://github.com/TMRh20/RF24Network')
md5sums=('SKIP')

build() {
  cd "$srcdir/RF24Network/RPi/pyRF24Network"
  python setup.py build
}

package() {
  cd "$srcdir/RF24Network/RPi/pyRF24Network"
  python setup.py install --root="$pkgdir/" --optimize=1
}

