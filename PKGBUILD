# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=v1.0.0_rc1
pkgrel=1

pkgdesc="Lightweight, native cross-platform implementation of cqhttp in Golang."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/Mrs4s/go-cqhttp/releases"
license=("AGPL3")

optdepends=("ffmpeg: support voice sending in any format")

provides=('go-cqhttp')

source_i686=("${pkgname}-i686-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_arm64.tar.gz")

sha512sums_i686=('cbdad06060ffd4ad77105cdf846743b96ce42c5a862c7fa86cf0941614d7645362eede8dea7b943e9855ea6f42b967ed46fb5bf60da6e044344f1e078856d74b')
sha512sums_x86_64=('d088950d321a5804aa9e5e658575eddfba5eeff69dee0a35ff600396f15cc28fead5e3d3581ab78c27d39f48d40fa2ec0a5e6dd360b1fbdf2a026be2fc4028fa')
sha512sums_armv7h=('9f54f98c47137819838e0051ec5cd85748669c2cbe7690f96465056c086de6c25004c7228d78f314bad7ea5ef6c4e9a6dc436888947c0d19ccb85c43ea6a2a2f')
sha512sums_aarch64=('15467ee2275e33f9fac77bf21cdbac7bb86553875b6f09c6f279c0d28a4eb1aeb49ade76fd251d66bbc46cdc2a054e384ae2e799c7e6c47bb382a18f3d8d755a')

package() {
    cd ${srcdir}
    install -Dm755 "go-cqhttp" "${pkgdir}/usr/bin/go-cqhttp"
}
