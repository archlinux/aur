# Maintainer: f <f@localhost>

pkgname=postgrest-bin
pkgver=9.0.0
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
sha512sums=('92feb782fbb9373a326afb85c66080bc764be19fcf6b28c82980aaaf6f9a4efb32c1edae188c64e503807eb32cfb4a8925c0ce5403b411c91b0af6a12b1ea94d')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
