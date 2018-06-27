# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=diceware
pkgver=0.9.5
pkgrel=1
pkgdesc="Wordlist-based password generator."
arch=('any')
url="https://github.com/ulif/diceware"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ulif/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('cd7c60d85b48f1fb597b147d029b2adcdb4f130b5822c2de2a50be7b042b704f00e35bc25824fea2edf2ee250f7782e9967ed075659be1ec0d59f18eb7c57105')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et
