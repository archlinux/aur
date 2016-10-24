# Maintainer: Tianyu Zhu <tian.tian098@gmail.com>
pkgname=postgrest
pkgver=0.3.2.0
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64' 'i686')
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
source_x86_64=("https://github.com/begriffs/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-ubuntu.tar.xz")
source_i686=("https://github.com/begriffs/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-ubuntu-x32.tar.xz")
noextract=()
md5sums_x86_64=('391c8e6a9a01b5a6723852686571e5c0')
md5sums_i686=('55be6dcbc5a9dc8654a24ff965972a1c')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
