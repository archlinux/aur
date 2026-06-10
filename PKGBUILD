# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.7.0
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cbf541afa6b4d56ef1302910e6ee2deec92a66d51bbed4729f5d5bf9f70f4ec5')
sha256sums_aarch64=('4df3efd4d4a58ea5894312e96062838c741002b833caaa2321e474937f1e5249')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
