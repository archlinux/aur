# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=diceware
pkgver=0.9.6
pkgrel=1
pkgdesc="Wordlist-based password generator."
arch=('any')
url="https://github.com/ulif/diceware"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ulif/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('aecf8ad4e940a102795d7ff31228a5327064185a75bf8d95dd165addedbbf2c4f1ca4b608c842b637ef12fa7651d1d054da1b0f082bbd9b863a57b65985b6ad8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et
