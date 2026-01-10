# Maintainer: rownix101 <your-email@example.com>
pkgname=zigmir-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A blazing-fast Arch Linux mirror speed tester written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/rownix101/zigmir"
license=('MIT')
provides=('zigmir')
conflicts=('zigmir')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/rownix101/zigmir/releases/download/v0.1.1/zigmir-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/rownix101/zigmir/releases/download/v0.1.1/zigmir-linux-arm64")
sha256sums_x86_64=('a2ca5201178fd3d005a63f5c0ce88faba2d750c5cb5fbbfd522632be2be59ec7')
sha256sums_aarch64=('c445aa79b575afb62678a78d514f042afa7fbf5346701b74bfc339dc79aaceb3')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zigmir"
}
