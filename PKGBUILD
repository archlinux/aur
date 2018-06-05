# Maintainer: svexican <svexican@fastmail.com>
pkgname=postgrest-bin
pkgver=0.5.0.0
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64')
url="https://github.com/begriffs/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs>=9.4')
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
sha512sums=('c5716ba667437ee4c382e50d9f6155a34e2f252950786a1851c370e746a98c0fa2dc15e188604706228359dd5da0b491189f018a6ea303ccbabaa6d4d0c642a0')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
