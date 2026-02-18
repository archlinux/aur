# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.8
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('69d9a950a8039775c4ffef13a6e28ebf27aa9c0bea42bd73ea3938c429ae1311')
sha256sums_aarch64=('56211b5c4f376b3e240acd405d0dc22ebb2700efeceed2e19eceae31d1e80737')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
