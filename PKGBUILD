# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=gpgsync
pkgver=0.3.3
pkgrel=1
pkgdesc="A tool to let users always have up-to-date public keys for other members of their organization."
arch=('any')
url="https://github.com/firstlookmedia/gpgsync/"
license=('GPL3')
depends=('python-setuptools' 'python-pyqt5' 'python-nose' 'python-requests' 'python-socks' 'python-packaging' 'python-dateutil' 'gnupg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firstlookmedia/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('27264a7582068a2fa6bd2fbf85e7d9d15b61535ed2df96624f29e1ac0efc5367df90b274b1822bef71358b58a7753c7b20073aafc0bec22c71741f24bd51061f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et
