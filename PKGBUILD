# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.23
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('26dc1e09f5ba9fad321ea34b3ed1ce12c183a61eb880aca82c77891c55b22182')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
