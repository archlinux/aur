# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.8.1
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("eavs-0.8.1-x86_64.tar.gz::https://github.com/byteowlz/eavs/releases/download/v0.8.1/eavs-v0.8.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('46eaa48ba7f8787cf055a94b01700c52651bcb686194479e77231b779f1060ef')
source_aarch64=("eavs-0.8.1-aarch64.tar.gz::https://github.com/byteowlz/eavs/releases/download/v0.8.1/eavs-v0.8.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('9b97714fcfa3038067cb4a729c3d53d21610044d94c577338890c057b47a6f0c')

package() {
    cd "$srcdir"
    install -Dm755 */bin/eavs "$pkgdir/usr/bin/eavs"
}
