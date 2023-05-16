# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-xbee
pkgver=2.3.2
pkgrel=4
pkgdesc='Python tools for working with XBee radios'
url='https://pypi.python.org/pypi/XBee'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-pyserial')
source=("https://pypi.io/packages/source/X/XBee/XBee-${pkgver}.tar.gz")
sha256sums=('77c06de63403409a7e6ca2305b05f499fbff52a0d6031366ffb7acebe14db657')

package() {
  cd XBee-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
