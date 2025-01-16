# Maintainer: mendes <ourodoroger@gmail.com>
pkgname=amandadb
pkgver=1.1.3
pkgrel=1
pkgdesc="Simple Rust database inspired by Redis"
arch=(x86_64)
url="https://github.com/Pedrinjs/AmandaDB"
license=('GPL')
depends=()
makedepends=('git' 'cargo')
source=("${pkgname}-${pkgver}::git+${url}.git")
noextract=()
sha256sums=("SKIP")

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make PKGDIR="$pkgname" install
}
