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
sha256sums_x86_64=('bbdf0b2131a763ccbece3609935b318cdd0daa03fada7711e4b477d15323f93d')
sha256sums_aarch64=('36ac362f943f07123f29411a5acad4d88c3fafc0b8d3be4f29c78cc4d5668135')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
