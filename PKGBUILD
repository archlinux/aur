# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.12
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5e53d38d191f22eef15bd452ec190137877b5553e8e0820d41ece954c9a7da79')
sha256sums_aarch64=('f984d5d33fff642470fe0420c59a5975f9dfd3fe0899d9558367a9eab262fcd9')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
