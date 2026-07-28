# Maintainer: f <f@localhost>
#
# makepkg --printsrcinfo > .SRCINFO
#

pkgname=postgrest-bin
pkgver=14.16
pkgrel=1
epoch=
pkgdesc="Serve a RESTful API from any Postgres database"
arch=('x86_64')
url="https://github.com/PostgREST/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs>=13')
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
sha512sums=('aa8f4d5e6c8ae3527bb56d085eb5e5d05267c65111ae822c1cabb429575d90ec0be6bb03961a0c984bb829233244b0449860994dc2600deb33c6cc1caf86116b')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
