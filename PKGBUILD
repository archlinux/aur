# Maintainer: f <f@localhost>
#
# makepkg --printsrcinfo > .SRCINFO
#

pkgname=postgrest-bin
pkgver=16.3
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
sha512sums=('d181ca8f3d41f147451b14f73aa14fa252c58fa24948d1220706e172f2850543fd8992dfd78791503609457f814a691fd583c6bb0eb4b14a20a6bd2a6b12e8aa')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
