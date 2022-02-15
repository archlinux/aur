# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=diceware
pkgver=0.10
pkgrel=1
pkgdesc="Wordlist-based password generator."
arch=('any')
url="https://github.com/ulif/diceware"
license=('GPL3')
depends=('python-setuptools')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ulif/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8fa8979c39ccb4b4a2de2f326794d3ea685edfb280fc24b0709a891636201d7c2206e5a804705132facf2f9c81866f32c3f950817fa5fc88cc2bf0300c62d9ba')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et
