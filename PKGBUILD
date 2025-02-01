# Maintainer: f <f@localhost>

pkgname=postgrest-bin
pkgver=12.2.6
pkgrel=2
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
source=("https://github.com/PostgREST/postgrest/releases/download/v$pkgver/postgrest-v$pkgver-linux-static-x86-64.tar.xz")
noextract=()
sha512sums=('b0415ca9e908c4b550ac4049503bea7d81fd88117d54a09f02aa7f728b38a2b7ce8408e558c6249aa55d63e07599787e46401846adf7839c2d33ad2bea3d7772')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
