# Maintainer: f <f@localhost>

pkgname=postgrest-bin
pkgver=12.2.11
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
source=("https://github.com/PostgREST/postgrest/releases/download/v$pkgver/postgrest-v$pkgver-linux-static-x86-64.tar.xz")
noextract=()
sha512sums=('8cf79b789c9c40d3bf83023bb5d2bf85d9989b761450fdf4ed9ffefe35cfe3f013775db05163b5bb5184bddacd5d777a68420a1754e2ca78e87c5ad7e625a72b')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
