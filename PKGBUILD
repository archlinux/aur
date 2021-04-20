# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=plank-docklet-picky
pkgver=1.0.0
pkgrel=1
pkgdesc="Color Picker docklet for Plank (elementary os dock)."
arch=("x86_64")
url="https://github.com/hannenz/picky"
license=("Unknown")
depends=("plank")
makedepends=("cmake" "vala")
source=("$pkgname-$pkgver.zip::$url/archive/refs/heads/master.zip")
md5sums=("SKIP")

build() {
  cd "picky-master"
  make
}

package() {
  cd "picky-master"
  install -D libdocklet-picky.so $pkgdir/usr/lib/plank/docklets/libdocklet-picky.so
}
