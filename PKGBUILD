# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=scrpr
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast CLI for extracting main content from websites"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/scrpr"
license=('MIT')
conflicts=('scrpr-bin')
source_x86_64=("scrpr-1.1.1-x86_64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a06ca42a8a5951470ef3fab83ca8148464ae842bc5d52b17c083f780a30b3f3d')
source_aarch64=("scrpr-1.1.1-aarch64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('4c851081317c7eaac540a79c8896782bb37e6711cf1ec6d865257bb1739e429f')

package() {
    cd "$srcdir"
    install -Dm755 */bin/scrpr "$pkgdir/usr/bin/scrpr"
}
