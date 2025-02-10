# Maintainer: schaap137 <dojo86@gmail.com>

pkgname=draai
pkgver=20250202
pkgrel=3
pkgdesc="Draai is a wrapper around mpc, making playing music from the commandline more enjoyable."
arch=('x86_64')
url='http://mdcc.cx/pub/draai/draai-latest/man/draai.html'
license=('GPL3')
depends=('mpc' 'zsh')
source=(http://mdcc.cx/pub/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.asc})
sha512sums=('a4c81e6456ab656bb48a44a12faf6b2e954f78d3992e3f22ea5ac2e5077de46c6cfa51c60cdbff7b6c17dc1f94c7b2d79ee666584b372916355b9784874a5685'
            'SKIP')
validpgpkeys=('B8FAC2E250475B8CE940A91957930DAB0B86B067') # Joost van Baal <joostvb@mdcc.cx>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./setup --prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

