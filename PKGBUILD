# Maintainer: Thomas Marchand <thomas@thomas.md>
pkgname=shard
pkgver=0.1.20
pkgrel=1
pkgdesc="A minimal, content-addressed Minecraft launcher (CLI)"
arch=('x86_64')
url="https://shard.thomas.md"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/th0rgal/shard/releases/download/v${pkgver}/shard-cli-linux-x64.tar.gz")
sha256sums=('f39336c4f6acc9647b8714d2f7c33f86d82f12fac621b502b5a1df7a5c66b728')

package() {
    install -Dm755 shard "${pkgdir}/usr/bin/shard"
}
