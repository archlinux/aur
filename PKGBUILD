# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-cheat
pkgver=2.2.2
pkgrel=1
pkgdesc="Cheat allows you to create and view interactive cheatsheets on the command-line."
url="https://github.com/chrisallenlane/cheat"
depends=('python' 'python-docopt')
makedepends=('python')
optdepends=('python-pygments')
license=('GPL3')
arch=('any')
source=("https://github.com/chrisallenlane/cheat/archive/${pkgver}.tar.gz")
sha256sums=('d898247e4d74e71afbf05943ca1430b3526cd8ec573fe3ee20e73bafcacc0e63')

build() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
