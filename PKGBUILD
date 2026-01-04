# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.9
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('008d0f5a8acc2f4db82959447f455bead67302f06dc4b412d7246db11b752f14')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
