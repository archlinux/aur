# Maintainer: Svexican <svexican@gmail.com>
pkgname=postgrest-bin
pkgver=0.4.2.0
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
source=("https://github.com/begriffs/postgrest/releases/download/v$pkgver/postgrest-$pkgver-ubuntu.tar.xz")
noextract=()
sha512sums=('e6e208345b83ed6a7113dfbc6cd30ac12bfa5cff1c97d2c94ba94981827560c178ae7402742e13a1892710dab3c443260fda8966e67622540afab2ad1fc6cc3c')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
