# Maintainer: svexican <svexican@fastmail.com>
pkgname=postgrest-bin
pkgver=5.1.0
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64')
url="https://github.com/begriffs/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs>=9.4')
makedepends=()
checkdepends=()
optdepends=()
provides=('postgrest' 'postgrest-bin')
conflicts=('postgrest')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/PostgREST/postgrest/releases/download/v$pkgver/postgrest-v$pkgver-ubuntu.tar.xz")
noextract=()
sha512sums=('b22e6e3f026c940556d2c1c7ba0f1209618adc2ea5c48b3c17bc61ff299cecdd89dc53ce5b402aeedadee82e8696a950d90b862a03094938611b3c94a0922568')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
