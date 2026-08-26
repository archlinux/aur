# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=scrpr
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast CLI for extracting main content from websites"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/scrpr"
license=('MIT')
conflicts=('scrpr-bin')
source_x86_64=("scrpr-1.2.0-x86_64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.2.0/scrpr-v1.2.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e6478dd171805aed9c9f7a579afc0d98bd17e831b477de55adca86816058394e')
source_aarch64=("scrpr-1.2.0-aarch64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.2.0/scrpr-v1.2.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('30df7bcaa1fe417302fd2dd71ccdf5ce60a367b87d1c33960b24f83927ab945a')

package() {
    cd "$srcdir"
    install -Dm755 */bin/scrpr "$pkgdir/usr/bin/scrpr"
}
