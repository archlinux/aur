# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=diceware
pkgver=0.9.3
pkgrel=1
pkgdesc="Wordlist-based password generator."
arch=('any')
url="https://github.com/ulif/diceware"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ulif/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('133fcead6084d35472832b7e665c7d40fa2884e0dc09324c8bba3403310241d8c3aff4f7d36767b1017ea6ce9a397567e691b8514e40e112c11bef0fa61377df')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 e
