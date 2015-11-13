# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=pwgen-passphrase
pkgver=1.0
pkgrel=1
pkgdesc="Secure wordlist-based passphrase generator"
arch=('any')
url="https://github.com/xmikos/pwgen-passphrase"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pyqt5: copying to clipboard')
source=(https://github.com/xmikos/pwgen-passphrase/archive/v$pkgver.tar.gz)
sha256sums=('f2cc0eb6e21f9910831201acf5193fe52dbc52716ab81b6896bfb228f8e1bdd9')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
