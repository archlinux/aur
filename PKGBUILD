# Maintainer: f <f@localhost>
#
# makepkg --printsrcinfo > .SRCINFO
#

pkgname=postgrest-bin
pkgver=13.0.6
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
sha512sums=('f160d400e498ee33a46c0c2bf151a7ca40438debcb3c947d0a7e12388a7ff39af386899e14a219a4eaf4a003f37c2dfacd9ea3d5d4e1753048e6b4f9bfc46037')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
