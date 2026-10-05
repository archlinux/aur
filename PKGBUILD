# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=scrpr
pkgver=1.3.0
pkgrel=1
pkgdesc="A fast CLI for extracting main content from websites"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/scrpr"
license=('MIT')
conflicts=('scrpr-bin')
source_x86_64=("scrpr-1.3.0-x86_64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.3.0/scrpr-v1.3.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b2f5ea913a842c830bff5fa7bf2f805a4fae10060086f78db8412d8614118fc3')
source_aarch64=("scrpr-1.3.0-aarch64.tar.gz::https://github.com/byteowlz/scrpr/releases/download/v1.3.0/scrpr-v1.3.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('3f6c46235738031a3c5a555fbace8ffe162b49c52962cdbd2a5afefdf19f21cd')

package() {
    cd "$srcdir"
    install -Dm755 */bin/scrpr "$pkgdir/usr/bin/scrpr"
}
