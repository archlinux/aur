# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.9
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c80bc1a48280743a4332ce1faad9f74009c9cec934aa30da17770dd07525015e')
sha256sums_aarch64=('0c402753619c8b70af6145346aeedb5cdc583dff4f1e64defcc7f71caac42a86')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
