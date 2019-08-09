# Maintainer: Étienne Deparis <etienne [at] depar.is>
# Maintainer: Richard Quirk

pkgname=aha
pkgver=0.5
pkgrel=1
pkgdesc="Ansi HTML Adapter: convert ANSI escape sequences to HTML."
arch=('any')
url="https://github.com/theZiz/aha"
license=('MPL' 'LGPL')
conflicts=('aha-git')

source=("$url/archive/${pkgver}.tar.gz")
sha512sums=('2fbf0be928d8ea0491f6710d96eddd135253cadce6cc8c00f342e03e030ee16a3ff1eb6a559740cdd642b074c9e4e3fd9a76412272ffeb0b7bb419b0dcb6dbc1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
# Local Variables:
# sh-basic-offset: 2
# End:
