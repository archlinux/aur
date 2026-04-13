# Maintainer: Zonda Yang <u226699@gmail.com>
pkgname=magic-pack-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A CLI tool for compressing and decompressing files with multiple formats (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/zondatw/magic-pack"
license=('MIT')
depends=('glibc')
provides=('magic-pack')
conflicts=('magic-pack')
source=("LICENSE::https://raw.githubusercontent.com/zondatw/magic-pack/v${pkgver}/LICENSE")
sha256sums=('f5367b2d3288fc388139fb118d5996d93486a245001c5d2dbf3ae9aea8d5d202')
sha256sums_x86_64=('133d32b0371bca4e392c764ce12b693ebaed9df3a1bb662bb86080862422460a')
sha256sums_aarch64=('75b2cfb7963431dbfac9d30ce52fc9181ebad9708c9b781b9a89eac29219a553')
source_x86_64=("magic-pack-x86_64-unknown-linux-gnu.tar.gz::https://github.com/zondatw/magic-pack/releases/download/v${pkgver}/magic-pack-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("magic-pack-aarch64-unknown-linux-gnu.tar.gz::https://github.com/zondatw/magic-pack/releases/download/v${pkgver}/magic-pack-aarch64-unknown-linux-gnu.tar.gz")

package() {
    install -Dm755 "magic-pack" "$pkgdir/usr/bin/magic-pack"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
