# Maintainer: f <f@localhost>

pkgname=postgrest-bin
pkgver=12.2.6
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
sha512sums=('935b3d516e996f6d25948ba8a54c1b7f70f7f0e3f517e36481fdf0196c2c5cfc2841f86e891f3df9517746b7fb605db47cdded1b8ff78d9482ddaa621db43a34')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
