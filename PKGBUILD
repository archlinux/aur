# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.6.0
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fd9edace915703ce487a8a51140364386084a96df7dbb256defea2b838b0ad6e')
sha256sums_aarch64=('b1bc6b7c98dd37642112c2589091adb4d50df992e466b187baadc30b96af68cb')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
