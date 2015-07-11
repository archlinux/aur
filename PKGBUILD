# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-paypalrestsdk
pkgver=1.1.0
pkgrel=1
pkgdesc="The PayPal REST SDK provides Python APIs to create, process and manage payment"
arch=('any')
url="https://pypi.python.org/pypi/paypalrestsdk"
license=('PAYPAL')
groups=()
depends=('python2' 'python2-httplib2')
makedepends=('python2-distribute')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/p/paypalrestsdk/paypalrestsdk-$pkgver.tar.gz)
sha256sums=('3453bcc28a47df50e066d0553d01f84ffe915f6335863f24f7ac8358997f8f6b')

package() {
  cd "$srcdir/paypalrestsdk-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
