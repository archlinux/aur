# Maintainer: fabbe <fabbe@carajo.no>

pkgname=postgrest-bin
pkgver=8.0.0
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64')
url="https://github.com/PostgREST/postgrest"
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
sha512sums=('23a4652439035d791981c3c27c8fa7e2f88bc59b20e2874b036b6d2e5146221952ca3de2bb40d6c8839cd89b68078d5a0e50512345b41400933fe863745a1ecb')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
