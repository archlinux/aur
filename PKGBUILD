# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.13
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b162d3aced712c424f5d81d518acd0ec10307282a3b11d51d6ef4b8565c14f4b')
sha256sums_aarch64=('c244f650bfd327211435d7d58a5a81ffaa7a74fdcad8ea67124a900197946efc')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
