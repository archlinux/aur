# Maintainer: svexican <svexican@fastmail.com>
pkgname=postgrest-bin
pkgver=5.2.0
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64')
url="https://github.com/begriffs/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs>=9.5')
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
sha512sums=('b18c43fdead4e2ad9b7757bd4ba6ce391c112ac5362ed2ca00de980aa1974b801877ecf4048b01a69e784adbf78cf219f4293584e0cebbea5e8289d186468d2b')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
