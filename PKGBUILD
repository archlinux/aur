# Maintainer: f <f@localhost>

pkgname=postgrest-bin
pkgver=12.0.2
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
sha512sums=('4c3989b15d8a724a2d4ad60d60531b8335d041dd337e6e8d2d901d99bdd589feb041b28075fbae0d69e916cc5a45dcd35296266d0a3a494307ca8f3e1c108835')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
