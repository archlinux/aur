# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.5
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b95ab31cc6c63128e933293f18f9d4783fa7887a8bf6d8f111c6a506a9800d60')
sha256sums_aarch64=('3f2c8dae9e4e300806f8620d2b62884e97ca65f46bd8b4b9970d603a989d372e')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
