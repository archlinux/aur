# Maintainer: Zonda Yang <u226699@gmail.com>
pkgname=magic-pack-bin
pkgver=0.12.0
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
sha256sums_x86_64=('3c49c31acf24bdc9aeb9a9f27aad453dd9504caf81770daf2377e5a375d59210')
sha256sums_aarch64=('76f6b8b1073be0eddc8a0f52172e4556a23b63eae490d6d7b2e76da9159c3e46')
source_x86_64=("magic-pack-x86_64-unknown-linux-gnu.tar.gz::https://github.com/zondatw/magic-pack/releases/download/v${pkgver}/magic-pack-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("magic-pack-aarch64-unknown-linux-gnu.tar.gz::https://github.com/zondatw/magic-pack/releases/download/v${pkgver}/magic-pack-aarch64-unknown-linux-gnu.tar.gz")

package() {
    install -Dm755 "magic-pack" "$pkgdir/usr/bin/magic-pack"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
