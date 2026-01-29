# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.19
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('b9833a7017a7ade4795d249f0023f4acea2e5bd17b90816164e3995b9a5d0cfe')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
