# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=diceware
pkgver=0.9.4
pkgrel=1
pkgdesc="Wordlist-based password generator."
arch=('any')
url="https://github.com/ulif/diceware"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ulif/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('26a274d4cb4dc3461a817d7b4eed4e40b3b16808d695017c86c86fc237c2873b2558d4368892b46854b135fcf12962749f13f5a1e87a3f5ace35382706deff81')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et
