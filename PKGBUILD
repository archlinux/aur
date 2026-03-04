# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.14
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5e96a9abc003ce1f5a328624efa9ac90aae080d0ec8e728a8400214efd79af6a')
sha256sums_aarch64=('8abf993a97704b09068c0d519f4ca6169ca0fe27f0a29574de48e4d8fb62cebf')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
