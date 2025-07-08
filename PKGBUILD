# Maintainer: f <f@localhost>
#
# makepkg --printsrcinfo > .SRCINFO
#

pkgname=postgrest-bin
pkgver=13.0.4
pkgrel=1
epoch=
pkgdesc="Serve a RESTful API from any Postgres database"
arch=('x86_64')
url="https://github.com/PostgREST/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs>=12')
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
sha512sums=('0f90872f5aa0b7351bc03665b1ae9d454fc32cfa8af06ebcd51dd2059ea7a1fd8a38353f109c7862f5d1b99c6e5143eb54bdb88601908ebb280de36003882055')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
