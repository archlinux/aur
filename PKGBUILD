# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=scrpr
pkgver=1.1.2
pkgrel=1
pkgdesc="A fast CLI for extracting main content from websites"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/scrpr"
license=('MIT')
conflicts=('scrpr-bin')
source_x86_64=("scrpr-1.1.2-x86_64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.1.2/scrpr-v1.1.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('be4df1ee799b8679e8de4431ae46203bb7f03be042e5226b5c3ac5453b8d7fa6')
source_aarch64=("scrpr-1.1.2-aarch64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.1.2/scrpr-v1.1.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('204fad2d156f44d44a8118b2e31ef3cd6d0976db7a1470c45cb76cd40590d424')

package() {
    cd "$srcdir"
    install -Dm755 */bin/scrpr "$pkgdir/usr/bin/scrpr"
}
