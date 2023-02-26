# Maintainer: Florine W. Dekker
pkgname="mommy"
pkgdesc="mommy's here to support you~"
pkgver=1.2.1
pkgrel=1
url="https://github.com/FWDekker/mommy"
license=("Unlicense")
arch=("any")
depends=("sh")
checkdepends=("shellspec")
source=("git+https://github.com/FWDekker/mommy.git#tag=$pkgver")
sha256sums=("SKIP")

check() {
    ./$pkgname/test.sh
}

package() {
    PREFIX="$pkgdir/usr/" "./$pkgname/build.sh" install
}
