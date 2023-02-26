# Maintainer: Florine W. Dekker
pkgname="mommy"
pkgdesc="mommy's here to support you~"
pkgver=1.2.1
pkgrel=2
url="https://github.com/FWDekker/mommy"
license=("Unlicense")
arch=("any")
depends=("sh" "man-db")
checkdepends=("shellspec")
source=("git+https://github.com/FWDekker/mommy.git#tag=v$pkgver")
sha256sums=("SKIP")

check() {
    ./$pkgname/test.sh
}

package() {
    PREFIX="$pkgdir/usr/" "./$pkgname/build.sh" install
}
