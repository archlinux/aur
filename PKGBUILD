# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-cheat
pkgver=2.2.3
pkgrel=1
pkgdesc="Cheat allows you to create and view interactive cheatsheets on the command-line."
url="https://github.com/chrisallenlane/cheat"
depends=('python' 'python-docopt')
makedepends=('python')
optdepends=('python-pygments')
license=('GPL3')
arch=('any')
source=("https://github.com/chrisallenlane/cheat/archive/${pkgver}.tar.gz")
sha256sums=('adedab2d8047b129e07d67205f5470c120dbf05785f2786520226c412508d9ee')

build() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
