# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-xbee
pkgver=2.3.1
pkgrel=1
pkgdesc='Python tools for working with XBee radios'
url='https://pypi.python.org/pypi/XBee'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-pyserial')
source=("https://pypi.io/packages/source/X/XBee/XBee-${pkgver}.tar.gz")
md5sums=('268330b90052086bc573e2d298166222')

package() {
  cd XBee-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
