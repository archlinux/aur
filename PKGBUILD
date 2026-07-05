# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.7.3
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("eavs-0.7.3-x86_64.tar.gz::https://github.com/byteowlz/eavs/releases/download/v0.7.3/eavs-v0.7.3-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e257d199d07027838b9044e91ccd17e91138f549b7d3deb55af98d09489eb15a')
source_aarch64=("eavs-0.7.3-aarch64.tar.gz::https://github.com/byteowlz/eavs/releases/download/v0.7.3/eavs-v0.7.3-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('c1faa84baace756b9013be7cf86accaf3c514715deb2d23deb71ab54735d08f9')

package() {
    cd "$srcdir"
    install -Dm755 */bin/eavs "$pkgdir/usr/bin/eavs"
}
