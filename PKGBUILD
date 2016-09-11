# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-xbee
pkgver=2.2.3
pkgrel=1
pkgdesc='Python tools for working with XBee radios'
url='https://pypi.python.org/pypi/XBee'
arch=('any')
license=('MIT')
depends=('python' 'python-pyserial')
source=("https://pypi.python.org/packages/source/X/XBee/XBee-${pkgver}.tar.gz")
md5sums=('f9a103c8b2f4d8384c9d0ee25f7b2efc')

package() {
  cd XBee-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
