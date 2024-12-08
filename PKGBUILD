# Maintainer: f <f@localhost>

pkgname=postgrest-bin
pkgver=12.2.3
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
sha512sums=('673d9dab8f9e820f592af270a887945d528b30c0b7fec3476c5ef5a0e4fa5e4dcf7a6b242ae863e24b5d2ea2a6b15dd168508d82414e36f9c7646411f693eec7')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
