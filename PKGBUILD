# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-cheat
pkgver=2.3.1
pkgrel=1
pkgdesc="Cheat allows you to create and view interactive cheatsheets on the command-line."
url="https://github.com/chrisallenlane/cheat"
depends=('python' 'python-docopt')
makedepends=('python')
optdepends=('python-pygments')
license=('GPL3')
arch=('any')
source=("https://github.com/chrisallenlane/cheat/archive/${pkgver}.tar.gz")
sha256sums=('f944612b1d1b97dbe87c6cc3c68932df983482f53a09b0446c318ee7399c865c')

build() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
