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
sha256sums_x86_64=('ffc93f0ffd1f8e2300c1fbe676733d8a8176bb28b111e3e1d66451e450c49310')
source_aarch64=("scrpr-1.1.1-aarch64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('155733c76ad7d399d3b5c0b0e80628d476912cd0fe70d701b575552a4c2368ef')

package() {
    cd "$srcdir"
    install -Dm755 */bin/scrpr "$pkgdir/usr/bin/scrpr"
}
