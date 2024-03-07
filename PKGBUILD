# Maintainer: schaap137 <dojo86@gmail.com>

pkgname=draai
pkgver=20201215
pkgrel=1
pkgdesc="Draai is a wrapper around mpc, making playing music from the commandline more enjoyable."
arch=('x86_64')
url='http://mdcc.cx/pub/draai/draai-latest/man/draai.html'
license=('GPL3')
depends=('mpc')
source=(http://mdcc.cx/pub/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.asc})
sha512sums=('7c0c57d95bd9923bed2a93c616cfbc05f1d2a9db851468a8a3e41fe66010ec19e553c55d4a2815ff12e8ca30437575739d977646ea4f4f0ac775d172e5e589df'
            'SKIP')
validpgpkeys=('B8FAC2E250475B8CE940A91957930DAB0B86B067') # Joost van Baal <joostvb@mdcc.cx>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./setup --prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

