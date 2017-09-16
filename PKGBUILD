# Maintainer: Svexican <svexican@gmail.com>
pkgname=postgrest-bin
pkgver=0.4.3.0
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64')
url="https://github.com/begriffs/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs')
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
source=("https://github.com/begriffs/postgrest/releases/download/v$pkgver/postgrest-v$pkgver-ubuntu.tar.xz")
noextract=()
sha512sums=('c4117a32704479c2c2437ff5460b9efd344223d9fd7b6b38c90831aecd9f5dcdebcadb2235d5aec0c647a2fd549a097e508fc5bd9dbbd3e56ff7a5ef76d41b03')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
