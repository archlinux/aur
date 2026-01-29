# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.21
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('6981bffd11c2d371ca4302d3f0bf7f4b36d260679e11022800232816aed3935d')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
