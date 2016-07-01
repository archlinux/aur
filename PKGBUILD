# Maintainer: Tianyu Zhu <tian.tian098@gmail.com>
pkgname=postgrest
pkgver=0.3.2.0
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
provides=('postgrest')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/begriffs/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-ubuntu.tar.xz")
noextract=()
md5sums=('391c8e6a9a01b5a6723852686571e5c0')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
