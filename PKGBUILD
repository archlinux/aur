# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.16
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('78a9af6fd37c1f9b4b89d0f2b533a9878441ff5aaa428477811ae33aace9ccbd')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
