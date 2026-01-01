# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.5
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('0b714270764544fdf6f9d7aaddb5eb2cd21b34cf17c6fb9c2566b8985f8b0d21')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
