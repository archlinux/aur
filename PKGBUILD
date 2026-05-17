# Maintainer: f <f@localhost>
#
# makepkg --printsrcinfo > .SRCINFO
#

pkgname=postgrest-bin
pkgver=14.11
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
sha512sums=('4271dd90eff56e06a28693a5de24dc7aec1f5831021c9c337ba59816e76716fd3a169c73edfaf22355c89f5200af0396dc8e40ca9ed89c11bebca474368f23f0')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
