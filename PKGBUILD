# Maintainer: Étienne Deparis <etienne [at] depar.is>
# Maintainer: Richard Quirk

pkgname=aha
pkgver=0.5.1
pkgrel=1
pkgdesc="Ansi HTML Adapter: convert ANSI escape sequences to HTML."
arch=('any')
url="https://github.com/theZiz/aha"
license=('MPL' 'LGPL')
conflicts=('aha-git')

source=("$url/archive/${pkgver}.tar.gz")
sha512sums=('0eb88e681208c0956e344d6574f9d7ba155d38bfb386d0a9f17022c5e925fb16d0efb6aa04804191b4cac1697a87a0f16ba51bcd97b6135cc7606046eaf89288')

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
