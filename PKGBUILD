# Maintaner: jskier <jay@jskier.com>
# Contributor: jskier <jay @jskier.com>
pkgname=python-authy
pkgver=2.2.3
pkgrel=2
pkgdesc="A module for using the Twilio Authy REST API"
arch=('any')
url="https://github.com/twilio/authy-python"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-six' 'python-simplejson'
	'python-mockito' 'python-mock' 'python-bumpversion')
options=(!emptydirs)
source=("https://github.com/twilio/authy-python/archive/v${pkgver}.tar.gz")
sha256sums=('a52eee2f776730d58bd1e521b57de985ef08b83f36a9b1ef18bfc8926485103b')

package() {
  cd "$srcdir/authy-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

