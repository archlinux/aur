# Maintainer: fabbe <mail@fabbe.io>

pkgname=postgrest-bin
pkgver=6.0.2
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
source=("https://github.com/PostgREST/postgrest/releases/download/v$pkgver/postgrest-v$pkgver-linux-x64-static.tar.xz")
noextract=()
sha512sums=('0443c13722ecbb49408993b9af0f126074937c548a7041e1634d11ad7fe148f4370a4087a1ed33e60e881c13eed02665d82f69f2622a73924f9b8af3bdd1ba60')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
