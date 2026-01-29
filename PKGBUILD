# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.24
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('fe4d528b4c9cc375f8302531d6e86adef80029c3ec48488e6f5c95d7d0597f9a')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
