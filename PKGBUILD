# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-cheat
pkgver=2.2.0
pkgrel=1
pkgdesc="Cheat allows you to create and view interactive cheatsheets on the command-line."
url="https://github.com/chrisallenlane/cheat"
depends=('python' 'python-docopt')
makedepends=('python')
optdepends=('python-pygments')
license=('GPL3')
arch=('any')
source=("https://github.com/chrisallenlane/cheat/archive/${pkgver}.tar.gz")
sha256sums=('a7860535fbb4156f8bc06d901080fb0eb0ba6526bcf336a80bed8b9355656c79')

build() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/cheat-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
