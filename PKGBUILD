# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=mpfshell
pkgver=0.9.1
pkgrel=1
pkgdesc="A simple shell based file explorer for ESP8266 Micropython based devices"
arch=('any')
url="https://github.com/wendlers/mpfshell"
license=('MIT')
depends=('python' 'python-pyserial' 'python-colorama' 'python-websocket-client')
options=(!emptydirs)
source=("https://github.com/wendlers/mpfshell/archive/v${pkgver}.tar.gz")
sha512sums=('87eaa329077c0e89c7f018b78a988c7f0b1c54d940fda988de5b79f1580146104df3e8d7bc42b9c5a9fe2aa1e3062c6e20c1427fed71aceaa8770cbd8b66d535')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
