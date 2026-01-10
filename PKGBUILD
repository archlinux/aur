# Maintainer: rownix101 <your-email@example.com>
pkgname=zigmir-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A blazing-fast Arch Linux mirror speed tester written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/rownix101/zigmir"
license=('MIT')
provides=('zigmir')
conflicts=('zigmir')
source_x86_64=("--x86_64::https://github.com/rownix101/zigmir/releases/download/v0.1.0/zigmir-linux-amd64")
source_aarch64=("--aarch64::https://github.com/rownix101/zigmir/releases/download/v0.1.0/zigmir-linux-arm64")
sha256sums_x86_64=('b56e0616a209e2dd29623420deda4a84db2035b14b60763114d867c0bce1485b')
sha256sums_aarch64=('630702ebecd0fb4ebe8137a7d0cfe4b498df520764e31239b3f529b2eb9a88e4')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zigmir"
}
