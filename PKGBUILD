# Maintainer: Dennis Mitten <denisukmol2002@gmail.com>
# Contributor: Dennis Mitten <denisukmol2002@gmail.com>

pkgname=librand
pkgver=0.1
pkgrel=1
pkgdesc="'True' random number generation library for linux"
arch=(x86_64)
url="https://gitlab.com/dennismitten/librand.git"
license=(GPL2)
depends=()
makedepends=('git' 'gcc')
source=("git+$url#tag=master")
sha256sums=("SKIP")

build() {
    make -C $pkgname
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
