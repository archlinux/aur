# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=gpgsync
pkgver=0.3.2
pkgrel=1
pkgdesc="A tool to let users always have up-to-date public keys for other members of their organization."
arch=('any')
url="https://github.com/firstlookmedia/gpgsync/"
license=('GPL3')
depends=('python-setuptools' 'python-pyqt5' 'python-nose' 'python-requests' 'python-socks' 'python-packaging' 'python-dateutil' 'gnupg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firstlookmedia/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('06ad81365c149a5a1dc1aaa67d743c035200b40a921ce480c03db6198b754cc29b6ef0708c569f6104fe12085d53bf659beefac39d99fa0de4ccb3ee2d8eff3a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et
