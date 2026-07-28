# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.8.0
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("eavs-0.8.0-x86_64.tar.gz::https://github.com/byteowlz/eavs/releases/download/v0.8.0/eavs-v0.8.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('48838351c144b34d2cd1715d2c2edcc0dac4c69f1c4b1f73b44dbdf25e95e6ae')
source_aarch64=("eavs-0.8.0-aarch64.tar.gz::https://github.com/byteowlz/eavs/releases/download/v0.8.0/eavs-v0.8.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('3cb27f311cc4f6f7f5bd8cfb3112dc5d53e5caa48c1bfe2a543d115de6a50872')

package() {
    cd "$srcdir"
    install -Dm755 */bin/eavs "$pkgdir/usr/bin/eavs"
}
