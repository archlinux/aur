# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=eavs
pkgver=0.5.6
pkgrel=1
pkgdesc="Unified API gateway for LLM providers with virtual API keys and usage tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/eavs"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/eavs/releases/download/v$pkgver/eavs-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('dff473506025b6ed5872b139763f4a0dc556a67e53bda22797bdad270d98dc90')
sha256sums_aarch64=('ab377363ed8127c697c0b5bef425712aa881dff2d02e773c1c3e109413c2d375')

package() {
    install -Dm755 eavs "$pkgdir/usr/bin/eavs"
}
