# Maintainer: svexican <svexican@fastmail.com>
pkgname=postgrest-bin
pkgver=6.0.0
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
sha512sums=('640829c160cb21f75a9d524d384508d59b29969d6f9de195c2f60a9be757dbeb193be9b00245b3686aa9b192d1bf8406305c480277fd626d9452cb3529a89b3f')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
