# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.10
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('496e86c17adc911d34eabc08f43ea6c6cb5a577de43a212f33a31d6f92b366d7')
sha256sums_aarch64=('ad5c6cd96670cc562dc7d1fab3a07f2ccd3de71b7e10af0c09570e5b20ee3201')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
