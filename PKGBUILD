# Maintainer: svexican <svexican@fastmail.com>
pkgname=postgrest-bin
pkgver=0.4.4.0
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
sha512sums=('3ab349e35159353e42ce2fda741620c20e4f91f99f039b0a05caa64274de8aacfcb6a4afd0cd0b568a20cc4f6c3ca4c5832600d5da4543a0ee5a187e03b627f6')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
