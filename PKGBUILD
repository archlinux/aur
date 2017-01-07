# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=diceware
pkgver=0.9.1
pkgrel=1
pkgdesc="Wordlist-based password generator."
arch=('any')
url="https://github.com/ulif/diceware"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ulif/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4ad3b67858861b6e6444ef9fc2dd8aa0f8dc41dcd0106660431abee3be3e3e1116ead11ba59a459842bcad6959eb4daa9453fd34e50def874d9bd6bbd591d51b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 e
