# Maintainer: f <f@localhost>

pkgname=postgrest-bin
pkgver=12.2.2
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64')
url="https://github.com/PostgREST/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs>=9.6')
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
source=("https://github.com/PostgREST/postgrest/releases/download/v$pkgver/postgrest-v$pkgver-linux-static-x64.tar.xz")
noextract=()
sha512sums=('5f177059624e19d31924d336ffdf4e89666f9a5e0de38576960144dcb8907539853a2464aba5d2156300d35ade8318365cb5b781e0373e5355026907aede8580')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
