# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.13
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('335788ab9cd0d46f188aac452a0df0deeb53be7540b8b6bbef681b0b8105db95')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
